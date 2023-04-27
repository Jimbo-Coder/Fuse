module fuse
using Plots, DataFrames, CSV, FITSIO

include("test.jl")

function data1()
   b = FITSIO.read_header("C:Users\\maxri\\Desktop\\Classes_4-1\\Research\\data\\VI_129_fuse.dat.fits")
   c = FITSIO.FITS("C:Users\\maxri\\Desktop\\Classes_4-1\\Research\\data\\VI_129_fuse.dat.fits")
   return (b, c)
end

function counter(x)
   df = DataFrame(x[2])
   count = 0
   for i in eachrow(df)
      if i.Class == 81 && i.Aper == "LWRS"
         count = count + 1
      end
   end

   count = 0

   objs = ["NGC7496",  
   "NGC7714",
   "NGC7673",
   "NGC7662",
   "NGC7496",
   "NGC7469",
   "NGC7354",
   "NGC6826",
   "NGC7094",
   "NGC7090",
   "NGC7078",
   "NGC7027",
   "NGC7023",
   "NGC7009",
   "NGC6992",
   "NGC6905",
   "NGC6891"]

   
   for i in eachrow(df)
      if i.Class == 81
         count = count + 1
         #print(i.Target, "  ", i.Aper, "  ", i.RAdeg, "    ", i.DEdeg, "\n")
      end
      
      for j in range(1,16)
         if i.Target == objs[j]
            print(i)
         end
      end
   end
   

   return (count)
end



end # module fuse
