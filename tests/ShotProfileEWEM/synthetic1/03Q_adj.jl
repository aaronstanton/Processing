using PyPlot,Seismic

mpp,h = SeisRead("mpp_adj");
mps2,h = SeisRead("mps2_adj");
plotpar = {"ox"=>h[1].mx,"dx"=>h[2].mx - h[1].mx,
           "dy"=>h[1].d1,
	   "cmap"=>"PuOr",
	   "vmin"=>-8e-4,"vmax"=>8e-4,
	   "fignum"=>1}

## matplotlib settings: allow for LaTeX
#PyPlot.matplotlib[:rc]("text", usetex=true) # allow tex rendering
fig = PyPlot.figure(1,figsize=(12,4), facecolor="w", dpi=120) # create figure
fig[:subplots_adjust](left=.1, right=.9, bottom=0.1, top=.9) # reduce white spaces

ax = fig[:add_subplot](121) # create axis
SeisPlot(mpp[1:130,:],plotpar)
ax[:set_aspect]("equal")
setp(ax[:get_xticklabels](),fontsize=15)
setp(ax[:get_yticklabels](),fontsize=15)
ax[:set_xlabel]("X (m)",fontsize=15)
ax[:set_ylabel]("Z (m)",fontsize=15)
ax[:set_title]("PP",fontsize=20,loc="center")

ax = fig[:add_subplot](122) # create axis
SeisPlot(mps2[1:130,:],plotpar)
ax[:set_aspect]("equal")
setp(ax[:get_xticklabels](),fontsize=15)
setp(ax[:get_yticklabels](),fontsize=15)
ax[:set_xlabel]("X (m)",fontsize=15)
ax[:set_ylabel]("Z (m)",fontsize=15)
ax[:set_title]("PS",fontsize=20,loc="center")

savefig("mpp_mps2_adj.eps",dpi=120)
