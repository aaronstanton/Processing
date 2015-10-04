using Seismic

param = {"adj"=>false,
"vp"=>"vp", "vs"=>"vs", "wav"=>"wav",
"sz"=>10, "gz"=>10,
"fmin"=>1., "fmax"=>80.,
"padt"=>2, "padx"=>2,
"nhx"=>400, "ohx"=>-2000., "dhx"=>10.,
"nhy"=>1, "ohy"=>0., "dhy"=>10.,
"damping"=>1000.,
"omp"=>4,"verbose"=>"y"};
param["sx"] = [500.:500.:1500];
param["sy"] = param["sx"]*0.;

mpp,h = SeisRead("mpp_adj")
m1_rand = randn(size(mpp)); 
m2_rand = randn(size(mpp)); 
m3_rand = randn(size(mpp)); 
SeisWrite("m1_rand",m1_rand,h)
SeisWrite("m2_rand",m2_rand,h)
SeisWrite("m3_rand",m3_rand,h)
ux,h = SeisRead("ux")
d1_rand = randn(size(ux)); 
d2_rand = randn(size(ux)); 
d3_rand = randn(size(ux)); 
SeisWrite("d1_rand",d1_rand,h)
SeisWrite("d2_rand",d2_rand,h)
SeisWrite("d3_rand",d3_rand,h)

CalculateSampling("d1_rand","wd",param)
DotTest("m1_rand","m2_rand","m3_rand","d1_rand","d2_rand","d3_rand",[ApplyDataWeights ShotProfileEWEM],param)



