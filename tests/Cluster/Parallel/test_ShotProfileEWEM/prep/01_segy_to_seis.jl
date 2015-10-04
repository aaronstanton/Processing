using Seismic

SCRATCH_PATH = "/global/scratch/stanton/kevins_model/elastic/"

# convert velocity files to seis format
SegyToSeis("/home/stanton/data/kevins_model/elastic/vp_mig_8m.rsf",join([SCRATCH_PATH,"prep/vp"]),["format"=>"rsf"]);
SegyToSeis("/home/stanton/data/kevins_model/elastic/vs_mig_8m.rsf",join([SCRATCH_PATH,"prep/vs"]),["format"=>"rsf"]);
SegyToSeis("/home/stanton/data/kevins_model/elastic/vp_mig_raw_8m.rsf",join([SCRATCH_PATH,"prep/vp_raw"]),["format"=>"rsf"]);
SegyToSeis("/home/stanton/data/kevins_model/elastic/vs_mig_raw_8m.rsf",join([SCRATCH_PATH,"prep/vs_raw"]),["format"=>"rsf"]);

#convert data files to seis format
SegyToSeis("/home/stanton/data/kevins_model/elastic/dx_8m.rsf",join([SCRATCH_PATH,"prep/ux_raw1"]),["format"=>"rsf"]);
SegyToSeis("/home/stanton/data/kevins_model/elastic/dz_8m.rsf",join([SCRATCH_PATH,"prep/uz_raw1"]),["format"=>"rsf"]);

#convert wavelet file to seis format
SegyToSeis("/home/stanton/data/kevins_model/elastic/wav_resample.rsf",join([SCRATCH_PATH,"prep/wav"]),["format"=>"rsf"]);



