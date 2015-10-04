using Seismic

param = ["dip"=>"../prep/dipx_slope","NSmooth"=>5,"Nsmooth2"=>5];
DotTest("m_rand","d_rand",[SmoothGathers],param)

