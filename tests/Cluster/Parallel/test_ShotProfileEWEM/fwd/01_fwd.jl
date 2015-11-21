using Seismic

# for each node, migrate 1 common shot gather using 12 threads per node. 
param = {"adj"=>false,
    "vp"=>"../prep/vp", "vs"=>"../prep/vs", "wav"=>"../prep/wav",
    "angx"=>"../prep/angx_1shot","angy"=>"../prep/angy_1shot",
    "pade_flag"=>"n",
    "damping"=>1000,
    "sz"=>10, "gz"=>550,
    "fmin"=>1., "fmax"=>50.,
    "padt"=>2, "padx"=>2,
    "nangx"=>1, "oangx"=>0, "dangx"=>5,
    "nangy"=>1, "oangy"=>0, "dangy"=>2,
    "nhx"=>827, "ohx"=>-3304, "dhx"=>8,
    "nhy"=>1, "ohy"=>0, "dhy"=>8,
    "omp"=>12,"verbose"=>true};
    #"nangx"=>29, "oangx"=>-70, "dangx"=>5,
param["sx"] = [3600.0:100.0:3600.0];
param["sy"] = [3600.0:100.0:3600.0]*0;
m = ["../adj/mpp";"../adj/mps1";"../adj/mps2"];
d = ["ux_fwd";"uy_fwd";"uz_fwd"];
ShotProfileEWEM(m,d,param);

