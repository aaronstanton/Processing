using PyPlot,Seismic

SeisHeaderInfo("mpp")
SeisHeaderInfo("mps")
SeisHeaderInfo("msp")
SeisHeaderInfo("mss")

plotpar = ["style"=>"color","pclip"=>95,"aspect"=>"1","xlabel"=>"X","xunits"=>"(m)","ox"=>0.,"dx"=>8.,"ylabel"=>"Depth","yunits"=>"(m)","oy"=>0.,"dy"=>4,"cmap"=>"PuOr","wbox"=>20,"hbox"=>10];

SeisWindow("mpp","mpp_mute",{"key"=>["ang"],"minval"=>[-40],"maxval"=>[40]})
SeisStack("mpp_mute","mpp_stack",{"key"=>["imx","imy"]});
mpp_stack,h = SeisRead("mpp_stack");
SeisPlot(mpp_stack,plotpar);

SeisWindow("mps","mps_mute",{"key"=>["ang"],"minval"=>[-40],"maxval"=>[40]})
SeisStack("mps_mute","mps_stack",{"key"=>["imx","imy"]});
mps_stack,h = SeisRead("mps_stack");
SeisPlot(mps_stack,plotpar);

SeisWindow("msp","msp_mute",{"key"=>["ang"],"minval"=>[-40],"maxval"=>[40]})
SeisStack("msp_mute","msp_stack",{"key"=>["imx","imy"]});
msp_stack,h = SeisRead("msp_stack");
SeisPlot(msp_stack,plotpar);

SeisWindow("mss","mss_mute",{"key"=>["ang"],"minval"=>[-40],"maxval"=>[40]})
SeisStack("mss_mute","mss_stack",{"key"=>["imx","imy"]});
mss_stack,h = SeisRead("mss_stack");
SeisPlot(mss_stack,plotpar);


plotpar["wbox"]=10; plotpar["hbox"]=10; plotpar["pclip"]=50;
plotpar["xlabel"]="Angle"; plotpar["xunits"]="Degrees";

SeisWindow("mpp","mpp_gather",{"key"=>["imx"],"minval"=>[300]})
mpp_gather,h = SeisRead("mpp_gather");
SeisPlot(mpp_gather,plotpar);
xticks(vec([-70 0 70]));

SeisWindow("mps","mps_gather",{"key"=>["imx"],"minval"=>[300]})
mps_gather,h = SeisRead("mps_gather");
SeisPlot(mps_gather,plotpar);
xticks(vec([-70 0 70]));

SeisWindow("msp","msp_gather",{"key"=>["imx"],"minval"=>[300]})
msp_gather,h = SeisRead("msp_gather");
SeisPlot(msp_gather,plotpar);
xticks(vec([-70 0 70]));

SeisWindow("mss","mss_gather",{"key"=>["imx"],"minval"=>[300]})
mss_gather,h = SeisRead("mss_gather");
SeisPlot(mss_gather,plotpar);
xticks(vec([-70 0 70]));



