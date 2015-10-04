using Seismic, SeismicPlotting

SeisHeaderInfo("mpp")

plotpar = ["style"=>"color","vmin"=>-1e4,"vmax"=>1e4,"aspect"=>"1","xlabel"=>"X","xunits"=>"(m)","ox"=>0.,"dx"=>8.,"ylabel"=>"Depth","yunits"=>"(m)","oy"=>0.,"dy"=>4,"cmap"=>"Greys","wbox"=>20,"hbox"=>5];

#SeisWindow("mpp","mpp_mute",["ang"],[-40],[40])
#SeisStack("mpp_mute","mpp_stack",["key"=>["imx","imy"]]);
mpp_stack,h = SeisRead("mpp_stack");
SeismicPlotting.figure(1)
plotpar["fignum"] = 1
plotpar["name"] = "adjoint_stack"
SeisPlot(mpp_stack,plotpar);

#SeisWindow("mpp","mpp_gather",["imx"],[500],[500])
mpp_gather,h = SeisRead("mpp_gather");
SeismicPlotting.figure(2)
plotpar["aspect"] = 0.5
plotpar["fignum"] = 2
plotpar["name"] = "adjoint_gather"
SeisPlot(mpp_gather,plotpar);

