from prody import *
from numpy import *
from string import Template
struct = parsePDB('HA2.ca.pdb') #include new pdb file from indices.tcl run this indivually for each combination 
traj = Trajectory('')

traj.addFile('HA2.ca.dcd') #include respective dcd name for the pdb file

traj.link(struct)
traj.setCoords(struct)
traj.setAtoms(struct.ca)

eda=EDA('all')
eda.buildCovariance(traj)
eda.calcModes()
saveModel(eda)

#eda = loadModel("all.eda.npz")

writeNMD('eda-all.nmd', eda[:20], struct.ca) #generates 20 modes of calculations
trajs=traj[:]
trajs.superpose() #aligns the trajectories
proj = calcProjection(trajs,eda[:20],rmsd=True, norm=False)
writeArray("projection-all.txt",proj,format="%f")
fract=calcFractVariance(eda[:20])
writeArray("fract-all.txt",fract,format="%f")

quit()
