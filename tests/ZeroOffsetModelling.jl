using Seismic

# Make reflectivity and velocity models and save to disk
nz  = 500;  dz  = 5.;    oz  = 0.;
nmx = 500;  dmx = 10.;   omx = 0.;
nmy = 1;    dmy = 10.;   omy = 0.;
nt  = 500; dt  = 0.002; ot  = 0.;
a = [800]
v = 99999.
param = {"ot"=>oz,"dt"=>dz,"nt"=>nz,
"ox1"=>omx,"dx1"=>dmx,"nx1"=>nmx,
"tau1"=>a,"v1"=>v,
"amp"=>0.2 + randn(length(a)),"f0"=>0.03 + 0.03*rand(length(a)),"sinusoidal"=>true,"sinusoidalA"=>50}
m = SeisLinearEvents(param); m = m[:,:];
v = m.*0 + 2000.
h = Header[];
j = 1
for imx = 1:nmx
	for imy = 1:nmy
		h = push!(h,Seismic.InitSeisHeader())
		h[j].tracenum = j;
		h[j].n1 = nz;
		h[j].d1 = dz;
		h[j].mx = (imx-1)*dmx + omx;
		h[j].my = (imy-1)*dmy + omy;
		h[j].imx = imx-1;
		h[j].imy = imy-1;
		j += 1
	end
end
SeisWrite("m",m[1:nz,:],h);
SeisWrite("v",v[1:nz,:],h);

#SeisPlot(m,{"dy"=>dz,"dx"=>dmx})

# Model data
param = {"adj"=>false,
"vel"=>"v", "wav"=>"wav",
"nt"=>nt,"dt"=>dt,
"sz"=>10, "gz"=>10,
"fmin"=>1., "fmax"=>100.,
"padt"=>2, "padx"=>1,
"omp"=>4,"verbose"=>"y"};
PostStackWEM("m","d",param);

#d,h = SeisRead("d");
#SeisPlot(d,{"dy"=>h[1].d1,"dx"=>h[2].mx-h[1].mx})

