using PyPlot,Seismic

SCRATCH_PATH = "/global/scratch/stanton/kevins_model/elastic/"

SeisWindow(join([SCRATCH_PATH,"adj/mpp"]),join([SCRATCH_PATH,"adj/mpp_near"]),{"key"=>["ang"],"minval"=>[-70],"maxval"=>[70]})
SeisWindow(join([SCRATCH_PATH,"adj/mps2"]),join([SCRATCH_PATH,"adj/mps2_near"]),{"key"=>["ang"],"minval"=>[-70],"maxval"=>[70]})
SeisStack(join([SCRATCH_PATH,"adj/mpp_near"]),join([SCRATCH_PATH,"adj/mpp_stack"]))
SeisStack(join([SCRATCH_PATH,"adj/mps2_near"]),join([SCRATCH_PATH,"adj/mps2_stack"]))
mpp,h = SeisRead(join([SCRATCH_PATH,"adj/mpp_stack"]))
mps,h = SeisRead(join([SCRATCH_PATH,"adj/mps2_stack"]))
plotpar = {"ox"=>h[1].mx,"dx"=>h[2].mx - h[1].mx,
"dy"=>h[1].d1,
"cmap"=>"PuOr",
"vmin"=>-1e-6,"vmax"=>1e-6,
"fignum"=>1}

fig = PyPlot.figure(1,figsize=(10,10), facecolor="w", dpi=120) # create figure
fig[:subplots_adjust](left=.1, right=.9, bottom=0.1, top=.9) # reduce white spaces

ax = fig[:add_subplot](211) # create axis
im = SeisPlot(mpp,plotpar)
ax[:set_aspect](1)
setp(ax[:get_xticklabels](),fontsize=15)
setp(ax[:get_yticklabels](),fontsize=15)
ax[:set_xlabel]("X (m)",fontsize=15)
ax[:set_ylabel]("Z (m)",fontsize=15)
ax[:set_title]("PP",fontsize=20,loc="center")

ax = fig[:add_subplot](212) # create axis
im = SeisPlot(mps,plotpar)
ax[:set_aspect](1)
setp(ax[:get_xticklabels](),fontsize=15)
setp(ax[:get_yticklabels](),fontsize=15)
ax[:set_xlabel]("X (m)",fontsize=15)
ax[:set_ylabel]("Z (m)",fontsize=15)
ax[:set_title]("PS",fontsize=20,loc="center")

savefig("m_adj_stack.eps",dpi=120)

