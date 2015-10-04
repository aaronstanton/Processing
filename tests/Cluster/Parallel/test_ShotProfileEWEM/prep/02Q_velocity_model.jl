using PyPlot,Seismic

SCRATCH_PATH = "/global/scratch/stanton/kevins_model/elastic/"

vp,h = SeisRead(join([SCRATCH_PATH,"prep/vp_raw"]));
vs,h = SeisRead(join([SCRATCH_PATH,"prep/vs_raw"]));
plotpar = {"ox"=>h[1].mx,"dx"=>h[2].mx - h[1].mx,
"dy"=>h[1].d1,
"cmap"=>"PuOr",
"vmin"=>800,"vmax"=>3000,
"fignum"=>1}

fig = PyPlot.figure(1,figsize=(10,10), facecolor="w", dpi=120) # create figure
fig[:subplots_adjust](left=.1, right=.9, bottom=0.1, top=.9) # reduce white spaces

ax = fig[:add_subplot](211) # create axis
im = SeisPlot(vp,plotpar)
ax[:set_aspect](1)
setp(ax[:get_xticklabels](),fontsize=15)
setp(ax[:get_yticklabels](),fontsize=15)
ax[:set_xlabel]("X (m)",fontsize=15)
ax[:set_ylabel]("Z (m)",fontsize=15)
ax[:set_title]("Vp",fontsize=20,loc="center")

ax = fig[:add_subplot](212) # create axis
im = SeisPlot(vs,plotpar)
ax[:set_aspect](1)
setp(ax[:get_xticklabels](),fontsize=15)
setp(ax[:get_yticklabels](),fontsize=15)
ax[:set_xlabel]("X (m)",fontsize=15)
ax[:set_ylabel]("Z (m)",fontsize=15)
ax[:set_title]("Vs",fontsize=20,loc="center")

cbar_ax = fig[:add_axes]([0.92, 0.1, 0.02, 0.8])
cb = colorbar(im, cax=cbar_ax)
cbar_ax[:set_xlabel]("(m/s)",fontsize=15)

savefig("vp_vs.eps",dpi=120)

