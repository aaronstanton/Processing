using Seismic

# Migrate data
param = {"adj"=>true,
"vel"=>"v", "wav"=>"wav",
"nt"=>500,"dt"=>0.002,
"sz"=>10, "gz"=>10,
"fmin"=>1., "fmax"=>100.,
"padt"=>2, "padx"=>1,
"omp"=>4,"verbose"=>"y"};
PostStackWEM("m_adj","d",param);

#m_adj,h = SeisRead("m_adj");
#SeisPlot(m_adj,{"dy"=>h[1].d1,"dx"=>h[2].mx-h[1].mx})

