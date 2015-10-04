using Seismic

SCRATCH_PATH = "/global/scratch/stanton/kevins_model/elastic/"

# initialize only 1 process per node
#Seismic.bind_torque_procs(1)
#@everywhere using Seismic

# for each node, migrate 1 common shot gather using 12 threads per node. 
param = {"Niter"=>5,"cost"=>"cost.txt","mu"=>[0.0 0.0 0.0],"precon"=>false,
"vp"=>join([SCRATCH_PATH,"prep/vp"]), "vs"=>join([SCRATCH_PATH,"prep/vs"]), "wav"=>join([SCRATCH_PATH,"prep/wav"]),
"angx"=>join([SCRATCH_PATH,"prep/angx"]),"angy"=>join([SCRATCH_PATH,"prep/angy"]),
"pade_flag"=>"n",
"damping"=>10000000,
"sz"=>10, "gz"=>550,
"fmin"=>1., "fmax"=>50.,
"padt"=>2, "padx"=>2,
"nangx"=>29, "oangx"=>-70, "dangx"=>5,
"nangy"=>1, "oangy"=>0, "dangy"=>2,
"nhx"=>1653, "ohx"=>-3304, "dhx"=>4,
"nhy"=>1, "ohy"=>0, "dhy"=>4,
"verbose"=>"y",
"dip"=>"../prep/dipx_slope","Nsmooth"=>3,"Nsmooth2"=>5};
#param["sx"] = [100.0:100.0:6900.0];
#param["sy"] = [100.0:100.0:6900.0]*0;
param["sx"] = [3600.0:100.0:3600.0];
param["sy"] = [3600.0:100.0:3600.0]*0;
m0 = [join([SCRATCH_PATH,"adj/mpp"]);join([SCRATCH_PATH,"adj/mps1"]);join([SCRATCH_PATH,"adj/mps2"])]
m = [join([SCRATCH_PATH,"inv/mpp"]);join([SCRATCH_PATH,"inv/mps1"]);join([SCRATCH_PATH,"inv/mps2"])]
d = [join([SCRATCH_PATH,"prep/ux_1shot"]);join([SCRATCH_PATH,"prep/uy_1shot"]);join([SCRATCH_PATH,"prep/uz_1shot"])]
ShotProfileLSEWEM(m,m0,d,param);

