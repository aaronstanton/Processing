using PyPlot,Seismic

m,h = SeisRead("mpp")
SeisPlot(m,{"name"=>"m","xcur"=>1.2,"style"=>"wiggles","wiggle_trace_increment"=>2,"dy"=>h[1].d1,"ox"=>h[1].mx,"dx"=>h[2].mx - h[1].mx,"ylabel"=>"Depth (m)","xlabel"=>"X (m)"})

