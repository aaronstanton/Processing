using Seismic

param = {"Niter"=>50,"cost"=>"cost.txt","mu"=>[0.0 0.0 0.0],"precon"=>false,
    "tmute"=>0.8,"vmute"=>1500,
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
m01,h = SeisRead("mpp_adj");
SeisWrite("m01",m01.*0,h);
SeisWrite("m02",m01.*0,h);
SeisWrite("m03",m01.*0,h);
m0 = ["m01";"m02";"m03"]
m = ["mpp_ls";"mps1_ls";"mps2_ls"]
d = ["ux";"uy";"uz"]
ShotProfileLSEWEM(m,m0,d,param)
