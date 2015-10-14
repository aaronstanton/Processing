using Seismic
d = zeros(Float32,50); d[25] = 1.0
d_smoothed = d.*1
#triangle_filter(5,length(d),length(d),d,d_smoothed);
d_int1 = d.*0
d_int2 = d.*0
Seismic.integrate(length(d),d,d_int1,false)
Seismic.integrate(length(d),d_int2,d_int1,true)

