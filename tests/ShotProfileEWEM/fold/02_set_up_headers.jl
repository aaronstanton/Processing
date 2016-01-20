using Seismic

# data and velocity model dimensions
nz = 450;
dz = 5.0;
oz = 0.0;
nmx = 780;
dmx = 5.0;
omx = 0.0;
nmy = 1;
dmy = 5.0;
omy = 0.0;
nt = 1000;
dt = 0.004;
ot = 0.0;
nsx = 1;
dsx = 100.0;
osx = 2000.0;
nsy = 1;
dsy = 100.0;
osy = 0.0;
dhx = copy(dmx);
ohx = -1800.0;
dhy = copy(dmy);
ohy = 0.0;
nhx = int(abs(ohx/dhx)*2 + 1);
nhy = int(abs(ohy/dhy)*2 + 1);

# set up headers in velocity and model files
h_v = Header[]
for imx = 1:nmx
	for imy = 1:nmy
		push!(h_v,Seismic.InitSeisHeader())
		h_v[(imx-1)*nmy + imy] = Seismic.InitSeisHeader();
		h_v[(imx-1)*nmy + imy].tracenum = (imx-1)*nmy + imy;
		h_v[(imx-1)*nmy + imy].n1 = nz;
		h_v[(imx-1)*nmy + imy].d1 = dz;
		h_v[(imx-1)*nmy + imy].mx = (imx-1)*dmx + omx;
		h_v[(imx-1)*nmy + imy].my = (imy-1)*dmy + omy;
		h_v[(imx-1)*nmy + imy].imx = imx-1;
		h_v[(imx-1)*nmy + imy].imy = imy-1;
	end
end
SeisWriteHeaders("vp",h_v)
SeisWriteHeaders("vs",h_v)
SeisWriteHeaders("vp_raw",h_v)
SeisWriteHeaders("vs_raw",h_v)
SeisWriteHeaders("mpp",h_v)
SeisWriteHeaders("mps1",h_v)
SeisWriteHeaders("mps2",h_v)

# set up headers in data files
h_d = Header[]
for isx = 1:nsx
	for isy = 1:nsy
		for imx = 1:nmx
			for imy = 1:nmy
				push!(h_d,Seismic.InitSeisHeader())
				h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy] = Seismic.InitSeisHeader();
				h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].tracenum = (isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy;
				h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].n1 = nt;
				h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].d1 = dt;
				h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].gx = (imx-1)*dmx + omx;
				h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].gy = (imy-1)*dmx + omy;
				h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].igx = imx-1;
				h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].igy = imy-1;
				h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].sx = (isx-1)*dsx + osx;
				h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].sy = (isy-1)*dsy + osy;
			end
		end
	end
end
SeisWriteHeaders("ux_raw1",h_d)
SeisWriteHeaders("uz_raw1",h_d)

# set up headers in wavelet file
h_w = Header[]
push!(h_w,Seismic.InitSeisHeader())
h_w[1].tracenum = 1;
h_w[1].n1 = nt;
h_w[1].d1 = dt;
SeisWriteHeaders("wav",h_w)

wav,h = SeisRead("wav")
wav = 100.*wav/maximum(wav)
SeisWrite("wav",wav,h)

# update geometry for d and bin to isx,isy,ihx,ihy
param = {"dsx"=> dsx, "dsy"=> dsy, "osx"=> osx, "osy"=> osy,
"dhx"=>  dhx, "dhy"=>  dhy, "ohx"=> ohx, "ohy"=> ohy, 
"gamma"=> 1, "ang"=> 90}
SeisGeometry("ux_raw1",param);
SeisGeometry("uz_raw1",param);
SeisSort("ux_raw1","ux_raw2",{"key"=>["isx","ihx"]});
SeisSort("uz_raw1","uz_raw2",{"key"=>["isx","ihx"]});
println(ohx)
println(nhx)
println(ohx + (nhx-1)*dhx)
SeisWindow("ux_raw2","ux_raw3",{"key"=>["isx";"hx";"gx";"gy"],"minval"=>[0;ohx;0;0],"maxval"=>[nsx-1;ohx + (nhx-1)*dhx;3892;0]})
SeisWindow("uz_raw2","uz_raw3",{"key"=>["isx";"hx";"gx";"gy"],"minval"=>[0;ohx;0;0],"maxval"=>[nsx-1;ohx + (nhx-1)*dhx;3892;0]})

# add binning parameters to param
param["min_isx"] = 0
param["max_isx"] = nsx-1
param["min_isy"] = 0
param["max_isy"] = nsy-1
param["min_ihx"] = 0
param["max_ihx"] = nhx-1
param["min_ihy"] = 0
param["max_ihy"] = nhy-1
param["style"] = "sxsyhxhy"
SeisBin("ux_raw3","ux_raw4",param)
SeisBin("uz_raw3","uz_raw4",param)
SeisWindow("ux_raw4","ux",{"key"=>["gx" "gy"],"minval"=>[0 0],"maxval"=>[omx + (nmx-1)*dmx 0]})
SeisWindow("uz_raw4","uz",{"key"=>["gx" "gy"],"minval"=>[0 0],"maxval"=>[omx + (nmx-1)*dmx 0]})

# make uy consisting of zeros
ux,h = SeisRead("ux");
SeisWrite("uy",ux[1:nt,:].*0,h);

SeisHeaderInfo("ux");
SeisHeaderInfo("uy");
SeisHeaderInfo("uz");

ux,h = SeisRead("ux");
uy,h = SeisRead("uy");
uz,h = SeisRead("uz");
for ix = 1 : length(h)
	if rand() < 0.5
		ux[:,ix] = 0.
		uy[:,ix] = 0.
		uz[:,ix] = 0.
	end
end
ux,h = SeisMute(ux,h,{"tmute"=>0.9,"vmute"=>1000,"taper"=>0.5});
uy,h = SeisMute(uy,h,{"tmute"=>0.9,"vmute"=>1000,"taper"=>0.5});
uz,h = SeisMute(uz,h,{"tmute"=>0.9,"vmute"=>1000,"taper"=>0.5});
SeisWrite("ux",ux,h)
SeisWrite("uy",uy,h)
SeisWrite("uz",uz,h)

#SeisWindow("ux","ux_1shot",{"key"=>["isx"],"minval"=>[0]})
#SeisWindow("uy","uy_1shot",{"key"=>["isx"],"minval"=>[0]})
#SeisWindow("uz","uz_1shot",{"key"=>["isx"],"minval"=>[0]})


