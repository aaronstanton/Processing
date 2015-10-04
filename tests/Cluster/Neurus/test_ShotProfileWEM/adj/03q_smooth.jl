using PyPlot,Seismic

SeisHeaderInfo("mpp_smooth")

plotpar_stack = ["style"=>"color","pclip"=>95,"aspect"=>"1","xlabel"=>"X","xunits"=>"(m)","ox"=>0.,"dx"=>8.,"ylabel"=>"Depth","yunits"=>"(m)","oy"=>0.,"dy"=>4,"cmap"=>"Greys","wbox"=>10,"hbox"=>5];
plotpar_gather = ["style"=>"color","pclip"=>30,"aspect"=>"0.5","xlabel"=>"X","xunits"=>"(m)","ox"=>0.,"dx"=>8.,"ylabel"=>"Depth","yunits"=>"(m)","oy"=>0.,"dy"=>4,"cmap"=>"Greys","wbox"=>10,"hbox"=>5];

SeisWindow("mpp_smooth","mpp_smooth_mute",["key"=>["ang"],"minval"=>[-40],"maxval"=>[40]])
SeisStack("mpp_smooth_mute","mpp_smooth_stack");
mpp_stack,h = SeisRead("mpp_smooth_stack");
SeisPlot(mpp_stack,plotpar_stack);

v,h = SeisRead("../prep/vp_raw");
plotpar_stack["vmin"]=1000;
plotpar_stack["vmax"]=3000;
SeisPlot(v,plotpar_stack);

SeisWindow("mpp_smooth","mpp_smooth_gather",["key"=>["imx"],"minval"=>[450]])
mpp_gather,h = SeisRead("mpp_smooth_gather");
SeisPlot(mpp_gather,plotpar_gather);


