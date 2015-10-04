using Seismic

param = ["adj"=>true,"dip"=>"../prep/dipx_slope","Nsmooth"=>5,"Nsmooth2"=>5];
tic()
SmoothGathers("mpp_smoothb","mpp_smootha",param);
toc()
