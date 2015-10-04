using Seismic

param = {"style"=>"mxmyhxhy",
"dmx"=>1,"dmy"=>1,"omx"=>0,"omy"=>0,"min_imx"=>0,"max_imx"=>199,"min_imy"=>0,"max_imy"=>0,
"dhx"=>1,"dhy"=>1,"ohx"=>0,"ohy"=>0,"min_ihx"=>0,"max_ihx"=>0,"min_ihy"=>0,"max_ihy"=>0}
param["it_WL"] = 120
param["it_WO"] = 5
param["ix1_WL"] = 199
param["ix1_WO"] = 0
param["nt"] = 200

patch_names = SeisPatch("d_binned","d_binned",param)
SeisUnPatch(patch_names,"d_binned_patch_unpatch",param)

