using Seismic

m = zeros(Float32,700,500)
v = fill(1500.0f0,700,500)
d = zeros(Float32,700,1)
t,w = SeisWavelets.Ricker({"dt"=>0.001,"fc"=>50});
d[450:449 + length(w),1] = w 

param = { "v"=>v, 
"dx"=>10.0f0, "dy"=> 10.0f0, 
"sx"=>[2500.0f0], "sy"=> [0.0f0],
"gx"=>[2500.0f0], "gy"=> [0.0f0],
"ot"=>0.0f0, "dt"=> 0.001f0,
"aperture"=>1000.0f0}

SeisPSTM(m,d,param)

h = Header[]
for ix = 1 : size(d,2)
	push!(h,Seismic.InitSeisHeader())
	h[ix].n1 = size(d,1)
	h[ix].d1 = 0.001
end
SeisWrite("d",d,h)

h = Header[]
for ix = 1 : size(m,2)
	push!(h,Seismic.InitSeisHeader())
	h[ix].n1 = size(m,1)
	h[ix].d1 = 0.001
end
SeisWrite("m",m,h)


