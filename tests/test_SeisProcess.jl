my_path_to_Seismic = "/home/kstanton/Seismic"
push!(LOAD_PATH, join([my_path_to_Seismic "/src"]))
using Seismic

d = SeisLinearEvents();
nt = size(d,1); nx = convert(Int64,length(d[:])/nt);
h = Array(Header,nx);
for ix = 1:nx
  h[ix] = Seismic.InitSeisHeader();
  h[ix].tracenum = ix;
  h[ix].n1 = nt;
end
SeisWrite("tmp1",d[1:nt,:],h);
param = ["a"=> 0, "b"=> 1]
# run a process where gathers are keyed on tracenum (i.e. a gather consists of 1 trace)
# as an example MyFunction is applied twice to each gather.
SeisProcess("tmp1","tmp2",[MyFunction,MyFunction],param,"key",["tracenum"]);

rm("tmp1.seisd")
rm("tmp1.seish")
rm("tmp2.seisd")
rm("tmp2.seish")
