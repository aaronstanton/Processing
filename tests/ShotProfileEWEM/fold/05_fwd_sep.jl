using Seismic

param = {"adj"=>false,
    "vp"=>"vp", "vs"=>"vs", "wav"=>"wav",
    "sz"=>10, "gz"=>10,
    "fmin"=>1., "fmax"=>50.,
    "padt"=>2, "padx"=>2,
    "nangx"=>1, "oangx"=>0, "dangx"=>5,
    "nangy"=>1, "oangy"=>0, "dangy"=>2,
    "nhx"=>721, "ohx"=>-1800, "dhx"=>5,
    "nhy"=>1, "ohy"=>0, "dhy"=>10,
    "verbose"=>true}
param["sx"] = [2000.0:100.0:2000.0];
param["sy"] = [2000.0:100.0:2000.0]*0;

m0,h = SeisRead("mpp_ls");
SeisWrite("m01",m0.*0,h);
SeisWrite("m02",m0.*0,h);
SeisWrite("m03",m0.*0,h);

d_p = ["ux_fwd2_p";"uy_fwd2_p";"uz_fwd2_p"]
d_s = ["ux_fwd2_s";"uy_fwd2_s";"uz_fwd2_s"]
m_p = ["mpp_ls";"m01";"m02"]
m_s = ["m01";"m02";"mps2_ls"]
ShotProfileEWEM(m_p,d_p,param)
ShotProfileEWEM(m_s,d_s,param)
d_p_mute = ["ux_fwd2_p_mute";"uy_fwd2_p_mute";"uz_fwd2_p_mute"]
d_s_mute = ["ux_fwd2_s_mute";"uy_fwd2_s_mute";"uz_fwd2_s_mute"]
SeisMute(d_p_mute,d_p,{"tmute"=>0.8,"vmute"=>1500})
SeisMute(d_s_mute,d_s,{"tmute"=>0.8,"vmute"=>1500})


