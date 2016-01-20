using Seismic

param = {"adj"=>true,
    "vp"=>"../prep/vp", "vs"=>"../prep/vs", "wav"=>"../prep/wav",
    "angx"=>"../prep/angx","angy"=>"../prep/angy",
    "sz"=>10, "gz"=>550,
    "fmin"=>1., "fmax"=>50.,
    "padt"=>2, "padx"=>2,
    "nangx"=>21, "oangx"=>-50, "dangx"=>5,
    "nangy"=>1, "oangy"=>0, "dangy"=>2,
    "nhx"=>827, "ohx"=>-3304, "dhx"=>8,
    "nhy"=>1, "ohy"=>0, "dhy"=>8,
    "verbose"=>true}
param["sx"] = [100.0:100.0:500.0];
param["sy"] = [100.0:100.0:500.0]*0;
m = ["mpp";"mps1";"mps2"]
d = ["../prep/ux";"../prep/uy";"../prep/uz"]
ShotProfileEWEM(m,d,param)

