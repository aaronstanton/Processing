using Seismic

v,h_v = SeisRead("vp")
dt = 0.002f0
dx = h_v[2].mx - h_v[1].mx
param = { "dx"=> dx, "dy"=> dx, "dt"=> dt, "aperture"=>1000.0f0}
d,h = SeisRead("near_offset") 
param["sx"] = Seismic.ExtractHeader(h,"sx")
param["sy"] = Seismic.ExtractHeader(h,"sy")
param["gx"] = Seismic.ExtractHeader(h,"gx")
param["gy"] = Seismic.ExtractHeader(h,"gy")

nx = h_v[end].imx - h_v[1].imx + 1
println(nx)
nt = h[1].n1
println(nt)

m = zeros(Float32,nt,nx)
param["v"] = m.*0.0f0 + 2000.0f0
SeisPSTM(m,d,param)
SeisWrite("m_pstm",m,h_v)

