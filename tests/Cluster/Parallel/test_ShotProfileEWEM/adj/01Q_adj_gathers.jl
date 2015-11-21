# the following 2 lines are for plotting non-interactively
using PyCall
pyimport("matplotlib")[:use]("Agg")

using PyPlot,Seismic

SeisWindow("mpp","mpp_gather1",{"key"=>["imx"],"minval"=>[200]})
SeisWindow("mps2","mps2_gather1",{"key"=>["imx"],"minval"=>[200]})
SeisWindow("mpp","mpp_gather2",{"key"=>["imx"],"minval"=>[300]})
SeisWindow("mps2","mps2_gather2",{"key"=>["imx"],"minval"=>[300]})
SeisWindow("mpp","mpp_gather3",{"key"=>["imx"],"minval"=>[400]})
SeisWindow("mps2","mps2_gather3",{"key"=>["imx"],"minval"=>[400]})
SeisWindow("mpp","mpp_gather4",{"key"=>["imx"],"minval"=>[500]})
SeisWindow("mps2","mps2_gather4",{"key"=>["imx"],"minval"=>[500]})
SeisWindow("mpp","mpp_gather5",{"key"=>["imx"],"minval"=>[600]})
SeisWindow("mps2","mps2_gather5",{"key"=>["imx"],"minval"=>[600]})
mpp1,h = SeisRead("mpp_gather1")
mps1,h = SeisRead("mps2_gather1")
mpp2,h = SeisRead("mpp_gather2")
mps2,h = SeisRead("mps2_gather2")
mpp3,h = SeisRead("mpp_gather3")
mps3,h = SeisRead("mps2_gather3")
mpp4,h = SeisRead("mpp_gather3")
mps4,h = SeisRead("mps2_gather3")
mpp5,h = SeisRead("mpp_gather3")
mps5,h = SeisRead("mps2_gather3")
mpp = [mpp1 mpp2 mpp3 mpp4 mpp5]
mps = [mps1 mps2 mps3 mps4 mps5]
plotpar = {"ox"=>1,"dx"=>1,
"dy"=>h[1].d1,
"cmap"=>"Greys",
"pclip"=>30,
"fignum"=>1}

fig = PyPlot.figure(1,figsize=(12,8), facecolor="w", dpi=120) # create figure
fig[:subplots_adjust](left=.1, right=.99, bottom=0.03, top=.97) # reduce white spaces

ax = fig[:add_subplot](121) # create axis
im = SeisPlot(mpp,plotpar)
ax[:set_aspect](0.045)
setp(ax[:get_xticklabels](),fontsize=15)
setp(ax[:get_yticklabels](),fontsize=15)
ax[:set_xlabel]("X (m)",fontsize=15)
ax[:set_ylabel]("Z (m)",fontsize=15)
ax[:set_title]("PP",fontsize=20,loc="center")
xticks([11:21:21*5-10],[1600;2400;3200;4000;4800]) 

ax = fig[:add_subplot](122) # create axis
im = SeisPlot(mps,plotpar)
ax[:set_aspect](0.045)
setp(ax[:get_xticklabels](),fontsize=15)
setp(ax[:get_yticklabels](),fontsize=15)
ax[:set_xlabel]("X (m)",fontsize=15)
ax[:set_ylabel]("Z (m)",fontsize=15)
ax[:set_title]("PS",fontsize=20,loc="center")
xticks([11:21:21*5-10],[1600;2400;3200;4000;4800])

savefig("m_adj_gathers.eps",dpi=120)

