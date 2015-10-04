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

SeismicPlotting.figure(1);
SeisWindow("uz","uz_1shot",["isx"],[50],[50]);
uz,h = SeisRead("uz_1shot");
plotpar["fignum"]=1;
SeisPlot(uz,plotpar);

SeismicPlotting.figure(2);
vp,h = SeisRead("vp");
plotpar_vel["fignum"]=2;
SeisPlot(vp,plotpar_vel);

SeismicPlotting.figure(3);
vp_raw,h = SeisRead("vp_raw");
plotpar_vel["fignum"]=3;
SeisPlot(vp_raw,plotpar_vel);

