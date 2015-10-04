using PyPlot,Seismic

ddec,h = SeisRead("ddec")

dt = h[1].d1; 
ot = h[1].o1
plotpar = {"oy"=>ot,"dy"=>dt,"vmin"=>-10,"vmax"=>10,"cmap"=>"Greys"}
SeisPlot(ddec,plotpar)

