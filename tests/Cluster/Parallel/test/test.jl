using Seismic

println("Started julia on Parallel.westgrid.ca")

# initialize only 1 process per node
Seismic.bind_torque_procs(1)

# here a function that runs your estimation:
# using MOpt, mig

# require some code on all nodes
require("incl.jl")

println("make everybody say hello")

@everywhere sayhello()

println("make everybody do some math")

pmap( i->domath(i), [100 for j in 1:length(workers())] )

println("make everybody pass a memory test")

pmap( i->doBIGmath(), 1:length(workers()) )

println("trying parallel for loop with $(nprocs()) processes")
println("numworkers: $(length(workers()))")
println("workers: $(workers())")
@time map( n -> sum(svd(rand(n,n))[1]) , [800 for i in 1:20]);
@time pmap( n -> sum(svd(rand(n,n))[1]) , [800 for i in 1:24]);

println(" quitting ")

quit()
