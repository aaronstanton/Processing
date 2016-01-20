# the following 2 lines are for plotting non-interactively
using PyCall
pyimport("matplotlib")[:use]("Agg")

using PyPlot,Seismic

d_p = ["ux_fwd2_p";"uy_fwd2_p";"uz_fwd2_p"]
d_p_mute = ["ux_fwd2_p_mute";"uy_fwd2_p_mute";"uz_fwd2_p_mute"]
SeisMute(d_p_mute,d_p,{"tmute"=>0.8,"vmute"=>1500})

ux,h = SeisRead("ux_fwd2_p_mute");
uz,h = SeisRead("uz_fwd2_p_mute");

plotpar = {"ox"=>h[1].hx,"dx"=>h[2].hx - h[1].hx,
"dy"=>h[1].d1,
"cmap"=>"Greys",
"vmin"=>-5e-2,"vmax"=>5e-2,
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
ax[:set_title]("X-Component",fontsize=20)
xticks([-1500;-750;0;750;1500])

ax = fig[:add_subplot](122) # create axis
im = SeisPlot(uz,plotpar)
ax[:set_aspect]("auto")
setp(ax[:get_xticklabels](),fontsize=15)
setp(ax[:get_yticklabels](),fontsize=15)
ax[:set_xlabel]("Offset (m)",fontsize=15)
ax[:set_ylabel]("Time (s)",fontsize=15)
ax[:set_title]("Z-Component",fontsize=20)
xticks([-1500;-750;0;750;1500])

savefig("ux_uz_p_fwd.eps",dpi=120)
