using Seismic


function shift_image(m,param)

	shift = get(param,"shift",5)
	dx = get(param,"dz",1)
	nz = size(m,1)
	nx = size(m,2)
	nf = nz
	dw = 2.*pi/nf/dz
	nw = int(nf/2) + 1
	M = fft(m,1)
	dw = 2.*pi/nf/dz
	for iw=1:nw
		w = iw*dw
		M[iw,:,:,:,:] *= exp(-1im*w*shift) 
	end
	# symmetries
	for iw=nw+1:nf
		M[iw,:,:,:,:] = conj(M[nf-iw+2,:,:,:,:])
	end 
	m = ifft(M,1)
	return real(m[1:nz,1:nx])

end


# Make reflectivity model
nz  = 200;  dz  = 5.;    oz  = 0.;
nmx = 200;  dmx = 10.;   omx = 0.;
nmy = 1;    dmy = 10.;   omy = 0.;
nt  = 500;  dt  = 0.002; ot  = 0.;
nsx = 1;    dsx = 100.;  osx = 1000.;
nsy = 1;    dsy = 100.;  osy = 0.;
nhx = 400;  dhx = copy(dmx);   ohx = -1000.;
nhy = 1;    dhy = copy(dmy);   ohy = 0.;
a = [200;250]
v = [14;14]
param = {"ot"=>oz,"dt"=>dz,"nt"=>nz,
"ox1"=>omx,"dx1"=>dmx,"nx1"=>nmx,
"tau1"=>a,"v1"=>v,
"amp"=>[1 -1],"f0"=>[0.015 0.015],"ricker"=>false}
mpp = SeisLinearEvents(param); mpp = mpp[:,:];

mpp = SeisBandPass(mpp,{"fmin"=>0.002,"fmax"=>0.02,"dt"=>10})

mask = ones(Float32,nz,nmx)
mask[:,int(end/2)+10:end] = 0.
mpp2 = shift_image(mpp,{"dz"=>dz,"shift"=>10})
mpp = (1 - mask).*mpp + mask.*mpp2

vp = mpp.*0 + 2000.
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
SeisWrite("vp",vp[1:nz,:],h);

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

