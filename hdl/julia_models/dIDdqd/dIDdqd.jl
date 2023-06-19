# dIDdqd
#
# Based on RobCoGen's Inverse Dynamics for iiwa and Carpentier et al., RSS 2018

#-------------------------------------------------------------------------------
# Import Libraries
#-------------------------------------------------------------------------------
using LinearAlgebra

#-------------------------------------------------------------------------------
# Transformation Matrix * Vector (if mcross, then Motion Cross Matrix Column AZ)
#-------------------------------------------------------------------------------
# (23 mult, 17 add)
#    AX AY AZ LX LY LZ
# AX  *  *  *
# AY  *  *  *
# AZ     *  *
# LX  *  *  *  *  *  *
# LY  *  *  *  *  *  *
# LZ  *           *  *
function xDot(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
              xform,vec,mcross)

   xvec = zeros(CUSTOM_TYPE,6,1)

   xvec[AX]  = xform[AX,AX]*vec[AX]
   xvec[AX] += xform[AX,AY]*vec[AY]
   xvec[AX] += xform[AX,AZ]*vec[AZ]

   xvec[AY]  = xform[AY,AX]*vec[AX]
   xvec[AY] += xform[AY,AY]*vec[AY]
   xvec[AY] += xform[AY,AZ]*vec[AZ]

   xvec[AZ]  = xform[AZ,AY]*vec[AY]
   xvec[AZ] += xform[AZ,AZ]*vec[AZ]

   xvec[LX]  = xform[LX,AX]*vec[AX]
   xvec[LX] += xform[LX,AY]*vec[AY]
   xvec[LX] += xform[LX,AZ]*vec[AZ]
   xvec[LX] += xform[LX,LX]*vec[LX]
   xvec[LX] += xform[LX,LY]*vec[LY]
   xvec[LX] += xform[LX,LZ]*vec[LZ]

   xvec[LY]  = xform[LY,AX]*vec[AX]
   xvec[LY] += xform[LY,AY]*vec[AY]
   xvec[LY] += xform[LY,AZ]*vec[AZ]
   xvec[LY] += xform[LY,LX]*vec[LX]
   xvec[LY] += xform[LY,LY]*vec[LY]
   xvec[LY] += xform[LY,LZ]*vec[LZ]

   xvec[LZ]  = xform[LZ,AX]*vec[AX]
   xvec[LZ] += xform[LZ,LY]*vec[LY]
   xvec[LZ] += xform[LZ,LZ]*vec[LZ]

   if mcross
      v = zeros(CUSTOM_TYPE,6,1)
      v[AX] =  xvec[AY]
      v[AY] = -xvec[AX]
      v[AZ] = 0.0
      v[LX] =  xvec[LY]
      v[LY] = -xvec[LX]
      v[LZ] = 0.0
      xvec = v
   end

   return xvec
end

#-------------------------------------------------------------------------------
# * vj term from dai/dqd
#-------------------------------------------------------------------------------
# (4 mult)
function vjDot(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
               lcurr_qd,lcurr_dvi_dqd_col)

   vjvec = zeros(CUSTOM_TYPE,6,1)

   vjvec[AX] =  lcurr_qd*lcurr_dvi_dqd_col[AY]
   vjvec[AY] = -lcurr_qd*lcurr_dvi_dqd_col[AX]
   vjvec[LX] =  lcurr_qd*lcurr_dvi_dqd_col[LY]
   vjvec[LY] = -lcurr_qd*lcurr_dvi_dqd_col[LX]

   return vjvec
end

#-------------------------------------------------------------------------------
# Inertia Matrix * Vector
#-------------------------------------------------------------------------------
# (24 mult, 18 add)
#    AX AY AZ LX LY LZ
# AX  *  *  *     *  *
# AY  *  *  *  *     *
# AZ  *  *  *  *  *
# LX     *  *  *
# LY  *     *     *
# LZ  *  *           *
function iDot(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
              imat,vec)

   ivec = zeros(CUSTOM_TYPE,6,1)

   ivec[AX]  = imat[AX,AX]*vec[AX]
   ivec[AX] += imat[AX,AY]*vec[AY]
   ivec[AX] += imat[AX,AZ]*vec[AZ]
   ivec[AX] += imat[AX,LY]*vec[LY]
   ivec[AX] += imat[AX,LZ]*vec[LZ]

   ivec[AY]  = imat[AY,AX]*vec[AX]
   ivec[AY] += imat[AY,AY]*vec[AY]
   ivec[AY] += imat[AY,AZ]*vec[AZ]
   ivec[AY] += imat[AY,LX]*vec[LX]
   ivec[AY] += imat[AY,LZ]*vec[LZ]

   ivec[AZ]  = imat[AZ,AX]*vec[AX]
   ivec[AZ] += imat[AZ,AY]*vec[AY]
   ivec[AZ] += imat[AZ,AZ]*vec[AZ]
   ivec[AZ] += imat[AZ,LX]*vec[LX]
   ivec[AZ] += imat[AZ,LY]*vec[LY]

   ivec[LX]  = imat[LX,AY]*vec[AY]
   ivec[LX] += imat[LX,AZ]*vec[AZ]
   ivec[LX] += imat[LX,LX]*vec[LX]

   ivec[LY]  = imat[LY,AX]*vec[AX]
   ivec[LY] += imat[LY,AZ]*vec[AZ]
   ivec[LY] += imat[LY,LY]*vec[LY]

   ivec[LZ]  = imat[LZ,AX]*vec[AX]
   ivec[LZ] += imat[LZ,AY]*vec[AY]
   ivec[LZ] += imat[LZ,LZ]*vec[LZ]

   return ivec
end

#-------------------------------------------------------------------------------
# Force Cross Matrix * Vector
#-------------------------------------------------------------------------------
# (18 mult, 12 add)
function fxDot(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
               fxvec,dotvec)

   fxdotvec = zeros(CUSTOM_TYPE,6,1)

   fxdotvec[AX]  = -fxvec[AZ]*dotvec[AY]
   fxdotvec[AX] +=  fxvec[AY]*dotvec[AZ]
   fxdotvec[AX] += -fxvec[LZ]*dotvec[LY]
   fxdotvec[AX] +=  fxvec[LY]*dotvec[LZ]

   fxdotvec[AY]  =  fxvec[AZ]*dotvec[AX]
   fxdotvec[AY] += -fxvec[AX]*dotvec[AZ]
   fxdotvec[AY] +=  fxvec[LZ]*dotvec[LX]
   fxdotvec[AY] += -fxvec[LX]*dotvec[LZ]

   fxdotvec[AZ]  = -fxvec[AY]*dotvec[AX]
   fxdotvec[AZ] +=  fxvec[AX]*dotvec[AY]
   fxdotvec[AZ] += -fxvec[LY]*dotvec[LX]
   fxdotvec[AZ] +=  fxvec[LX]*dotvec[LY]

   fxdotvec[LX]  = -fxvec[AZ]*dotvec[LY]
   fxdotvec[LX] +=  fxvec[AY]*dotvec[LZ]

   fxdotvec[LY]  =  fxvec[AZ]*dotvec[LX]
   fxdotvec[LY] += -fxvec[AX]*dotvec[LZ]

   fxdotvec[LZ]  = -fxvec[AY]*dotvec[LX]
   fxdotvec[LZ] +=  fxvec[AX]*dotvec[LY]

   return fxdotvec
end

#-------------------------------------------------------------------------------
# Transformation Matrix^T * Vector (if fcross, then Force Cross Matrix Column AZ)
#-------------------------------------------------------------------------------
# (23 mult, 17 add)
#    AX AY AZ LX LY LZ
# AX  *  *     *  *  *
# AY  *  *  *  *  *
# AZ  *  *  *  *  *
# LX           *  *
# LY           *  *  *
# LZ           *  *  *
function xTDot(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
               xformT,vec)

   xTvec = zeros(CUSTOM_TYPE,6,1)

   xTvec[AX]  = xformT[AX,AX]*vec[AX]
   xTvec[AX] += xformT[AX,AY]*vec[AY]
   xTvec[AX] += xformT[AX,LX]*vec[LX]
   xTvec[AX] += xformT[AX,LY]*vec[LY]
   xTvec[AX] += xformT[AX,LZ]*vec[LZ]

   xTvec[AY]  = xformT[AY,AX]*vec[AX]
   xTvec[AY] += xformT[AY,AY]*vec[AY]
   xTvec[AY] += xformT[AY,AZ]*vec[AZ]
   xTvec[AY] += xformT[AY,LX]*vec[LX]
   xTvec[AY] += xformT[AY,LY]*vec[LY]

   xTvec[AZ]  = xformT[AZ,AX]*vec[AX]
   xTvec[AZ] += xformT[AZ,AY]*vec[AY]
   xTvec[AZ] += xformT[AZ,AZ]*vec[AZ]
   xTvec[AZ] += xformT[AZ,LX]*vec[LX]
   xTvec[AZ] += xformT[AZ,LY]*vec[LY]

   xTvec[LX]  = xformT[LX,LX]*vec[LX]
   xTvec[LX] += xformT[LX,LY]*vec[LY]

   xTvec[LY]  = xformT[LY,LX]*vec[LX]
   xTvec[LY] += xformT[LY,LY]*vec[LY]
   xTvec[LY] += xformT[LY,LZ]*vec[LZ]

   xTvec[LZ]  = xformT[LZ,LX]*vec[LX]
   xTvec[LZ] += xformT[LZ,LY]*vec[LY]
   xTvec[LZ] += xformT[LZ,LZ]*vec[LZ]

   return xTvec
end

#-------------------------------------------------------------------------------
# dqd Forward Pass for Link i Column col (dvi[:,col], dai[:,col], dfi[:,col])
#-------------------------------------------------------------------------------
function dqdFwdPassLinkCol(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                          li,col,tcurrXprev,lcurr_I,
                          lcurr_qd,lcurr_v,lprev_v,lprev_a,
                          lprev_dvi_dqd,lprev_dai_dqd)

   qi_bool = (li == col)
   dvdqd_xdot_vec = lprev_dvi_dqd
   dadqd_xdot_vec = lprev_dai_dqd

   # (1) [dXji_du, dSi_du, dvji_du, dcji_du] = jcalc(jtype(i), qi, qdi)
   # (2) diXlami_du = dXj_du * Xt(i), but we won't explicitly compute this term
   # (3) dvi_du = (diXlami_du * vlami) + (iXlami * dvlami_du) + dvj_du
   lcurr_dvi_dqd_col  = zeros(CUSTOM_TYPE,6,1)
   lcurr_dvi_dqd_col  = xDot(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                            tcurrXprev,dvdqd_xdot_vec,false)
   if qi_bool
      lcurr_dvi_dqd_col[AZ] += 1.0;
   end

   # (5) dai_du = (diXlami_du * alami) + (iXlami * dalami_du) + (dSi_du * qdd) +
   #             (dcj_du) + (dvi_du x vj) + (vi x dvj_du)
   lcurr_dai_dqd_col  = zeros(CUSTOM_TYPE,6,1)
   lcurr_dai_dqd_col  = xDot(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                            tcurrXprev,dadqd_xdot_vec,false)
   lcurr_dai_dqd_col += vjDot(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                             lcurr_qd,lcurr_dvi_dqd_col)
   if qi_bool
      mxv = zeros(CUSTOM_TYPE,6,1)
      mxv[AX] =  lcurr_v[AY]
      mxv[AY] = -lcurr_v[AX]
      mxv[AZ] = 0.0
      mxv[LX] =  lcurr_v[LY]
      mxv[LY] = -lcurr_v[LX]
      mxv[LZ] = 0.0
      lcurr_dai_dqd_col += mxv
   end

   # (4) dhi_du = Ii * dvi_du
   # (6) dfi_du = (Ii * dai_du) + (dvi_du x* hi) + (vi x* dhi_du)
   dfi_dqd_term1_col  = zeros(CUSTOM_TYPE,6,1)
   dfi_dqd_term1_col += iDot(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                            lcurr_I,lcurr_dai_dqd_col)
   dfi_dqd_term2_col  = zeros(CUSTOM_TYPE,6,1)
   lcurr_hi = iDot(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                   lcurr_I,lcurr_v) # hi is (Ii * vi)
   dfi_dqd_term2_col += fxDot(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                             lcurr_dvi_dqd_col,lcurr_hi)
   dfi_dqd_term3_col  = zeros(CUSTOM_TYPE,6,1)
   lcurr_dhi_dqd_col  = iDot(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                           lcurr_I,lcurr_dvi_dqd_col)
   dfi_dqd_term3_col += fxDot(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                             lcurr_v,lcurr_dhi_dqd_col)
   lcurr_dfi_dqd_col  = dfi_dqd_term1_col + dfi_dqd_term2_col + dfi_dqd_term3_col

   return lcurr_dvi_dqd_col, lcurr_dai_dqd_col, lcurr_dfi_dqd_col
end

#-------------------------------------------------------------------------------
# dqd Backward Pass for Link i Column col (dti[i], dfi[:,col])
#-------------------------------------------------------------------------------
function dqdBwdPassLinkCol(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                          li,col,tcurrXprev,lcurr_f,
                          lcurr_dfi_dqd_col)

   # (3) dflami_du = dflami_du + (dlamiXi*_du * fi) + (lamiXi* * dfi_du)
   lprev_dfi_dqd_col_update = xTDot(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                   transpose(tcurrXprev),lcurr_dfi_dqd_col)

   return lprev_dfi_dqd_col_update
end

#-------------------------------------------------------------------------------
# Forward Pass Per Link
#-------------------------------------------------------------------------------
function fwdPassPerLink(CUSTOM_TYPE, li, qd, tcurrXprev, lprev_v, lprev_a, lcurr_I, lcurr_v,
                        lprev_dvi_dqd, lprev_dai_dqd, S_rev,X,Y,Z,AX,AY,AZ,LX,LY,LZ)

   lcurr_dvi_dqd = zeros(CUSTOM_TYPE,6,7)
   lcurr_dai_dqd = zeros(CUSTOM_TYPE,6,7)
   lcurr_dfi_dqd = zeros(CUSTOM_TYPE,6,7)

   if (li > 1)
      for col in 2:li # for inputs 2:li
         lcurr_dvi_dqd[:,col],
         lcurr_dai_dqd[:,col],
         lcurr_dfi_dqd[:,col] = dqdFwdPassLinkCol(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                                li,col,tcurrXprev,lcurr_I,
                                                qd[li],lcurr_v,lprev_v,lprev_a,
                                                lprev_dvi_dqd[:,col],lprev_dai_dqd[:,col])
      end
   end

   return lcurr_dvi_dqd, lcurr_dai_dqd, lcurr_dfi_dqd
end

#-------------------------------------------------------------------------------
# Forward Pass Per Input
#-------------------------------------------------------------------------------
function fwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                         dqdj,qd,tXlist,Ilist,vlist,alist,flist)

   # output variable
   dfi_dqdj_list = zeros(CUSTOM_TYPE,6,7) # for all Links

   # local variables
   lcurr_dvi_dqdj = zeros(CUSTOM_TYPE,6,1)
   lcurr_dai_dqdj = zeros(CUSTOM_TYPE,6,1)
   lprev_dvi_dqdj = zeros(CUSTOM_TYPE,6,1)
   lprev_dai_dqdj = zeros(CUSTOM_TYPE,6,1)

   # forward pass
   for link in dqdj:7
      prev_link = (link-1)
      # update local variables
      if (link > 1)
         lprev_v = vlist[prev_link]
         lprev_a = alist[prev_link]
      else
         lprev_v = zeros(CUSTOM_TYPE,6,1)
         lprev_a = zeros(CUSTOM_TYPE,6,1)
      end
      tcurrXprev = tXlist[link]
      lcurr_I = Ilist[link]
      lcurr_v = vlist[link]
      lprev_dvi_dqdj = lcurr_dvi_dqdj
      lprev_dai_dqdj = lcurr_dai_dqdj
      # forward pass step
      lcurr_dvi_dqdj,
      lcurr_dai_dqdj,
      dfi_dqdj_list[:,link] = dqdFwdPassLinkCol(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                              link,dqdj,tcurrXprev,lcurr_I,
                                              qd[link],lcurr_v,lprev_v,lprev_a,
                                              lprev_dvi_dqdj,lprev_dai_dqdj)
   end

   return dfi_dqdj_list
end

#-------------------------------------------------------------------------------
# Backward Pass Per Link
#-------------------------------------------------------------------------------
function bwdPassPerLink(CUSTOM_TYPE, li, tcurrXprev, lcurr_f, lcurr_dfi_dqd,
                        lprev_dfi_dqd, S_rev,X,Y,Z,AX,AY,AZ,LX,LY,LZ)

   lcurr_dtaui_dqd = zeros(CUSTOM_TYPE,1,7)

   for col in 1:7 # for all inputs
      # (1) dtaui_du = (dSiT_du * fi) + (SiT * dfi_du)
      lcurr_dtaui_dqd[1,col] = lcurr_dfi_dqd[:,col][AZ]
   end

   if (li > 1)
      for col in 2:7 # for inputs 2:7
         lprev_dfi_dqd[:,col] += dqdBwdPassLinkCol(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                                 li,col,tcurrXprev,lcurr_f,
                                                 lcurr_dfi_dqd[:,col])
      end
   end

   return lcurr_dtaui_dqd, lprev_dfi_dqd
end

#-------------------------------------------------------------------------------
# Backward Pass Per Input
#-------------------------------------------------------------------------------
function bwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                         dqdj,tXlist,flist,dfi_dqdj_list)

   # output variable
   dtaui_dqdj_list = zeros(CUSTOM_TYPE,7,1) # for all Links

   # local variables
   dfi_dqdj_update = zeros(CUSTOM_TYPE,6,1)
   dfi_dqdj_temp = zeros(CUSTOM_TYPE,6,7)  # for all Links

   # initialize local variables
   dfi_dqdj_temp = dfi_dqdj_list

   # backward pass
   for link in 7:-1:1
      prev_link = (link-1)
      # update local variables
      tcurrXprev = tXlist[link]
      lcurr_f = flist[link]
      # get output
      dtaui_dqdj_list[link,1] = dfi_dqdj_temp[:,link][AZ] # for all Links
      # backward pass step
      dfi_dqdj_update = dqdBwdPassLinkCol(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                        link,dqdj,tcurrXprev,lcurr_f,
                                        dfi_dqdj_temp[:,link])
      # update
      if (link > 1)
         dfi_dqdj_temp[:,prev_link] += dfi_dqdj_update
      end
   end

   return dtaui_dqdj_list
end

#-------------------------------------------------------------------------------
# dID/dqd
#-------------------------------------------------------------------------------
function dIDdqd(CUSTOM_TYPE,
               qd,
               l1_v,l2_v,l3_v,l4_v,l5_v,l6_v,l7_v,
               l1_a,l2_a,l3_a,l4_a,l5_a,l6_a,l7_a,
               l1_f,l2_f,l3_f,l4_f,l5_f,l6_f,l7_f,
               t1X0,t2X1,t3X2,t4X3,t5X4,t6X5,t7X6,
               l1_I,l2_I,l3_I,l4_I,l5_I,l6_I,l7_I)

   #----------------------------------------------------------------------------
   # Parameters
   #----------------------------------------------------------------------------
   # Parameters to index either 6D or 3D coordinate vectors.
   X,Y,Z = 1,2,3 # Julia is 1-indexed
   # To be used with 6D vectors. 'A' stands for angular, 'L' for linear.
   AX,AY,AZ,LX,LY,LZ = 1,2,3,4,5,6 # Julia is 1-indexed

   #----------------------------------------------------------------------------
   # Constants
   #----------------------------------------------------------------------------
   # Joint Motion Subspace Matrix for Revolute Joint (= [0 0 1 0 0 0]T), 1x[6x1]
   S_rev = zeros(CUSTOM_TYPE,6,1)
   S_rev[AZ] = 1.0

   #----------------------------------------------------------------------------
   # Lists
   #----------------------------------------------------------------------------
   tXlist = [t1X0,t2X1,t3X2,t4X3,t5X4,t6X5,t7X6]
   Ilist = [l1_I,l2_I,l3_I,l4_I,l5_I,l6_I,l7_I]
   vlist = [l1_v,l2_v,l3_v,l4_v,l5_v,l6_v,l7_v]
   alist = [l1_a,l2_a,l3_a,l4_a,l5_a,l6_a,l7_a]
   flist = [l1_f,l2_f,l3_f,l4_f,l5_f,l6_f,l7_f]

   #----------------------------------------------------------------------------
   # Initialize Output
   #----------------------------------------------------------------------------
   dIDdqd = zeros(CUSTOM_TYPE,7,7)

	#===========================================================================#
	# FORWARD PASS
	#===========================================================================#

	#----------------------------------------------------------------------------
	# Input 1
	#----------------------------------------------------------------------------
   dfi_dqd1_list = zeros(CUSTOM_TYPE,6,7) # for all Links
	dfi_dqd1_list = fwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                  1,qd,tXlist,Ilist,vlist,alist,flist)

   #----------------------------------------------------------------------------
   # Input 2
   #----------------------------------------------------------------------------
   dfi_dqd2_list = zeros(CUSTOM_TYPE,6,7) # for all Links
   dfi_dqd2_list = fwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                  2,qd,tXlist,Ilist,vlist,alist,flist)

   #----------------------------------------------------------------------------
   # Input 3
   #----------------------------------------------------------------------------
   dfi_dqd3_list = zeros(CUSTOM_TYPE,6,7) # for all Links
   dfi_dqd3_list = fwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                  3,qd,tXlist,Ilist,vlist,alist,flist)

   #----------------------------------------------------------------------------
   # Input 4
   #----------------------------------------------------------------------------
   dfi_dqd4_list = zeros(CUSTOM_TYPE,6,7) # for all Links
   dfi_dqd4_list = fwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                  4,qd,tXlist,Ilist,vlist,alist,flist)

   #----------------------------------------------------------------------------
   # Input 5
   #----------------------------------------------------------------------------
   dfi_dqd5_list = zeros(CUSTOM_TYPE,6,7) # for all Links
   dfi_dqd5_list = fwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                  5,qd,tXlist,Ilist,vlist,alist,flist)

   #----------------------------------------------------------------------------
   # Input 6
   #----------------------------------------------------------------------------
   dfi_dqd6_list = zeros(CUSTOM_TYPE,6,7) # for all Links
   dfi_dqd6_list = fwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                  6,qd,tXlist,Ilist,vlist,alist,flist)

   #----------------------------------------------------------------------------
   # Input 7
   #----------------------------------------------------------------------------
   dfi_dqd7_list = zeros(CUSTOM_TYPE,6,7) # for all Links
   dfi_dqd7_list = fwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                  7,qd,tXlist,Ilist,vlist,alist,flist)

	#===========================================================================#
	# BACKWARD PASS
	#===========================================================================#

   #----------------------------------------------------------------------------
   # Input 7
   #----------------------------------------------------------------------------
   dtaui_dqd7_list = zeros(CUSTOM_TYPE,7,1) # for all Links
   dtaui_dqd7_list = bwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                    7,tXlist,flist,dfi_dqd7_list)

   #----------------------------------------------------------------------------
   # Input 6
   #----------------------------------------------------------------------------
   dtaui_dqd6_list = zeros(CUSTOM_TYPE,7,1) # for all Links
   dtaui_dqd6_list = bwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                    6,tXlist,flist,dfi_dqd6_list)

   #----------------------------------------------------------------------------
   # Input 5
   #----------------------------------------------------------------------------
   dtaui_dqd5_list = zeros(CUSTOM_TYPE,7,1) # for all Links
   dtaui_dqd5_list = bwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                    5,tXlist,flist,dfi_dqd5_list)

   #----------------------------------------------------------------------------
   # Input 4
   #----------------------------------------------------------------------------
   dtaui_dqd4_list = zeros(CUSTOM_TYPE,7,1) # for all Links
   dtaui_dqd4_list = bwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                    4,tXlist,flist,dfi_dqd4_list)

   #----------------------------------------------------------------------------
   # Input 3
   #----------------------------------------------------------------------------
   dtaui_dqd3_list = zeros(CUSTOM_TYPE,7,1) # for all Links
   dtaui_dqd3_list = bwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                    3,tXlist,flist,dfi_dqd3_list)

   #----------------------------------------------------------------------------
   # Input 2
   #----------------------------------------------------------------------------
   dtaui_dqd2_list = zeros(CUSTOM_TYPE,7,1) # for all Links
   dtaui_dqd2_list = bwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                    2,tXlist,flist,dfi_dqd2_list)

   #----------------------------------------------------------------------------
   # Input 1
   #----------------------------------------------------------------------------
   dtaui_dqd1_list = zeros(CUSTOM_TYPE,7,1) # for all Links
   dtaui_dqd1_list = bwdPassPerInput(CUSTOM_TYPE,X,Y,Z,AX,AY,AZ,LX,LY,LZ,
                                    1,tXlist,flist,dfi_dqd1_list)

	#----------------------------------------------------------------------------
	# Package and Return
	#----------------------------------------------------------------------------
   dIDdqd[:,1] = dtaui_dqd1_list
   dIDdqd[:,2] = dtaui_dqd2_list
   dIDdqd[:,3] = dtaui_dqd3_list
   dIDdqd[:,4] = dtaui_dqd4_list
   dIDdqd[:,5] = dtaui_dqd5_list
   dIDdqd[:,6] = dtaui_dqd6_list
   dIDdqd[:,7] = dtaui_dqd7_list

	return dIDdqd
end
