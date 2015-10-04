@everywhere using Seismic

param = {"style"=>"mxmyhxhy",
"dmx"=>1,"dmy"=>1,"omx"=>0,"omy"=>0,"min_imx"=>0,"max_imx"=>199,"min_imy"=>0,"max_imy"=>0,
"dhx"=>1,"dhy"=>1,"ohx"=>0,"ohy"=>0,"min_ihx"=>0,"max_ihx"=>0,"min_ihy"=>0,"max_ihy"=>0}
param["it_WL"] = 50
param["it_WO"] = 5
param["ix1_WL"] = 50
param["ix1_WO"] = 5
param["nt"] = 200

@everywhere global f_param = {"style"=>"mxmyhxhy","Niter"=>300,"fmax"=>80,"padt"=>3,"padx"=>3,"p"=>1.}
@everywhere global f = [SeisPOCS] 
SeisPatchProcess("ddec","dpocs_soft",param)

