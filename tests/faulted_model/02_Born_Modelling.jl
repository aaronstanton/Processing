using Seismic

# Born Modelling
param = {"adj"=>false,
"vel"=>"vp", "wav"=>"wav",
"sz"=>5, "gz"=>5,
"fmin"=>1., "fmax"=>80.,
"padt"=>2, "padx"=>2,
"nhx"=>400, "ohx"=>-2000., "dhx"=>10.,
"nhy"=>1, "ohy"=>0., "dhy"=>10.,
"damping"=>1000.,
"verbose"=>"y"};
param["sx"] = [100.:10.:1800];
param["sy"] = param["sx"]*0.;
ShotProfileWEM("mpp","d",param);

SeisSort("d","d_sorted",{"key"=>["ihx","imx"]})
