# A sample script for fully automated comparative modeling
from modeller import *
from modeller.automodel import *    # Load the automodel class

log.verbose()
env = environ()

# directories for input atom files
env.io.atom_files_directory = ['.']

a = automodel(env,
              # file with template codes and target sequence
              alnfile  = 'comb.ali',
              # PDB codes of the templates
              knowns   = ('3ui2', '5e4w'),
              # code of the target
              sequence = 'comb')
a.auto_align()                      # get an automatic alignment
a.make()                            # do comparative modeling
