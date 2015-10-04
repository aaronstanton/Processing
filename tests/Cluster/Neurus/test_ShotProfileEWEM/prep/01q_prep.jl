using Seismic, SeismicPlotting

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

plotpar = ["style"=>"color",
    "vmin"=>-1e-2,"vmax"=>1e-2,"aspect"=>"auto",
    "xlabel"=>"Offset","xunits"=>"(m)","ox"=>0,"dx"=>8.,
    "ylabel"=>"Time","yunits"=>"(s)","oy"=>0.,"dy"=>0.002,
    "wbox"=>8,"hbox"=>8,"cmap"=>"Greys"];

plotpar_vel = ["style"=>"color",
    "vmin"=>500,"vmax"=>3000,
    "aspect"=>"auto",
    "xlabel"=>"X","xunits"=>"(m)","ox"=>0.,"dx"=>8.,
    "ylabel"=>"Z","yunits"=>"(m)","oy"=>0.,"dy"=>dz,
    "wbox"=>16,"hbox"=>8,
    "cmap"=>"jet"];

ux,h = SeisRead("ux_1shot");
SeisPlot(ux,plotpar);
uz,h = SeisRead("uz_1shot");
SeisPlot(uz,plotpar);

vp,h = SeisRead("vp");
SeisPlot(vp,plotpar_vel);
vs,h = SeisRead("vs");
SeisPlot(vs,plotpar_vel);

vp_raw,h = SeisRead("vp_raw");
SeisPlot(vp_raw,plotpar_vel);
vs_raw,h = SeisRead("vs_raw");
SeisPlot(vs_raw,plotpar_vel);

