using Seismic

param = ["adj"=>true,"dip"=>"../prep/dipx_slope","Nsmooth"=>5,"Nsmooth2"=>5];
tic()
SmoothStructure("mpp_smootha","mpp",param);
toc()
