using Seismic

param = ["adj"=>false,
	 "vp"=>"../prep/vp", "vs"=>"../prep/vs", "wav"=>"../prep/wav",
	 "source_type"=>4,
	 "angpx"=>"../prep/angpx_1shot","angpy"=>"../prep/angpy_1shot",
	 "angsx"=>"../prep/angsx_1shot","angsy"=>"../prep/angsy_1shot",
	 "pade_flag"=>"n",
	 "sz"=>10, "gz"=>550,
	 "fmin"=>1., "fmax"=>50.,
	 "padt"=>2, "padx"=>2,
	 "nangx"=>1, "oangx"=>0, "dangx"=>2,
	 "nangy"=>1, "oangy"=>0, "dangy"=>2,
	 "nhx"=>827, "ohx"=>-3304, "dhx"=>8,
	 "nhy"=>1, "ohy"=>0, "dhy"=>8,
	 "omp"=>12,"verbose"=>"y",
	 "dip"=>"../prep/dipx_slope","NSmooth"=>5,"NSmooth2"=>5];
param["sx"] = [3600.0:100.0:3600.0];
param["sy"] = [3600.0:100.0:3600.0]*0;

DotTest("mpp_rand","mps_rand","msp_rand","mss_rand","ux_rand","uy_rand","uz_rand",[ShotProfileEWEM],param)

