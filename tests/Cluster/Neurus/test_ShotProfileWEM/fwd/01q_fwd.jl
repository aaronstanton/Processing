using PyPlot,Seismic

SeisHeaderInfo("uz_1shot")

plotpar = ["style"=>"color","aspect"=>"auto","xlabel"=>"X","xunits"=>"(m)","ox"=>0.,"dx"=>8.,"ylabel"=>"Time","yunits"=>"(s)","oy"=>0.,"dy"=>0.002,"cmap"=>"Greys","wbox"=>5,"hbox"=>8,"pclip"=>5];

uz,h = SeisRead("../prep/uz_1shot");
SeisPlot(uz,plotpar);

uz,h = SeisRead("uz_1shot");
SeisPlot(uz,plotpar);

