using Seismic

SCRATCH_PATH = "/global/scratch/stanton/kevins_model/elastic/"

# compute angles wrt reflector normal
param = {"vel"=>join([SCRATCH_PATH,"prep/vp"]), "wav"=>join([SCRATCH_PATH,"prep/wav"]),
"dip_flag"=>"y","dipx"=>join([SCRATCH_PATH,"prep/dipx"]),"dipy"=>join([SCRATCH_PATH,"prep/dipy"]),
"sz"=>10,"fmin"=>20., "fmax"=>30.,
"nhx"=>827, "ohx"=>-3304, "dhx"=>8,
"nhy"=>1, "ohy"=>0, "dhy"=>8,
"omp"=>8,"verbose"=>"y"};
param["sx"] = [100.0:100.0:6900.0];
param["sy"] = [100.0:100.0:6900.0]*0;
ComputeAngles(join([SCRATCH_PATH,"prep/angx"]),join([SCRATCH_PATH,"prep/angy"]),param);

