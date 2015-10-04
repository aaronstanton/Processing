using PyPlot,Seismic
using Base.Test

# Make reflectivity and velocity models and save to disk
nz  = 500;  dz  = 5.;    oz  = 0.;
nmx = 500;  dmx = 10.;   omx = 0.;
nmy = 1;    dmy = 10.;   omy = 0.;
nt  = 500;  dt  = 0.004; ot  = 0.;
nsx = 1;    dsx = 100.;  osx = 1250.;
nsy = 1;    dsy = 100.;  osy = 0.;
nhx = 1001;  dhx = copy(dmx);   ohx = -2500.;
nhy = 1;    dhy = copy(dmy);   ohy = 0.;
a = [50:250:2000]
v = a*0 + 12.
param = {"ot"=>oz,"dt"=>dz,"nt"=>nz,
"ox1"=>omx,"dx1"=>dmx,"nx1"=>nmx,
"tau1"=>a,"v1"=>v,
"amp"=>0.2 + randn(length(a)),"f0"=>0.02 + 0.02*rand(length(a)),"sinusoidal"=>true,"sinusoidalA"=>50}
m = SeisLinearEvents(param); m = m[:,:];



v = m.*0 + 2500.
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






SeisPlot(m,{"dy"=>dz,"dx"=>dmx})
# Make Ricker wavelet and save to disk
fpeak = 20.
tmp = Seismic.Ricker(fpeak,dt)
wav = [vec(tmp);zeros(nt-length(tmp))];
h = Header[];
push!(h,Seismic.InitSeisHeader());
h[1].tracenum = 1;
h[1].o1 = ot;
h[1].n1 = nt;
h[1].d1 = dt;
SeisWrite("wav",wav[:],h);

#figure()
#plot(wav,[0:nt-1]*dt)
#ax = gca();
#ax[:set_xlim]([-1,1])
#ax[:invert_yaxis](); 

# Make 1 shot gather
param = {"adj"=>false,
"vel"=>"v", "wav"=>"wav",
"sz"=>10, "gz"=>10,
"fmin"=>1., "fmax"=>100.,
"padt"=>2, "padx"=>2,
"nhx"=>nhx, "ohx"=>ohx, "dhx"=>dhx,
"nhy"=>nhy, "ohy"=>ohy, "dhy"=>dhy,
"damping"=>0.01,
"omp"=>4,"verbose"=>"y"};
param["sx"] = [500.0:1000.0:4500.0];
param["sy"] = param["sx"]*0.;
ShotProfileWEM("m","d",param);

d,h = SeisRead("d");
SeisPlot(d,{"dy"=>h[1].d1,"dx"=>h[2].gx-h[1].gx})

