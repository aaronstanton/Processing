using Seismic

# convert velocity files to seis format
SegyToSeis("/Users/astanton/Documents/fold/vp_smooth.rsf","vp",["format"=>"rsf"]);
SegyToSeis("/Users/astanton/Documents/fold/vs_smooth.rsf","vs",["format"=>"rsf"]);
SegyToSeis("/Users/astanton/Documents/fold/vp.rsf","vp_raw",["format"=>"rsf"]);
SegyToSeis("/Users/astanton/Documents/fold/vs.rsf","vs_raw",["format"=>"rsf"]);
#SegyToSeis("/Users/astanton/Documents/fold/ref_pp.rsf","mpp",["format"=>"rsf"]);
#SegyToSeis("/Users/astanton/Documents/fold/ref_ps1.rsf","mps1",["format"=>"rsf"]);
#SegyToSeis("/Users/astanton/Documents/fold/ref_ps2.rsf","mps2",["format"=>"rsf"]);
SegyToSeis("/Users/astanton/Documents/fold/ux_1shot.rsf","ux_raw1",["format"=>"rsf"]);
SegyToSeis("/Users/astanton/Documents/fold/uz_1shot.rsf","uz_raw1",["format"=>"rsf"]);

#convert wavelet file to seis format
SegyToSeis("/Users/astanton/Documents/fold/wav_resample.rsf","wav",["format"=>"rsf"]);


