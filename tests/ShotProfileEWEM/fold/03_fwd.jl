using Seismic

param = {"adj"=>false,
    "vp"=>"vp", "vs"=>"vs", "wav"=>"wav",
    "sz"=>10, "gz"=>10,
    "fmin"=>1., "fmax"=>50.,
    "padt"=>2, "padx"=>2,
    "nangx"=>1, "oangx"=>0, "dangx"=>5,
    "nangy"=>1, "oangy"=>0, "dangy"=>2,
    "nhx"=>721, "ohx"=>-1800, "dhx"=>5,
    "nhy"=>1, "ohy"=>0, "dhy"=>10,
    "verbose"=>true}
param["sx"] = [2000.0:100.0:2000.0];
param["sy"] = [2000.0:100.0:2000.0]*0;
m = ["mpp_adj";"mps1_adj";"mps2_adj"]
d = ["ux_fwd";"uy_fwd";"uz_fwd"]
ShotProfileEWEM(m,d,param)
