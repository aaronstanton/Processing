using Seismic

param = {"Niter"=>5,"cost"=>"cost.txt","mu"=>[0.0 0.0 0.0],"precon"=>false,
	"vp"=>"../prep/vp", "vs"=>"../prep/vs", "wav"=>"../prep/wav",
	"angx"=>"../prep/angx","angy"=>"../prep/angy",
	"sz"=>10, "gz"=>550,
	"fmin"=>1., "fmax"=>50.,
	"padt"=>2, "padx"=>2,
	"nangx"=>21, "oangx"=>-50, "dangx"=>5,
	"nangy"=>1, "oangy"=>0, "dangy"=>5,
	"nhx"=>827, "ohx"=>-3304, "dhx"=>8,
	"nhy"=>1, "ohy"=>0, "dhy"=>8,
	"verbose"=>true}
param["sx"] = [100.0:100.0:6900.0];
param["sy"] = [100.0:100.0:6900.0]*0;
m0 = ["../adj/mpp";"../adj/mps1";"../adj/mps2"]
m = ["mpp";"mps1";"mps2"]
d = ["../prep/ux";"../prep/uy";"../prep/uz"]
ShotProfileLSEWEM(m,m0,d,param);

