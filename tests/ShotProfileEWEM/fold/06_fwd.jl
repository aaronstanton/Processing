using Seismic

param = {"adj"=>false,
    "vp"=>"vp", "vs"=>"vs", "wav"=>"wav",
    "angx"=>"angx","angy"=>"angy",
    "sz"=>10, "gz"=>10,
    "fmin"=>1., "fmax"=>50.,
    "padt"=>2, "padx"=>2,
    "nangx"=>1, "oangx"=>0, "dangx"=>5,
    "nangy"=>1, "oangy"=>0, "dangy"=>2,
    "nhx"=>721, "ohx"=>-1800, "dhx"=>5,
    "nhy"=>1, "ohy"=>0, "dhy"=>5,
    "verbose"=>true}
param["sx"] = [2000.0:100.0:2000.0];
param["sy"] = [2000.0:100.0:2000.0]*0;
m = ["mpp_ls";"mps1_ls";"mps2_ls"]
d = ["ux_fwd2";"uy_fwd2";"uz_fwd2"]
ShotProfileEWEM(m,d,param)
