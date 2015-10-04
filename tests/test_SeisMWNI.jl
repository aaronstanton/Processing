using Seismic,SeismicPlotting

param = ["nt"=>500,"nx1"=>500,
     "tau1"=>[0.4 1.0],"tau2"=>[0. 0.],"tau3"=>[0. 0.],"tau4"=>[0. 0.],
     "v1"=>[3500. -4000],"v2"=>[99999. 99999.],"v3"=>[99999. 99999.],"v4"=>[99999. 99999.],
     "amp"=>[1. -0.5], "f0"=>[20. 20.]];
d = SeisLinearEvents(param);

nt = size(d,1); 
nx = size(d[:,:],2)
h = Header[]
for ix = 1:nx
  push!(h,Seismic.InitSeisHeader())
  h[ix].tracenum = ix;
  h[ix].d1 = 0.004;
  h[ix].n1 = nt;
  h[ix].imx = ix;
end
param = ["mode"=>"random","perc"=> 50]
ddec,h = SeisDecimate(d,h,param)
param = ["style"=>"mxmyhxhy","Niter_external"=> 3,"Niter_internal"=> 50,"fmax"=>80]
dmwni,h = SeisMWNI(ddec,h,param)

SeismicPlotting.ioff();
SeisPlot(ddec[:,:],["vmin"=>-1,"vmax"=>1])
SeisPlot(dmwni[:,:],["vmin"=>-1,"vmax"=>1])

