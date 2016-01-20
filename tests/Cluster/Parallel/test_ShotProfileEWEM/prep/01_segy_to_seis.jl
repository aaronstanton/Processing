using Seismic

# convert velocity files to seis format
SegyToSeis("/home/stanton/data/kevins_model/elastic/vp_mig_8m.rsf","vp",["format"=>"rsf"]);
SegyToSeis("/home/stanton/data/kevins_model/elastic/vs_mig_8m.rsf","vs",["format"=>"rsf"]);
SegyToSeis("/home/stanton/data/kevins_model/elastic/vp_mig_raw_8m.rsf","vp_raw",["format"=>"rsf"]);
SegyToSeis("/home/stanton/data/kevins_model/elastic/vs_mig_raw_8m.rsf","vs_raw",["format"=>"rsf"]);

#convert data files to seis format
SegyToSeis("/home/stanton/data/kevins_model/elastic/dx_8m.rsf","ux_raw1",["format"=>"rsf"]);
SegyToSeis("/home/stanton/data/kevins_model/elastic/dz_8m.rsf","uz_raw1",["format"=>"rsf"]);

#convert wavelet file to seis format
SegyToSeis("/home/stanton/data/kevins_model/elastic/wav_resample.rsf","wav",["format"=>"rsf"]);



