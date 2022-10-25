module fuse
using Plots, DataFrames, CSV, FITSIO

include("test.jl")

function data1()
   b = FITSIO.read_header("Desktop\\Classes 4-1\\Research\\data\\VI_129_fuse.dat.fits")
   c = FITSIO.FITS("Desktop\\Classes 4-1\\Research\\data\\VI_129_fuse.dat.fits")
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
   for i in eachrow(df)
      if i.Class == 81
         count = count + 1
         print(i.Target, "  ", i.Aper, "  ", i.RAdeg, "    ", i.DEdeg, "\n")
      end
   end
   return (count)
end



end # module fuse
