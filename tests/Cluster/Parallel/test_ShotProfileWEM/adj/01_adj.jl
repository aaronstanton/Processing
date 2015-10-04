using Seismic

# initialize only 1 process per node
Seismic.bind_torque_procs(1)

@everywhere using Seismic

# for each node, migrate 1 common shot gather using 12 threads per node. 
param = ["adj"=>"y",
    "vel"=>"../prep/vp", "wav"=>"../prep/wav",
    "angx"=>"../prep/angx","angy"=>"../prep/angy",
    "pade_flag"=>"y",
    "sz"=>10, "gz"=>550,
    "fmin"=>1., "fmax"=>50.,
    "padt"=>2, "padx"=>2,
    "nangx"=>71, "oangx"=>-70, "dangx"=>2,
    "nangy"=>1, "oangy"=>0, "dangy"=>2,
    "nhx"=>827, "ohx"=>-3304, "dhx"=>8,
    "nhy"=>1, "ohy"=>0, "dhy"=>8,
    "omp"=>12,"verbose"=>"y"];
param["sx"] = [100.0:100.0:6900.0];
param["sy"] = [100.0:100.0:6900.0]*0;
ShotProfileWEM("../prep/uz","mpp",param);

