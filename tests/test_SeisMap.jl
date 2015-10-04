using Seismic

SegyToSeis("/Users/astanton/Seismic/data/1shot.segy","d",false,true);
data,headers = SeisRead("d"); 
plotpar = ["style"=>"sxsygxgy",
           "title"=>"Shot and Receiver Coordinates",
           "dy"=>headers[1].d1,"ylabel"=>"time","yunits"=>" ",
           "xlabel"=>"Midpoint","xunits"=>" ",
           "ox"=>headers[1].sx,"dx"=>(headers[end].imx - headers[1].imx)/length(headers),
           "aspect"=>"auto","wbox"=>10,"hbox"=>10,"name"=>"tmp"];
SeisMap(headers,plotpar);

