my_path_to_Seismic = "/home/kstanton/Seismic"
push!(LOAD_PATH, join([my_path_to_Seismic "/src"]))
using Seismic

d_rand = rand(100,100,100) + rand(100,100,100)*1im;
m_rand = rand(100,100,100) + rand(100,100,100)*1im;
param = ["foo"=>1];
DotTest(fft_op,param,d_rand,m_rand);



