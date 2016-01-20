using Seismic

# Least Squares Migration
param = {"Niter"=>20,"mu"=>[1000 1000 1000],"cost"=>"cost.txt",
"vp"=>"vp", "vs"=>"vs", "wav"=>"wav",
"sz"=>10, "gz"=>10,
"fmin"=>1., "fmax"=>80.,
"padt"=>2, "padx"=>2,
"nhx"=>400, "ohx"=>-2000., "dhx"=>10.,
"nhy"=>1, "ohy"=>0., "dhy"=>10.,
"damping"=>0.1,
"omp"=>4,"verbose"=>"y"};
param["sx"] = [200.:200.:1800];
param["sy"] = param["sx"]*0.;
m = ["mpp_ls";"mps1_ls";"mps2_ls"]
m0 = ["mpp_adj";"mps1_adj";"mps2_adj"]
ddec = ["uxdec";"uydec";"uzdec"] 
ShotProfileLSEWEM(m,m0,ddec,param);

