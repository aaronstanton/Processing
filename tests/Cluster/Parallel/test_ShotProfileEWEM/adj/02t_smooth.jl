using Seismic

SmoothGathers("mpp","mpp_smooth1",{"Nsmooth"=>3,"adj"=>false})
SmoothGathers("mps2","mps2_smooth1",{"Nsmooth"=>3,"adj"=>false})

SmoothStructure("mpp_smooth1","mpp_smooth2",{"Nsmooth2"=>5,"adj"=>false,"dip"=>"../prep/dipx_slope"})
SmoothStructure("mps2_smooth1","mps2_smooth2",{"Nsmooth2"=>5,"adj"=>false,"dip"=>"../prep/dipx_slope"})

