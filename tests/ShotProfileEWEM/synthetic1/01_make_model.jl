using Seismic

# Make reflectivity and velocity models and save to disk
nz  = 200;  dz  = 10.;    oz  = 0.;
nmx = 200;  dmx = 10.;    omx = 0.;
nmy = 1;    dmy = 10.;    omy = 0.;
nt  = 250;  dt  = 0.004;  ot  = 0.;
nsx = 1;    dsx = 100.;   osx = 1000.;
nsy = 1;    dsy = 100.;   osy = 0.;
nhx = 400;  dhx = copy(dmx);   ohx = -1000.;
nhy = 1;    dhy = copy(dmy);   ohy = 0.;
a = [200;600]
v = [9999;9999]
param = {"ot"=>oz,"dt"=>dz,"nt"=>nz,
"ox1"=>omx,"dx1"=>dmx,"nx1"=>nmx,
"tau1"=>a,"v1"=>v,
"amp"=>[1 -1],"f0"=>[0.05 0.05],"sinusoidal"=>true,"sinusoidalA"=>40,"ricker"=>true}
#mpp = SeisLinearEvents(param); mpp = mpp[:,:];
#param["amp"] = [-0.5 0.1];
#mps = SeisLinearEvents(param); mps = mps[:,:];

z_event = 600 + 50*sin(10*pi*[0:nmx-1]*dmx/((nmx-1)*dmx))
iz_event = int(floor((z_event - oz)/dz)) + 1
z1 = (iz_event-1)*dz + oz;
z2 = z1 + dz;
w = (z2-z_event)/dz
mpp = zeros(Float32,nz,nmx);
mps1 = zeros(Float32,nz,nmx);
mps2 = zeros(Float32,nz,nmx);
for ix = 1 : nmx
	mpp[iz_event[ix],ix] = 1*w[ix];
	mpp[iz_event[ix]+1,ix] = 1*(1 - w[ix]);
	mps2[iz_event[ix],ix] = -0.5*w[ix];
	mps2[iz_event[ix]+1,ix] = -0.5*(1 - w[ix]);
end

vp = mpp.*0 + 3200.
vs = vp./sqrt(3)
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
SeisWrite("mpp",mpp[1:nz,:],h);
SeisWrite("mps1",mps1[1:nz,:],h);
SeisWrite("mps2",mps2[1:nz,:],h);
SeisWrite("vp",vp[1:nz,:],h);
SeisWrite("vs",vs[1:nz,:],h);

#SeisPlot(m,{"dy"=>dz,"dx"=>dmx})
# Make Ricker wavelet and save to disk
fpeak = 40.
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





