using Seismic

param = {"Niter"=>5,"mu"=>10,"cost"=>"cost.txt",
    "vel"=>"../prep/vp", "wav"=>"../prep/wav",
    "angx"=>"../prep/angx","angy"=>"../prep/angy",
    "pade_flag"=>"n",
    "sz"=>10, "gz"=>550,
    "fmin"=>1., "fmax"=>50.,
    "padt"=>2, "padx"=>2,
    "nangx"=>71, "oangx"=>-70, "dangx"=>2,
    "nangy"=>1, "oangy"=>0, "dangy"=>2,
    "nhx"=>827, "ohx"=>-3304, "dhx"=>8,
    "nhy"=>1, "ohy"=>0, "dhy"=>8,
    "omp"=>16,"verbose"=>"y",
    "Nsmooth"=>5,"Nsmooth2"=>5,"dip"=>"../prep/dipx_slope"};
param["sx"] = [100.0:100.0:6900.0];
param["sy"] = [100.0:100.0:6900.0]*0;
ShotProfileLSWEM("mpp","../adj/mpp","../prep/uz",param)

