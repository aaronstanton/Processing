@everywhere my_path_to_Seismic = "/home/kstanton/Seismic"
@everywhere push!(LOAD_PATH, join([my_path_to_Seismic "/src"]))
@everywhere using Seismic

# convert a segy file to a seis file, update geometry, 
# sort using two keys, window, then display header info
# ======================================================

#SegyToSeis("/u1/data/GOM_data/data_swap.su","tmp1",true);
#SeisHeaderInfo("tmp1");
param = ["dmx"=> 26.670, "dmy"=> 26.670, "omx"=> 10908.03, "omy"=>   0.00,
         "dhx"=> 26.670, "dhy"=> 26.670, "ohx"=>     0.00, "ohy"=>   0.00, 
         "dsx"=> 13.335, "dsy"=> 13.335, "osx"=> 13345.28, "osy"=>   0.00,
         "dgx"=> 13.335, "dgy"=> 13.335, "ogx"=>  8470.69, "ogy"=>   0.00,
         "dh" => 26.670, "daz"=> 20.000, "oh" =>     0.00, "oaz"=> 180.00,
         "gamma"=> 1, "ang"=> 90]
#SeisGeometry("tmp1",param);
#SeisHeaderInfo("tmp1");
#SeisSort("tmp1","tmp2",["ihx","imx"]);
#SeisHeaderInfo("tmp2");
#SeisWindow("tmp2","tmp3",["ihx"],[-100])
#SeisHeaderInfo("tmp3");

# add binning parameters to param
param["min_imx"] = 0
param["max_imx"] = 900
param["min_imy"] = 0
param["max_imy"] = 0
param["min_ihx"] = -100
param["max_ihx"] = -100
param["min_ihy"] = 0
param["max_ihy"] = 0
param["style"] = "mxmyhxhy"
#SeisBin("tmp3","tmp4",param)
#SeisHeaderInfo("tmp4");

# decimate some traces to test POCS
d,h = SeisRead("tmp4")
param["mode"] = "random"
param["perc"] = 50
d,h = SeisDecimate(d,h,param)
SeisWrite("tmp5",d,h)


# add patching parameters to param
param["it_WL"] = 100
param["it_WO"] = 20
param["ix1_WL"] = 100
param["ix1_WO"] = 20
param["nt"] = 1751

@everywhere global f_param = ["style"=>"mxmyhxhy","Niter_external"=> 3,"Niter_internal"=> 30,"fmax"=>80]
@everywhere global f = [SeisMWNI] 

SeisPatchProcess("tmp5","tmp6",param)

#rm("tmp1.seisd")
#rm("tmp1.seish")
#rm("tmp2.seisd")
#rm("tmp2.seish")
#rm("tmp3.seisd")
#rm("tmp3.seish")
#rm("tmp4.seisd")
#rm("tmp4.seish")
#rm("tmp5.seisd")
#rm("tmp5.seish")
#rm("tmp6.seisd")
#rm("tmp6.seish")
