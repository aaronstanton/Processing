using Seismic

# compute angles wrt reflector normal
param = ["vel"=>"vp", "wav"=>"wav", 
    "dip_flag"=>"y","dipx"=>"dipx","dipy"=>"dipy",
    "sz"=>10,"fmin"=>20., "fmax"=>30.,
    "nhx"=>827, "ohx"=>-3304, "dhx"=>8,
    "nhy"=>1, "ohy"=>0, "dhy"=>8,
    "omp"=>8,"verbose"=>"y"];
param["sx"] = [100.0:100.0:6900.0];
param["sy"] = [100.0:100.0:6900.0]*0;
ComputeAngles("angx","angy",param);

SeisWindow("angx","angx_1shot",["sx"],[3600],[3600])
SeisWindow("angy","angy_1shot",["sx"],[3600],[3600])
