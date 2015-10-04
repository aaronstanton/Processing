using PyPlot,Seismic

d,h = SeisRead("d_binned")

dt = h[1].d1; 
ot = h[1].o1
plotpar = {"oy"=>ot,"dy"=>dt,"vmin"=>-10,"vmax"=>10,"cmap"=>"Greys"}
SeisPlot(d,plotpar)

