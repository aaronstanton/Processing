using Seismic, SeismicPlotting

SeisHeaderInfo("mpp_smooth")

plotpar = ["style"=>"color","pclip"=>95,"aspect"=>"1","xlabel"=>"X","xunits"=>"(m)","ox"=>0.,"dx"=>8.,"ylabel"=>"Depth","yunits"=>"(m)","oy"=>0.,"dy"=>4,"cmap"=>"Greys","wbox"=>10,"hbox"=>5];

SeisWindow("mpp_smooth","mpp_smooth_mute",["ang"],[-40],[40])
SeisStack("mpp_smooth_mute","mpp_smooth_stack",["key"=>["imx","imy"]]);
mpp_stack,h = SeisRead("mpp_smooth_stack");
SeisPlot(mpp_stack,plotpar);

SeisWindow("mpp_smooth","mpp_smooth_gather",["imx"],[450],[450])
mpp_gather,h = SeisRead("mpp_smooth_gather");
plotpar["aspect"] = 0.5
SeisPlot(mpp_gather,plotpar);

#v,h,s = SeisRead("../prep/vp_raw");
#plotpar["vmin"]=1000;
#plotpar["vmax"]=3000;
#SeisPlot(v,plotpar);


