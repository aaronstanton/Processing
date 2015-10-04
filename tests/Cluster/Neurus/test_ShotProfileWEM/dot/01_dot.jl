using Seismic

m_adj,h = SeisRead("../adj/mpp");
m_rand = rand(size(m_adj));
SeisWrite("m_rand",m_rand,h);
d,h = SeisRead("../prep/uz_1shot");
d_rand = rand(size(d));
d_rand[:,1:2:end] = 0.
SeisWrite("d_rand",d_rand,h);

param = ["adj"=>false,
"vel"=>"../prep/vp", "wav"=>"../prep/wav",
"angx"=>"../prep/angx_1shot","angy"=>"../prep/angy_1shot",
"pade_flag"=>"n",
"sz"=>10, "gz"=>550,
"fmin"=>1., "fmax"=>5.,
"padt"=>2, "padx"=>2,
"nangx"=>71, "oangx"=>-70, "dangx"=>2,
"nangy"=>1, "oangy"=>0, "dangy"=>2,
"nhx"=>827, "ohx"=>-3304, "dhx"=>8,
"nhy"=>1, "ohy"=>0, "dhy"=>8,
"omp"=>16,"verbose"=>"y",
"dip"=>"../prep/dipx_slope","NSmooth"=>5,"Nsmooth2"=>5];
param["sx"] = [3600.0:100.0:3600.0];
param["sy"] = [3600.0:100.0:3600.0]*0;

CalculateSampling("d_rand","wd",param)
param["wd"] = "wd"

DotTest("m_rand","d_rand",[ShotProfileWEM ApplyDataWeights],param)

