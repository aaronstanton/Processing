using Seismic

# Least Squares Migration
param = {"Niter"=>5,"cost"=>"cost.txt",
"vel"=>"vp", "wav"=>"wav",
"sz"=>10, "gz"=>10,
"fmin"=>0., "fmax"=>80.,
"padt"=>2, "padx"=>2,
"nhx"=>400, "ohx"=>-2000., "dhx"=>10.,
"nhy"=>1, "ohy"=>0., "dhy"=>10.,
"damping"=>0.1,
"omp"=>4,"verbose"=>"y"};
param["sx"] = [500.:500.:1500];
param["sy"] = param["sx"]*0.;
ShotProfileLSWEM("mpp_ls","mpp_adj","uz",param);

