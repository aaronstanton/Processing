using PyPlot,Seismic
SeisWindow("uxdec","uxdec1shot",{"key"=>["sx"],"minval"=>[1000]})
SeisWindow("uzdec","uzdec1shot",{"key"=>["sx"],"minval"=>[1000]})
ux,h = SeisRead("uxdec1shot");
uz,h = SeisRead("uzdec1shot");
plotpar = {"ox"=>h[1].gx,"dx"=>h[2].gx - h[1].gx,
           "oy"=>h[1].d1*(80 - 1),"dy"=>h[1].d1,
	   "cmap"=>"PuOr",
	   "vmin"=>-5e-3,"vmax"=>5e-3,
	   "fignum"=>1}

## matplotlib settings: allow for LaTeX
#PyPlot.matplotlib[:rc]("text", usetex=true) # allow tex rendering
fig = PyPlot.figure(1,figsize=(12,6), facecolor="w", dpi=120) # create figure
fig[:subplots_adjust](left=.1, right=.9, bottom=0.1, top=.9) # reduce white spaces

ax = fig[:add_subplot](121) # create axis
SeisPlot(ux[80:end,:],plotpar)
setp(ax[:get_xticklabels](),fontsize=15)
setp(ax[:get_yticklabels](),fontsize=15)
ax[:set_xlabel]("X (m)",fontsize=15)
ax[:set_ylabel]("Time (s)",fontsize=15)
ax[:set_title]("X-Component",fontsize=20,loc="center")

ax = fig[:add_subplot](122) # create axis
SeisPlot(uz[80:end,:],plotpar)
setp(ax[:get_xticklabels](),fontsize=15)
setp(ax[:get_yticklabels](),fontsize=15)
ax[:set_xlabel]("X (m)",fontsize=15)
ax[:set_ylabel]("Time (s)",fontsize=15)
ax[:set_title]("Z-Component",fontsize=20,loc="center")

savefig("ux_uz.eps",dpi=120)
