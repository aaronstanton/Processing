my_path_to_Seismic = "/home/kstanton/Seismic"
push!(LOAD_PATH, join([my_path_to_Seismic "/src"]))
using Seismic
using PyCall
@pyimport matplotlib.pyplot as plt

d = SeisLinearEvents();
nt = size(d,1); nx = convert(Int64,length(d[:])/nt);
h = Array(Header,nx);
for ix = 1:nx
  h[ix] = Seismic.InitSeisHeader();
  h[ix].tracenum = ix;
  h[ix].d1 = 0.004;
  h[ix].n1 = nt;
  h[ix].imx = ix;
  h[ix].imy = 0;
  h[ix].ihx = 0;
  h[ix].ihy = 0;
end

param = ["mode"=>"random","perc"=> 50]
ddec,h = SeisDecimate(d,h,param)

f1 = plt.figure(1)
plt.imshow(ddec[1:nt,:],cmap="PuOr",aspect="auto",vmin=-1,vmax=1)
plt.title("ddec")
plt.xlabel("X (m)")
plt.ylabel("T (s)")
plt.show()

param = ["style"=>"mxmyhxhy","Niter"=> 100,"fmax"=>80]
dpocs,h = SeisPOCS(ddec,h,param)

f2 = plt.figure(2)
plt.imshow(dpocs[1:nt,:],cmap="PuOr",aspect="auto",vmin=-1,vmax=1)
plt.title("dpocs")
plt.xlabel("X (m)")
plt.ylabel("T (s)")
plt.show()
