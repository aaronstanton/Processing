using Seismic

#SmoothStructure("mpp","mpp_smooth1",{"dip"=>"../prep/dipx_slope","Nsmooth2"=>5,"adj"=>false})
#SmoothStructure("mps2","mps2_smooth1",{"dip"=>"../prep/dipx_slope","Nsmooth2"=>5,"adj"=>false})

SmoothGathers("mpp","mpp_smooth1",{"dip"=>"../prep/dipx_slope","Nsmooth"=>3,"adj"=>false})
SmoothGathers("mps2","mps2_smooth1",{"dip"=>"../prep/dipx_slope","Nsmooth"=>3,"adj"=>false})
