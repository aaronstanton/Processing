using PyPlot,Seismic

dpocs_hard,h = SeisRead("dpocs_hard")

dt = h[1].d1; 
ot = h[1].o1
plotpar = {"oy"=>ot,"dy"=>dt,"vmin"=>-10,"vmax"=>10,"cmap"=>"Greys"}
SeisPlot(dpocs_hard,plotpar)

