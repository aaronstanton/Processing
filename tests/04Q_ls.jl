using PyPlot,Seismic

mpp,h = SeisRead("mpp_ls");
mps2,h = SeisRead("mps2_ls");
plotpar = {"ox"=>h[1].mx,"dx"=>h[2].mx - h[1].mx,
           "dy"=>h[1].d1,
	   "cmap"=>"PuOr",
	   "vmin"=>-6e-5,"vmax"=>6e-5,
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

savefig("mpp_mps2_ls.eps",dpi=120)


stream = open("cost.txt")
cost = readdlm(stream)
close(stream)
cost = cost[2:end,1]
cost = cost/cost[1]
fig = PyPlot.figure(2,figsize=(7,6), facecolor="w", dpi=120) # create figure
plot([0:length(cost)-1],cost,color="black",linewidth=2)
ax = gca()
ax[:set_aspect]("auto")
setp(ax[:get_xticklabels](),fontsize=20)
setp(ax[:get_yticklabels](),fontsize=20)

ax[:set_xlabel]("Iteration number",fontsize=20)
ax[:set_ylabel]("Relative Cost",fontsize=20)
savefig("cost.eps",dpi=80)
