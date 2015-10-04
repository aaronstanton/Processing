using Seismic

param = ["dip"=>"../prep/dipx_slope","Nsmooth"=>5,"Nsmooth2"=>5];
SmoothStructure("mpp","mpp_smooth1",param);
SmoothGathers("mpp_smooth1","mpp_smooth",param);
