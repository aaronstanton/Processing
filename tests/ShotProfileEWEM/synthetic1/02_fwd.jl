using Seismic

# Born Modelling
param = {"adj"=>false,
"vp"=>"vp", "vs"=>"vs", "wav"=>"wav",
"sz"=>10, "gz"=>10,
"fmin"=>1., "fmax"=>80.,
"padt"=>2, "padx"=>2,
"nhx"=>400, "ohx"=>-2000., "dhx"=>10.,
"nhy"=>1, "ohy"=>0., "dhy"=>10.,
"damping"=>1000.,
"omp"=>4,"verbose"=>"y"};
param["sx"] = [200.:200.:1800];
param["sy"] = param["sx"]*0.;
m = ["mpp","mps1","mps2"];
d = ["ux","uy","uz"];
ShotProfileEWEM(m,d,param);

# Zero some traces randomly
ux,h = SeisRead("ux")
uy,h = SeisRead("uy")
uz,h = SeisRead("uz")

for ix = 1 : size(ux,2)
	a = rand()
	if a < 0.5
		ux[:,ix] = 0.
		uy[:,ix] = 0.
		uz[:,ix] = 0.
	end
end

SeisWrite("uxdec",ux,h);
SeisWrite("uydec",uy,h);
SeisWrite("uzdec",uz,h);

