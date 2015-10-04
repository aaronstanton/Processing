using Seismic

# Born Modelling
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
m_ls = ["mpp_ls","mps1_ls","mps2_ls"];
d_fwd = ["ux_fwd","uy_fwd","uz_fwd"];
ShotProfileEWEM(m_ls,d_fwd,param);


