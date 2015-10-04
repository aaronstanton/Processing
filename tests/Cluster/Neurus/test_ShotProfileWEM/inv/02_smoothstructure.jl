using Seismic

param = ["dip"=>"../prep/dipx_slope","Nsmooth2"=>5];
SmoothStructure("mpp","mpp_smooth",param);


