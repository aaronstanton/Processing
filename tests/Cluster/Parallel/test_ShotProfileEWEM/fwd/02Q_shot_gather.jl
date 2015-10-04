using PyPlot,Seismic

SCRATCH_PATH = "/global/scratch/stanton/kevins_model/elastic/"

ux,h = SeisRead(join([SCRATCH_PATH,"fwd/ux"]));
uz,h = SeisRead(join([SCRATCH_PATH,"fwd/uz"]));
plotpar = {"ox"=>h[1].hx,"dx"=>h[2].hx - h[1].hx,
"dy"=>h[1].d1,
"cmap"=>"PuOr",
"pclip"=>50,
"fignum"=>1}

fig = PyPlot.figure(1,figsize=(10,10), facecolor="w", dpi=120) # create figure
fig[:subplots_adjust](left=.1, right=.9, bottom=0.1, top=.9) # reduce white spaces

ax = fig[:add_subplot](121) # create axis
im = SeisPlot(ux,plotpar)
ax[:set_aspect]("auto")
setp(ax[:get_xticklabels](),fontsize=15)
setp(ax[:get_yticklabels](),fontsize=15)
ax[:set_xlabel]("Offset (m)",fontsize=15)
ax[:set_ylabel]("Time (s)",fontsize=15)
ax[:set_title]("X-Component",fontsize=20,loc="center")
xticks([-3000;-1500;0;1500;3000])

ax = fig[:add_subplot](122) # create axis
im = SeisPlot(uz,plotpar)
ax[:set_aspect]("auto")
setp(ax[:get_xticklabels](),fontsize=15)
setp(ax[:get_yticklabels](),fontsize=15)
ax[:set_xlabel]("Offset (m)",fontsize=15)
ax[:set_ylabel]("Time (s)",fontsize=15)
ax[:set_title]("Z-Component",fontsize=20,loc="center")
xticks([-3000;-1500;0;1500;3000])

savefig("ux_uz_fwd.eps",dpi=120)

