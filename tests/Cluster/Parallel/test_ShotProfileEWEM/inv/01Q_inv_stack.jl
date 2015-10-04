using PyPlot,Seismic

SeisWindow("mpp","mpp_near",{"key"=>["ang"],"minval"=>[-40],"maxval"=>[40]})
SeisWindow("mps2","mps2_near",{"key"=>["ang"],"minval"=>[-40],"maxval"=>[40]})
SeisStack("mpp_near","mpp_stack")
SeisStack("mps2_near","mps2_stack")
mpp,h = SeisRead("mpp_stack")
mps,h = SeisRead("mps2_stack")
plotpar = {"ox"=>h[1].mx,"dx"=>h[2].mx - h[1].mx,
"dy"=>h[1].d1,
"cmap"=>"PuOr",
"vmin"=>-0.5,"vmax"=>0.5,
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

savefig("m_inv_stack.eps",dpi=120)

