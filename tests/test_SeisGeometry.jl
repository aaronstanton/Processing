my_path_to_Seismic = "/home/kstanton/Seismic"
push!(LOAD_PATH, join([my_path_to_Seismic "/src"]))
using Seismic

# convert a segy file to a seis file, update geometry, 
# sort using two keys, window, then display header info
# ======================================================


SegyToSeis("/u1/data/GOM_data/data_swap.su","tmp1",true);
param = ["dmx"=> 13.335, "dmy"=> 13.335, "omx"=>  8470.69, "omy"=> 0,
         "dhx"=>  26.67, "dhy"=>  26.67, "ohx"=>     0.00, "ohy"=> 0, 
         "dsx"=> 13.335, "dsy"=> 13.335, "osx"=> 13345.28, "osy"=> 0,
         "dgx"=> 13.335, "dgy"=> 13.335, "ogx"=>  8470.69, "ogy"=> 0,
         "gamma"=> 1, "ang"=> 90]
SeisGeometry("tmp1",param);
SeisSort("tmp1","tmp2",["ihx","imx"],false);
SeisWindow("tmp2","tmp3",["ihx"],[-100])
SeisHeaderInfo("tmp3");


rm("tmp1.seisd")
rm("tmp1.seish")
rm("tmp2.seisd")
rm("tmp2.seish")
rm("tmp3.seisd")
rm("tmp3.seish")
