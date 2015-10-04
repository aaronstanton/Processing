using Seismic

download("http://seismic.physics.ualberta.ca/data/mc_no.su","mc_no.su");
SegyToSeis("mc_no.su","mc_no",{"format"=>"su","input_type"=>"ieee","swap_bytes"=>true})
SeisWindow("mc_no","d",{"key"=>["t";"tracenum"],"minval"=>[1.604;251],"maxval"=>[2.400;450]})

h = SeisReadHeaders("d");
for j = 1 : length(h)
	h[j].o1 = 0.
	h[j].imx = j-1
	h[j].imy = 0
	h[j].ihx = 0
	h[j].ihy = 0
end
SeisWriteHeaders("d",h)
binning_params = {"style"=>"mxmyhxhy",
"dmx"=>1,"dmy"=>1,"omx"=>0,"omy"=>0,"min_imx"=>0,"max_imx"=>199,"min_imy"=>0,"max_imy"=>0,
"dhx"=>1,"dhy"=>1,"ohx"=>0,"ohy"=>0,"min_ihx"=>0,"max_ihx"=>0,"min_ihy"=>0,"max_ihy"=>0}
SeisBin("d","d_binned",binning_params)

