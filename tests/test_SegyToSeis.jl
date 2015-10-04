using Seismic

SegyToSeis("/Users/wenyue/gitclone/Seismic/data/P.segy","P","segy",true);
SeisHeaderInfo("P");
P,H = SeisRead("P");
# plot to pdf file
plotpar = ["title"=>"P",
           "dy"=>H[1].d1,"ylabel"=>"time","yunits"=>"s",
           "xlabel"=>"Midpoint","xunits"=>"Number",
           "ox"=>H[1].imx,"dx"=>(H[end].imx - H[1].imx)/length(H),
           "vmin"=>-5e4,"vmax"=>5e4,
           "aspect"=>"auto","wbox"=>10,"hbox"=>6,"cmap"=>"gray",
           "name"=>"myplot.pdf"];
SeisPlot(P,plotpar);

