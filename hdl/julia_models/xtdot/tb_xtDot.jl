# tb_xtDot
#
# Testbench for xtDot.jl

#-------------------------------------------------------------------------------
# Import Libraries
#-------------------------------------------------------------------------------
using LinearAlgebra
using FixedPointNumbers
using Test
include("../../../type_generic/dynamics/helpers_iiwa.jl")
include("xtDot.jl") # xtDot

#-------------------------------------------------------------------------------
# Data Type
#-------------------------------------------------------------------------------
CUSTOM_TYPE = Float64 ###Fixed{Int32,24} # data type

#-------------------------------------------------------------------------------
# Set Constants
#-------------------------------------------------------------------------------
X,Y,Z,AX,AY,AZ,LX,LY,LZ,g = initConstants(CUSTOM_TYPE)

#-------------------------------------------------------------------------------
# Define Test Function
#-------------------------------------------------------------------------------
function xtDotTest(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,li,col)
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
   # Unit Under Test
   #----------------------------------------------------------------------------
   xtvec_out = xtDot(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                     xform,vec)

   #----------------------------------------------------------------------------
   # Print Outputs
   #----------------------------------------------------------------------------
   println("Link = ",li,", Input = ",col)
   println("Expected: ",xtvec)
   println("Got:      ",xtvec_out)

   #----------------------------------------------------------------------------
   # Test Outputs
   #----------------------------------------------------------------------------
   @test xtvec_out ≈ xtvec atol=1e-4
   println("Test passed!")
end

#-------------------------------------------------------------------------------
# Set Test Parameters and Run Test
#-------------------------------------------------------------------------------
li = 5; col = 3;
xtDotTest(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,li,col)
li = 4; col = 3;
xtDotTest(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,li,col)
li = 3; col = 3;
xtDotTest(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,li,col)