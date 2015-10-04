using Seismic

# data and velocity model dimensions
nz = 750;
dz = 4;
oz = 0;
nmx = 875;
dmx = 8;
omx = 0;
nmy = 1;
dmy = 0;
omy = 0;
nt = 2000;
dt = 0.002;
ot = 0;
nsx = 69;
dsx = 100.0;
osx = 100.0;
nsy = 1;
dsy = 100.0;
osy = 0.0;
dhx = 8.0;
ohx = -3304.0;
dhy = 8.0;
ohy = 0.0;

# read velocity files
SegyToSeis("/u4/data/synthetic/kevins_model/elastic/vp_mig.rsf","vp","rsf");
vp,h_v = SeisRead("vp");
vp = reshape(vp,nz,nmx,nmy);

SegyToSeis("/u4/data/synthetic/kevins_model/elastic/vs_mig.rsf","vs","rsf");
vs,h_v = SeisRead("vs");
vs = reshape(vs,nz,nmx,nmy);

# set up headers in velocity files
h_v = Array(Header,nmx*nmy);
for imx = 1:nmx
for imy = 1:nmy
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
SeisWrite("vp",vp[1:nz,:],h_v);

SeisWrite("vs",vs[1:nz,:],h_v);

# read velocity files
SegyToSeis("/u4/data/synthetic/kevins_model/elastic/vp_mig_raw.rsf","vp_raw","rsf");
vp_raw,h_v = SeisRead("vp_raw");
vp_raw = reshape(vp_raw,nz,nmx,nmy);
# set up headers in velocity files
h_v = Array(Header,nmx*nmy);
for imx = 1:nmx
for imy = 1:nmy
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
SeisWrite("vp_raw",vp_raw[1:nz,:],h_v);


# read a data files
SegyToSeis("/u4/data/synthetic/kevins_model/elastic/dz.rsf","uz","rsf");
uz,h_d = SeisRead("uz");
# set up headers in data files
h_d = Array(Header,nsx*nsy*nmx*nmy);
for isx = 1:nsx
for isy = 1:nsy
for imx = 1:nmx
for imy = 1:nmy
  h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy] = Seismic.InitSeisHeader();
  h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].tracenum = (isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy;
  h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].n1 = nt;
  h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].d1 = dt;
  h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].gx = (imx-1)*dmx + omx;
  h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].gy = (imy-1)*dmy + omy;
  h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].igx = imx-1;
  h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].igy = imy-1;
  h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].sx = (isx-1)*dsx + osx;
  h_d[(isx-1)*nsy*nmx*nmy + (isy-1)*nmx*nmy + (imx-1)*nmy + imy].sy = (isy-1)*dsy + osy;
end
end
end
end
SeisWrite("uz_raw1",uz[1:nt,:],h_d);
SegyToSeis("/u4/data/synthetic/kevins_model/elastic/wav_resample.rsf","wav","rsf");
w,h_w = SeisRead("wav");
# set up headers in wavelet file
h_w = Array(Header,1);
h_w[1] = Seismic.InitSeisHeader();h_w[1].tracenum = 1;
h_w[1].n1 = nt;
h_w[1].d1 = dt;
SeisWrite("wav",w[:],h_w);

# update geometry for d and bin to isx,isy,ihx,ihy
param = ["dsx"=> dsx, "dsy"=> dsy, "osx"=> osx, "osy"=> osy,
         "dhx"=>  dhx, "dhy"=>  dhy, "ohx"=> ohx, "ohy"=> ohy, 
         "gamma"=> 1, "ang"=> 90]
SeisGeometry("uz_raw1",param);
SeisSort("uz_raw1","uz_raw2",["isx","ihx"],false);
SeisWindow("uz_raw2","uz_raw3",["isx" "hx" "gx" "gy"],[0 -3304.0 0.0 0.0],[68 3304.0 6992.0 0.0])

# add binning parameters to param
param["min_isx"] = 0
param["max_isx"] = 68
param["min_isy"] = 0
param["max_isy"] = 0
param["min_ihx"] = 0
param["max_ihx"] = 826
param["min_ihy"] = 0
param["max_ihy"] = 0
param["style"] = "sxsyhxhy"
SeisBin("uz_raw3","uz_raw4",param)
SeisWindow("uz_raw4","uz",["gx" "gy"],[0 0],[6992.0 0])
SeisHeaderInfo("uz");

# compute reflector normals 
vp_raw,h = SeisRead("vp_raw");
coh,pp,res = SeisPWD(vp_raw,["w1"=>30,"w2"=>30,"dx"=>8,"dz"=>4]);
SeisWrite("dipx",pp,h);
SeisWrite("dipy",pp*0,h);


SeisWindow("uz","uz_1shot",["isx"],[35],[35])


