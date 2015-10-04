using Seismic

nt = 1000
dt = 0.0005
w = vec(Seismic.Ricker(40,dt))
wav = [w;zeros(Float32,nt-length(w))]
nz = 2000
nx = 2000
vel = 0.2*ones(Float32,nz,nx)
vel[1250:end,:] = 0.24
param = {"nt"=>nt,"dt"=>dt,"wav"=>wav,"nz"=>nz,"dz"=>2,"nx"=>nx,"dx"=>2,"vel"=>vel,"sx"=>2000.,"sz"=>2000,"gz"=>2000}
d,wfld = SeisAcousticFDMod(param)
println(maximum(wfld))
