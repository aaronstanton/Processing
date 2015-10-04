using Seismic

d,h = SeisRead("d_binned")
ddec,h = SeisDecimate(d,h,{"mode"=>"random","perc"=>30})
ddec[:,65:70] = 0. # make a gap
SeisWrite("ddec",ddec,h);

