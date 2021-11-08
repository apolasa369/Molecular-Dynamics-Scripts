from prody import *
from numpy import *
data=parseArray('pa.txt')
cntr=data.mean(axis=0)
N=data.shape[0]
n=data.shape[1]/3
coords=zeros((N,n,3))
for i in range(N):
    for j in range(n):
	for k in range(3):
	    data[i,3*j+k]-=cntr[3*j+k]
	    coords[i,j,k]=data[i,3*j+k]
	    
pca = PCA('papc')
pca.buildCovariance( coords )
pca.calcModes()
saveModel(pca)

#pca = loadModel("6-all.pca.npz")

vals=pca.getEigvals()
vecs=pca.getEigvecs()
fract=calcFractVariance(pca)

writeArray("papc-vals.txt",vals,format="%f")
writeArray("papc-vecs.txt",vecs,format="%f")
writeArray("papc-frac.txt",fract,format="%f")

proj=dot(data,vecs)
writeArray("papc-proj.txt",proj,format="%f")

quit()
