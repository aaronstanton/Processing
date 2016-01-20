using PyPlot,Seismic

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
