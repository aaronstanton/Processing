using Seismic

mpp_adj,h,s = SeisRead("../prep/vp");

mpp_rand = rand(size(mpp_adj));
SeisWrite("mpp_rand",mpp_rand,h);
mps_rand = rand(size(mpp_adj));
SeisWrite("mps_rand",mps_rand,h);
msp_rand = rand(size(mpp_adj));
SeisWrite("msp_rand",msp_rand,h);
mss_rand = rand(size(mpp_adj));
SeisWrite("mss_rand",mss_rand,h);

ux,h,s = SeisRead("../prep/ux_1shot");

ux_rand = rand(size(ux));
SeisWrite("ux_rand",ux_rand,h);
uy_rand = rand(size(ux));
SeisWrite("uy_rand",uy_rand,h);
uz_rand = rand(size(ux));
SeisWrite("uz_rand",uz_rand,h);
