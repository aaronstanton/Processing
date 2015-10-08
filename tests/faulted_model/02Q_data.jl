using PyPlot,Seismic

SeisWindow("d_sorted","near_offset",{"key"=>["hx"],"minval"=>[400]})
d,h = SeisRead("near_offset")
SeisPlot(d,{"name"=>"near_offset","xcur"=>1.0,"style"=>"wiggles","wiggle_trace_increment"=>2,"dy"=>h[1].d1,"ox"=>h[1].mx,"dx"=>h[2].mx - h[1].mx,"ylabel"=>"Time (s)","xlabel"=>"X (m)"})

SeisWindow("d_sorted","one_shot",{"key"=>["sx"],"minval"=>[500]})
d,h = SeisRead("one_shot")
SeisPlot(d,{"name"=>"one_shot","xcur"=>1.0,"style"=>"wiggles","wiggle_trace_increment"=>2,"dy"=>h[1].d1,"ox"=>h[1].hx,"dx"=>h[2].hx - h[1].hx,"ylabel"=>"Time (s)","xlabel"=>"Offset (m)"})

