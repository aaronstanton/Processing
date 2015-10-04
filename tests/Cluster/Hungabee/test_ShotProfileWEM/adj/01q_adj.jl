using Seismic, SeismicPlotting

SeisHeaderInfo("mpp")

SeisWindow("mpp","mpp_mute",["ang"],[-40],[40])
SeisStack("mpp_mute","mpp_stack",["key"=>["imx","imy"]]);
mpp_stack,h = SeisRead("mpp_stack");
plotpar = ["style"=>"color","vmin"=>-2e-3,"vmax"=>2e-3,"aspect"=>"1.5","xlabel"=>"X","xunits"=>"(m)","ox"=>0.,"dx"=>8.,"ylabel"=>"Depth","yunits"=>"(m)","oy"=>0.,"dy"=>4,"cmap"=>"Greys"];
SeismicPlotting.figure(1)
SeisPlot(mpp_stack,["vmin"=>-1e3,"vmax"=>1e3,"cmap"=>"PuOr","fignum"=>1]);

SeisWindow("mpp","mpp_gather",["imx"],[500],[500])
mpp_gather,h = SeisRead("mpp_gather");
SeismicPlotting.figure(2)
SeisPlot(mpp_gather,["vmin"=>-1e4,"vmax"=>1e4,"cmap"=>"PuOr","fignum"=>2]);

