using PyPlot,Seismic

param = {"adj"=>false,
"vel"=>"v", "wav"=>"wav",
"sz"=>10, "gz"=>10,
"fmin"=>1., "fmax"=>100.,
"padt"=>2, "padx"=>2,
"nhx"=>1001, "ohx"=>-2500, "dhx"=>10,
"nhy"=>1, "ohy"=>0, "dhy"=>10,
"damping"=>1000.,
"omp"=>4,"verbose"=>"y"};
param["sx"] = [500.0:1000.0:4500.0];
param["sy"] = param["sx"]*0.;

param["adj"] = true
ShotProfileWEM("m_adj","d",param);
m_adj,h = SeisRead("m_adj");
SeisPlot(m_adj)

