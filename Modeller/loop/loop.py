
# Run this script with something like
#    python loop.py N > N.log
# where N is an integer from 1 to the number of models.
#
# ModLoop does this for N from 1 to 300 (it runs the tasks in parallel on a
# compute cluster), then returns the single model with the best (lowest)
# value of the Modeller objective function.

from modeller import *
from modeller.automodel import *
import sys

# to get different starting models for each task
taskid = int(sys.argv[1])
env = environ(rand_seed=-1000-taskid)

class MyLoop(loopmodel):
    def select_loop_atoms(self):
        rngs = (
           self.residue_range('195:A', '214:A'),
        )
        for rng in rngs:
            if len(rng) > 30:
                raise ModellerError("loop too long")
        s = selection(rngs)
        if len(s.only_no_topology()) > 0:
            raise ModellerError("some selected residues have no topology")
        return s

m = MyLoop(env, inimodel='input.pdb',
           sequence='loop')
m.loop.md_level = refine.slow
m.loop.starting_model = m.loop.ending_model = taskid

m.make()
