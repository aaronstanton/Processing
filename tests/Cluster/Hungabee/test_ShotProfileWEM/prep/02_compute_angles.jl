using Seismic

# compute angles wrt reflector normal
param = ["vel"=>"vp", "wav"=>"wav", 
    "dip_flag"=>"y","dipx"=>"dipx","dipy"=>"dipy",
    "sz"=>10,"fmin"=>20., "fmax"=>30.,
    "nhx"=>827, "ohx"=>-3304, "dhx"=>8,
    "nhy"=>1, "ohy"=>0, "dhy"=>8,
    "omp"=>8,"verbose"=>"y"];
param["sx"] = [5100.0:100.0:5100.0];
param["sy"] = [5100.0:100.0:5100.0]*0;
ComputeAngles("angx","angy",param);

