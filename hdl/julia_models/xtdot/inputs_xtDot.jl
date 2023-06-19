# xtDot_inputs
#
# Format the Inputs for xdot.v

#-------------------------------------------------------------------------------
# Import Libraries
#-------------------------------------------------------------------------------
using LinearAlgebra
using FixedPointNumbers

#-------------------------------------------------------------------------------
# Data Type
#-------------------------------------------------------------------------------
CUSTOM_TYPE = Fixed{Int32,16} # data type

#-------------------------------------------------------------------------------
# Fixed-Point Parameters
#-------------------------------------------------------------------------------
WIDTH = 32
DECIMAL_BITS = 16

#-------------------------------------------------------------------------------
# Define Test Function
#-------------------------------------------------------------------------------
function xtDotTest(CUSTOM_TYPE,li,col,WIDTH,DECIMAL_BITS)
   #----------------------------------------------------------------------------
   # Inputs and Expected Outputs
   #----------------------------------------------------------------------------
   if (li == 5)     # Link = 5, Input = 3
      xform  = [-0.668187 0.0 -0.743993 0.0 0.0 0.0;
                -0.743993 0.0 0.668187 0.0 0.0 0.0;
                0.0 1.0 0.0 0.0 0.0 0.0;
                -0.137267 6.68187e-13 0.123281 -0.668187 0.0 -0.743993;
                0.123281 7.43993e-13 0.137267 -0.743993 0.0 0.668187;
                1.0e-12 0.0 0.0 0.0 1.0 0.0]
      xformt = [-0.668187 -0.743993 0.0 -0.137267 0.123281 1.0e-12;
                0.0 0.0 1.0 6.68187e-13 7.43993e-13 0.0;
                -0.743993 0.668187 0.0 0.123281 0.137267 0.0;
                0.0 0.0 0.0 -0.668187 -0.743993 0.0;
                0.0 0.0 0.0 0.0 0.0 1.0;
                0.0 0.0 0.0 -0.743993 0.668187 0.0]
      vec = [0.24306, -0.944909, 0.0461716, -5.28745, -1.38731, 0.610647]
      xtvec = [1.09536; 0.0461716; -1.65448; 4.56516; 0.610647; 3.00684]
   elseif (li == 4) # Link = 4, Input = 3
      xform  = [0.999945 0.0 -0.0104451 0.0 0.0 0.0;
                0.0104451 0.0 0.999945 0.0 0.0 0.0;
                0.0 -1.0 0.0 0.0 0.0 0.0;
                0.0 0.215488 0.0 0.999945 0.0 -0.0104451;
                0.0 0.00225091 0.0 0.0104451 0.0 0.999945;
                0.2155 0.0 0.0 0.0 -1.0 0.0]
      xformt = [0.999945 0.0104451 0.0 0.0 0.0 0.2155;
                0.0 0.0 -1.0 0.215488 0.00225091 0.0;
                -0.0104451 0.999945 0.0 0.0 0.0 0.0;
                0.0 0.0 0.0 0.999945 0.0104451 0.0;
                0.0 0.0 0.0 0.0 0.0 -1.0;
                0.0 0.0 0.0 -0.0104451 0.999945 0.0]
      vec = [1.2319, 0.117577, -1.83998, 6.653, 0.466838, 4.36681]
      xtvec = [2.17411; 3.27468; 0.104704; 6.65752; -4.36681; 0.397321]
   elseif (li == 3) # Link = 3, Input = 3
      xform  = [-0.826669 0.0 -0.562689 0.0 0.0 0.0;
                -0.562689 0.0 0.826669 0.0 0.0 0.0;
                0.0 1.0 0.0 0.0 0.0 0.0;
                -0.11507 8.26669e-13 0.169054 -0.826669 0.0 -0.562689;
                0.169054 5.62689e-13 0.11507 -0.562689 0.0 0.826669;
                1.0e-12 0.0 0.0 0.0 1.0 0.0]
      xformt = [-0.826669 -0.562689 0.0 -0.11507 0.169054 1.0e-12;
                0.0 0.0 1.0 8.26669e-13 5.62689e-13 0.0;
                -0.562689 0.826669 0.0 0.169054 0.11507 0.0;
                0.0 0.0 0.0 -0.826669 -0.562689 0.0;
                0.0 0.0 0.0 0.0 0.0 1.0;
                0.0 0.0 0.0 -0.562689 0.826669 0.0]
      vec = [2.41213, 3.59525, 0.0589455, 8.21655, -5.40469, 0.645469]
      xtvec = [-5.8762; 0.0589455; 2.38193; -3.75121; 0.645469; -9.09125]
   else             # Link = 3, Input = 3
      xform  = [-0.826669 0.0 -0.562689 0.0 0.0 0.0;
                -0.562689 0.0 0.826669 0.0 0.0 0.0;
                0.0 1.0 0.0 0.0 0.0 0.0;
                -0.11507 8.26669e-13 0.169054 -0.826669 0.0 -0.562689;
                0.169054 5.62689e-13 0.11507 -0.562689 0.0 0.826669;
                1.0e-12 0.0 0.0 0.0 1.0 0.0]
      xformt = [-0.826669 -0.562689 0.0 -0.11507 0.169054 1.0e-12;
                0.0 0.0 1.0 8.26669e-13 5.62689e-13 0.0;
                -0.562689 0.826669 0.0 0.169054 0.11507 0.0;
                0.0 0.0 0.0 -0.826669 -0.562689 0.0;
                0.0 0.0 0.0 0.0 0.0 1.0;
                0.0 0.0 0.0 -0.562689 0.826669 0.0]
      vec = [2.41213, 3.59525, 0.0589455, 8.21655, -5.40469, 0.645469]
      xtvec = [-5.8762; 0.0589455; 2.38193; -3.75121; 0.645469; -9.09125]
   end

   #----------------------------------------------------------------------------
   # Convert Values to Fixed-Point Binary
   #----------------------------------------------------------------------------
   for i in 1:length(vec)
      vec[i] = round(vec[i]*(2^DECIMAL_BITS))
   end
   for i in 1:length(xtvec)
      xtvec[i] = round(xtvec[i]*(2^DECIMAL_BITS))
   end
   for i in 1:size(xform)[1] # rows
      for j in 1:size(xform)[2] # cols
         xform[i,j] = round(xform[i,j]*(2^DECIMAL_BITS))
      end
   end

   #----------------------------------------------------------------------------
   # Print Fixed-Point Binary Values for Vivado Simulation
   #----------------------------------------------------------------------------
   println("// Link = ",li,", Input = ",col)
   println("vec_in_AX = 32'd",vec[1],
         "; vec_in_AY = 32'd",vec[2],
         "; vec_in_AZ = 32'd",vec[3],
         "; vec_in_LX = 32'd",vec[4],
         "; vec_in_LY = 32'd",vec[5],
         "; vec_in_LZ = 32'd",vec[6],";")
   println("\$display (\"vec_in = %d,%d,%d,%d,%d,%d\", vec_in_AX,vec_in_AY,vec_in_AZ,vec_in_LX,vec_in_LY,vec_in_LZ);")
   println("xform_in_AX_AX = 32'd",xform[1,1],"; xform_in_AX_AY = 32'd",xform[1,2],"; xform_in_AX_AZ = 32'd",xform[1,3],";")
   println("xform_in_AY_AX = 32'd",xform[2,1],"; xform_in_AY_AY = 32'd",xform[2,2],"; xform_in_AY_AZ = 32'd",xform[2,3],";")
   println("                                     xform_in_AZ_AY = 32'd",xform[3,2],"; xform_in_AZ_AZ = 32'd",xform[3,3],";")
   println("xform_in_LX_AX = 32'd",xform[4,1],"; xform_in_LX_AY = 32'd",xform[4,2],"; xform_in_LX_AZ = 32'd",xform[4,3],";  xform_in_LX_LX = 32'd",xform[4,4],"; xform_in_LX_LY = 32'd",xform[4,5],"; xform_in_LX_LZ = 32'd",xform[4,6],";")
   println("xform_in_LY_AX = 32'd",xform[5,1],"; xform_in_LY_AY = 32'd",xform[5,2],"; xform_in_LY_AZ = 32'd",xform[5,3],";  xform_in_LY_LX = 32'd",xform[5,4],"; xform_in_LY_LY = 32'd",xform[5,5],"; xform_in_LY_LZ = 32'd",xform[5,6],";")
   println("xform_in_LZ_AX = 32'd",xform[6,1],";                                                                                                                 xform_in_LZ_LY = 32'd",xform[6,5],"; xform_in_LZ_LZ = 32'd",xform[6,6],";")
   println("#100;")
   println("\$display (\"xtvec     = ",xtvec[1],", ",xtvec[2],", ",xtvec[3],", ",xtvec[4],", ",xtvec[5],", ",xtvec[6],"\");")
   println("\$display (\"xtvec_out = %d,%d,%d,%d,%d,%d\", xtvec_out_AX,xtvec_out_AY,xtvec_out_AZ,xtvec_out_LX,xtvec_out_LY,xtvec_out_LZ);")
   println("// -----------------------------------------------------------------------")

end

#-------------------------------------------------------------------------------
# Set Test Parameters and Run Test
#-------------------------------------------------------------------------------
println("// -----------------------------------------------------------------------")
li = 5; col = 3;
xtDotTest(CUSTOM_TYPE,li,col,WIDTH,DECIMAL_BITS)
li = 4; col = 3;
xtDotTest(CUSTOM_TYPE,li,col,WIDTH,DECIMAL_BITS)
li = 3; col = 3;
xtDotTest(CUSTOM_TYPE,li,col,WIDTH,DECIMAL_BITS)