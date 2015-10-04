using Seismic

SCRATCH_PATH = "/global/scratch/stanton/kevins_model/elastic/"

# data and velocity model dimensions
nz = 750;
dz = 4.0;
oz = 0.0;
nmx = 875;
dmx = 8.0;
omx = 0.0;
nmy = 1;
dmy = 0.0;
omy = 0.0;
nt = 2000;
dt = 0.002;
ot = 0.0;
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

# set up headers in velocity files
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
SeisWriteHeaders(join([SCRATCH_PATH,"prep/vp"]),h_v)
SeisWriteHeaders(join([SCRATCH_PATH,"prep/vs"]),h_v)
SeisWriteHeaders(join([SCRATCH_PATH,"prep/vp_raw"]),h_v)
SeisWriteHeaders(join([SCRATCH_PATH,"prep/vs_raw"]),h_v)

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
SeisWriteHeaders(join([SCRATCH_PATH,"prep/ux_raw1"]),h_d)
SeisWriteHeaders(join([SCRATCH_PATH,"prep/uz_raw1"]),h_d)

# set up headers in wavelet file
h_w = Header[]
push!(h_w,Seismic.InitSeisHeader())
h_w[1].tracenum = 1;
h_w[1].n1 = nt;
h_w[1].d1 = dt;
SeisWriteHeaders(join([SCRATCH_PATH,"prep/wav"]),h_w)

# update geometry for d and bin to isx,isy,ihx,ihy
param = ["dsx"=> dsx, "dsy"=> dsy, "osx"=> osx, "osy"=> osy,
         "dhx"=>  dhx, "dhy"=>  dhy, "ohx"=> ohx, "ohy"=> ohy, 
         "gamma"=> 1, "ang"=> 90]
SeisGeometry(join([SCRATCH_PATH,"prep/ux_raw1"]),param);
SeisGeometry(join([SCRATCH_PATH,"prep/uz_raw1"]),param);
SeisSort(join([SCRATCH_PATH,"prep/ux_raw1"]),join([SCRATCH_PATH,"prep/ux_raw2"]),{"key"=>["isx","ihx"]});
SeisSort(join([SCRATCH_PATH,"prep/uz_raw1"]),join([SCRATCH_PATH,"prep/uz_raw2"]),{"key"=>["isx","ihx"]});
SeisWindow(join([SCRATCH_PATH,"prep/ux_raw2"]),join([SCRATCH_PATH,"prep/ux_raw3"]),{"key"=>["isx";"hx";"gx";"gy"],"minval"=>[0;-3304.0;0.0;0.0],"maxval"=>[68;3304.0;6992.0;0.0]})
SeisWindow(join([SCRATCH_PATH,"prep/uz_raw2"]),join([SCRATCH_PATH,"prep/uz_raw3"]),{"key"=>["isx";"hx";"gx";"gy"],"minval"=>[0;-3304.0;0.0;0.0],"maxval"=>[68;3304.0;6992.0;0.0]})

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
SeisBin(join([SCRATCH_PATH,"prep/ux_raw3"]),join([SCRATCH_PATH,"prep/ux_raw4"]),param)
SeisBin(join([SCRATCH_PATH,"prep/uz_raw3"]),join([SCRATCH_PATH,"prep/uz_raw4"]),param)
SeisWindow(join([SCRATCH_PATH,"prep/ux_raw4"]),join([SCRATCH_PATH,"prep/ux"]),{"key"=>["gx" "gy"],"minval"=>[0 0],"maxval"=>[6992.0 0]})
SeisWindow(join([SCRATCH_PATH,"prep/uz_raw4"]),join([SCRATCH_PATH,"prep/uz"]),{"key"=>["gx" "gy"],"minval"=>[0 0],"maxval"=>[6992.0 0]})

# make uy consisting of zeros
ux,h = SeisRead(join([SCRATCH_PATH,"prep/ux"]));
SeisWrite(join([SCRATCH_PATH,"prep/uy"]),ux[1:nt,:].*0,h);

SeisHeaderInfo(join([SCRATCH_PATH,"prep/ux"]));
SeisHeaderInfo(join([SCRATCH_PATH,"prep/uy"]));
SeisHeaderInfo(join([SCRATCH_PATH,"prep/uz"]));

# compute reflector normals 
vp_raw,h = SeisRead(join([SCRATCH_PATH,"prep/vp_raw"]));
coh,pp,res = SeisPWD(vp_raw,["w1"=>30,"w2"=>30,"dx"=>8,"dz"=>8]);
SeisWrite(join([SCRATCH_PATH,"prep/dipx"]),pp,h);
SeisWrite(join([SCRATCH_PATH,"prep/dipy"]),pp*0,h);

coh,pp_slope,res = SeisPWD(vp_raw,["w1"=>30,"w2"=>30,"dx"=>4,"dz"=>4,"format"=>"dip"]);
SeisWrite(join([SCRATCH_PATH,"prep/dipx_slope"]),pp_slope,h);
SeisWrite(join([SCRATCH_PATH,"prep/dipy_slope"]),pp_slope*0,h);

SeisWindow(join([SCRATCH_PATH,"prep/ux"]),join([SCRATCH_PATH,"prep/ux_1shot"]),{"key"=>["isx"],"minval"=>[35]})
SeisWindow(join([SCRATCH_PATH,"prep/uy"]),join([SCRATCH_PATH,"prep/uy_1shot"]),{"key"=>["isx"],"minval"=>[35]})
SeisWindow(join([SCRATCH_PATH,"prep/uz"]),join([SCRATCH_PATH,"prep/uz_1shot"]),{"key"=>["isx"],"minval"=>[35]})

