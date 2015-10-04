using Seismic, SeismicPlotting

plotpar_vel = ["style"=>"color",
    "vmin"=>500,"vmax"=>3000,
    "aspect"=>"auto",
    "xlabel"=>"X","xunits"=>"(m)","ox"=>0.,"dx"=>8.,
    "ylabel"=>"Z","yunits"=>"(m)","oy"=>0.,"dy"=>dz,
    "wbox"=>16,"hbox"=>8,
    "cmap"=>"jet"];

# compute reflector normals 
vp_raw,h = SeisRead("vp_raw");
coh,pp,res = SeisPWD(vp_raw,["w1"=>30,"w2"=>30,"dx"=>8,"dz"=>4]);
SeisWrite("dipx",pp,h);
SeisWrite("dipy",pp*0,h);

SeismicPlotting.figure(1);
# plot reflector normals over velocity model
plotpar_vel["fignum"]=1;
SeisPlot(vp_raw,plotpar_vel); 
SeismicPlotting.hold("true");
L = 1;
pp_x = cos((pp[50:50:end,50:50:end]-90)*pi/180)*L;
pp_y = sin((pp[50:50:end,50:50:end]-90)*pi/180)*L;
SeismicPlotting.quiver([49:50:size(pp,2)-1]*8,[49:50:size(pp,1)-1]*h[1].d1,
pp_x, pp_y,angles="xy",scale=25,color="black");

SeismicPlotting.figure(2);
SeisWindow("angx","angx_1shot",["sx"],[5100],[5100]);
SeisWindow("angy","angy_1shot",["sx"],[5100],[5100]);
angx,h = SeisRead("angx_1shot");
angy,h = SeisRead("angy_1shot");
plotpar_vel["vmin"]=-70; plotpar_vel["vmax"]=70;plotpar_vel["ox"]=h[1].mx;
plotpar_vel["fignum"]=2;
SeisPlot(angx,plotpar_vel);
