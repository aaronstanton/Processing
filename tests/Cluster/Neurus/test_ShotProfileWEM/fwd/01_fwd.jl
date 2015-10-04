using Seismic

param = ["adj"=>false,
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
    "omp"=>16,"verbose"=>"y"];
param["sx"] = [3600.0:100.0:3600.0];
param["sy"] = [3600.0:100.0:3600.0]*0;
ShotProfileWEM("../adj/mpp","uz_1shot",param);

