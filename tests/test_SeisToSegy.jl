my_path_to_Seismic = "/home/kstanton/Seismic"
push!(LOAD_PATH, join([my_path_to_Seismic "/src"]))
using Seismic

SegyToSeis("/u1/data/GOM_data/near_offset_section_swap.su","tmp",true);
SeisHeaderInfo("tmp")
SeisToSegy("tmp","tmp.su",true);

rm("tmp.seisd")
rm("tmp.seish")
rm("tmp.su")
