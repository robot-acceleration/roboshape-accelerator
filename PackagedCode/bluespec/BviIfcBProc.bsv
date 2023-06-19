import Clocks::*;
(* always_ready, always_enabled *)
interface BProc;
    (* always_ready *)
    method Action get_data();

    method Action sinq_prev_in(Bit#(32) v);
    method Action cosq_prev_in(Bit#(32) v);

    method Action f_prev_vec_in_AX(Bit#(32) v);
    method Action f_prev_vec_in_AY(Bit#(32) v);
    method Action f_prev_vec_in_AZ(Bit#(32) v);
    method Action f_prev_vec_in_LX(Bit#(32) v);
    method Action f_prev_vec_in_LY(Bit#(32) v);
    method Action f_prev_vec_in_LZ(Bit#(32) v);

    method Action dfidq_prev_mat_in_AX_J1(Bit#(32) v);
    method Action dfidq_prev_mat_in_AX_J2(Bit#(32) v);
    method Action dfidq_prev_mat_in_AX_J3(Bit#(32) v);
    method Action dfidq_prev_mat_in_AX_J4(Bit#(32) v);
    method Action dfidq_prev_mat_in_AX_J5(Bit#(32) v);
    method Action dfidq_prev_mat_in_AX_J6(Bit#(32) v);
    method Action dfidq_prev_mat_in_AX_J7(Bit#(32) v);
    method Action dfidq_prev_mat_in_AY_J1(Bit#(32) v);
    method Action dfidq_prev_mat_in_AY_J2(Bit#(32) v);
    method Action dfidq_prev_mat_in_AY_J3(Bit#(32) v);
    method Action dfidq_prev_mat_in_AY_J4(Bit#(32) v);
    method Action dfidq_prev_mat_in_AY_J5(Bit#(32) v);
    method Action dfidq_prev_mat_in_AY_J6(Bit#(32) v);
    method Action dfidq_prev_mat_in_AY_J7(Bit#(32) v);
    method Action dfidq_prev_mat_in_AZ_J1(Bit#(32) v);
    method Action dfidq_prev_mat_in_AZ_J2(Bit#(32) v);
    method Action dfidq_prev_mat_in_AZ_J3(Bit#(32) v);
    method Action dfidq_prev_mat_in_AZ_J4(Bit#(32) v);
    method Action dfidq_prev_mat_in_AZ_J5(Bit#(32) v);
    method Action dfidq_prev_mat_in_AZ_J6(Bit#(32) v);
    method Action dfidq_prev_mat_in_AZ_J7(Bit#(32) v);
    method Action dfidq_prev_mat_in_LX_J1(Bit#(32) v);
    method Action dfidq_prev_mat_in_LX_J2(Bit#(32) v);
    method Action dfidq_prev_mat_in_LX_J3(Bit#(32) v);
    method Action dfidq_prev_mat_in_LX_J4(Bit#(32) v);
    method Action dfidq_prev_mat_in_LX_J5(Bit#(32) v);
    method Action dfidq_prev_mat_in_LX_J6(Bit#(32) v);
    method Action dfidq_prev_mat_in_LX_J7(Bit#(32) v);
    method Action dfidq_prev_mat_in_LY_J1(Bit#(32) v);
    method Action dfidq_prev_mat_in_LY_J2(Bit#(32) v);
    method Action dfidq_prev_mat_in_LY_J3(Bit#(32) v);
    method Action dfidq_prev_mat_in_LY_J4(Bit#(32) v);
    method Action dfidq_prev_mat_in_LY_J5(Bit#(32) v);
    method Action dfidq_prev_mat_in_LY_J6(Bit#(32) v);
    method Action dfidq_prev_mat_in_LY_J7(Bit#(32) v);
    method Action dfidq_prev_mat_in_LZ_J1(Bit#(32) v);
    method Action dfidq_prev_mat_in_LZ_J2(Bit#(32) v);
    method Action dfidq_prev_mat_in_LZ_J3(Bit#(32) v);
    method Action dfidq_prev_mat_in_LZ_J4(Bit#(32) v);
    method Action dfidq_prev_mat_in_LZ_J5(Bit#(32) v);
    method Action dfidq_prev_mat_in_LZ_J6(Bit#(32) v);
    method Action dfidq_prev_mat_in_LZ_J7(Bit#(32) v);

    method Action dfidqd_prev_mat_in_AX_J1(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AX_J2(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AX_J3(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AX_J4(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AX_J5(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AX_J6(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AX_J7(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AY_J1(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AY_J2(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AY_J3(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AY_J4(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AY_J5(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AY_J6(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AY_J7(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AZ_J1(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AZ_J2(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AZ_J3(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AZ_J4(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AZ_J5(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AZ_J6(Bit#(32) v);
    method Action dfidqd_prev_mat_in_AZ_J7(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LX_J1(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LX_J2(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LX_J3(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LX_J4(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LX_J5(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LX_J6(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LX_J7(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LY_J1(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LY_J2(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LY_J3(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LY_J4(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LY_J5(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LY_J6(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LY_J7(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LZ_J1(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LZ_J2(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LZ_J3(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LZ_J4(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LZ_J5(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LZ_J6(Bit#(32) v);
    method Action dfidqd_prev_mat_in_LZ_J7(Bit#(32) v);

    method Bit#(1) output_ready();
    method Bit#(1) dummy_output();

    method Bit#(32) dtauidq_curr_vec_out_J1();
    method Bit#(32) dtauidq_curr_vec_out_J2();
    method Bit#(32) dtauidq_curr_vec_out_J3();
    method Bit#(32) dtauidq_curr_vec_out_J4();
    method Bit#(32) dtauidq_curr_vec_out_J5();
    method Bit#(32) dtauidq_curr_vec_out_J6();
    method Bit#(32) dtauidq_curr_vec_out_J7();
    method Bit#(32) dtauidqd_curr_vec_out_J1();
    method Bit#(32) dtauidqd_curr_vec_out_J2();
    method Bit#(32) dtauidqd_curr_vec_out_J3();
    method Bit#(32) dtauidqd_curr_vec_out_J4();
    method Bit#(32) dtauidqd_curr_vec_out_J5();
    method Bit#(32) dtauidqd_curr_vec_out_J6();
    method Bit#(32) dtauidqd_curr_vec_out_J7();
endinterface

import "BVI" bproc =
module mkBProc(BProc);
   default_clock clk();
    default_reset rst();
    input_clock (clk) <- exposeCurrentClock; 
    input_reset (reset) <- invertCurrentReset;
    method get_data() enable(get_data);

    method sinq_prev_in(sinq_prev_in) enable((*inhigh*) EN_sinq_prev_in);
    method cosq_prev_in(cosq_prev_in) enable((*inhigh*) EN_cosq_prev_in);
    method f_prev_vec_in_AX(f_prev_vec_in_AX) enable((*inhigh*) EN_f_prev_vec_in_AX);
    method f_prev_vec_in_AY(f_prev_vec_in_AY) enable((*inhigh*) EN_f_prev_vec_in_AY);
    method f_prev_vec_in_AZ(f_prev_vec_in_AZ) enable((*inhigh*) EN_f_prev_vec_in_AZ);
    method f_prev_vec_in_LX(f_prev_vec_in_LX) enable((*inhigh*) EN_f_prev_vec_in_LX);
    method f_prev_vec_in_LY(f_prev_vec_in_LY) enable((*inhigh*) EN_f_prev_vec_in_LY);
    method f_prev_vec_in_LZ(f_prev_vec_in_LZ) enable((*inhigh*) EN_f_prev_vec_in_LZ);
    method dfidq_prev_mat_in_AX_J1(dfidq_prev_mat_in_AX_J1) enable((*inhigh*) EN_dfidq_prev_mat_in_AX_J1);
    method dfidq_prev_mat_in_AX_J2(dfidq_prev_mat_in_AX_J2) enable((*inhigh*) EN_dfidq_prev_mat_in_AX_J2);
    method dfidq_prev_mat_in_AX_J3(dfidq_prev_mat_in_AX_J3) enable((*inhigh*) EN_dfidq_prev_mat_in_AX_J3);
    method dfidq_prev_mat_in_AX_J4(dfidq_prev_mat_in_AX_J4) enable((*inhigh*) EN_dfidq_prev_mat_in_AX_J4);
    method dfidq_prev_mat_in_AX_J5(dfidq_prev_mat_in_AX_J5) enable((*inhigh*) EN_dfidq_prev_mat_in_AX_J5);
    method dfidq_prev_mat_in_AX_J6(dfidq_prev_mat_in_AX_J6) enable((*inhigh*) EN_dfidq_prev_mat_in_AX_J6);
    method dfidq_prev_mat_in_AX_J7(dfidq_prev_mat_in_AX_J7) enable((*inhigh*) EN_dfidq_prev_mat_in_AX_J7);
    method dfidq_prev_mat_in_AY_J1(dfidq_prev_mat_in_AY_J1) enable((*inhigh*) EN_dfidq_prev_mat_in_AY_J1);
    method dfidq_prev_mat_in_AY_J2(dfidq_prev_mat_in_AY_J2) enable((*inhigh*) EN_dfidq_prev_mat_in_AY_J2);
    method dfidq_prev_mat_in_AY_J3(dfidq_prev_mat_in_AY_J3) enable((*inhigh*) EN_dfidq_prev_mat_in_AY_J3);
    method dfidq_prev_mat_in_AY_J4(dfidq_prev_mat_in_AY_J4) enable((*inhigh*) EN_dfidq_prev_mat_in_AY_J4);
    method dfidq_prev_mat_in_AY_J5(dfidq_prev_mat_in_AY_J5) enable((*inhigh*) EN_dfidq_prev_mat_in_AY_J5);
    method dfidq_prev_mat_in_AY_J6(dfidq_prev_mat_in_AY_J6) enable((*inhigh*) EN_dfidq_prev_mat_in_AY_J6);
    method dfidq_prev_mat_in_AY_J7(dfidq_prev_mat_in_AY_J7) enable((*inhigh*) EN_dfidq_prev_mat_in_AY_J7);
    method dfidq_prev_mat_in_AZ_J1(dfidq_prev_mat_in_AZ_J1) enable((*inhigh*) EN_dfidq_prev_mat_in_AZ_J1);
    method dfidq_prev_mat_in_AZ_J2(dfidq_prev_mat_in_AZ_J2) enable((*inhigh*) EN_dfidq_prev_mat_in_AZ_J2);
    method dfidq_prev_mat_in_AZ_J3(dfidq_prev_mat_in_AZ_J3) enable((*inhigh*) EN_dfidq_prev_mat_in_AZ_J3);
    method dfidq_prev_mat_in_AZ_J4(dfidq_prev_mat_in_AZ_J4) enable((*inhigh*) EN_dfidq_prev_mat_in_AZ_J4);
    method dfidq_prev_mat_in_AZ_J5(dfidq_prev_mat_in_AZ_J5) enable((*inhigh*) EN_dfidq_prev_mat_in_AZ_J5);
    method dfidq_prev_mat_in_AZ_J6(dfidq_prev_mat_in_AZ_J6) enable((*inhigh*) EN_dfidq_prev_mat_in_AZ_J6);
    method dfidq_prev_mat_in_AZ_J7(dfidq_prev_mat_in_AZ_J7) enable((*inhigh*) EN_dfidq_prev_mat_in_AZ_J7);
    method dfidq_prev_mat_in_LX_J1(dfidq_prev_mat_in_LX_J1) enable((*inhigh*) EN_dfidq_prev_mat_in_LX_J1);
    method dfidq_prev_mat_in_LX_J2(dfidq_prev_mat_in_LX_J2) enable((*inhigh*) EN_dfidq_prev_mat_in_LX_J2);
    method dfidq_prev_mat_in_LX_J3(dfidq_prev_mat_in_LX_J3) enable((*inhigh*) EN_dfidq_prev_mat_in_LX_J3);
    method dfidq_prev_mat_in_LX_J4(dfidq_prev_mat_in_LX_J4) enable((*inhigh*) EN_dfidq_prev_mat_in_LX_J4);
    method dfidq_prev_mat_in_LX_J5(dfidq_prev_mat_in_LX_J5) enable((*inhigh*) EN_dfidq_prev_mat_in_LX_J5);
    method dfidq_prev_mat_in_LX_J6(dfidq_prev_mat_in_LX_J6) enable((*inhigh*) EN_dfidq_prev_mat_in_LX_J6);
    method dfidq_prev_mat_in_LX_J7(dfidq_prev_mat_in_LX_J7) enable((*inhigh*) EN_dfidq_prev_mat_in_LX_J7);
    method dfidq_prev_mat_in_LY_J1(dfidq_prev_mat_in_LY_J1) enable((*inhigh*) EN_dfidq_prev_mat_in_LY_J1);
    method dfidq_prev_mat_in_LY_J2(dfidq_prev_mat_in_LY_J2) enable((*inhigh*) EN_dfidq_prev_mat_in_LY_J2);
    method dfidq_prev_mat_in_LY_J3(dfidq_prev_mat_in_LY_J3) enable((*inhigh*) EN_dfidq_prev_mat_in_LY_J3);
    method dfidq_prev_mat_in_LY_J4(dfidq_prev_mat_in_LY_J4) enable((*inhigh*) EN_dfidq_prev_mat_in_LY_J4);
    method dfidq_prev_mat_in_LY_J5(dfidq_prev_mat_in_LY_J5) enable((*inhigh*) EN_dfidq_prev_mat_in_LY_J5);
    method dfidq_prev_mat_in_LY_J6(dfidq_prev_mat_in_LY_J6) enable((*inhigh*) EN_dfidq_prev_mat_in_LY_J6);
    method dfidq_prev_mat_in_LY_J7(dfidq_prev_mat_in_LY_J7) enable((*inhigh*) EN_dfidq_prev_mat_in_LY_J7);
    method dfidq_prev_mat_in_LZ_J1(dfidq_prev_mat_in_LZ_J1) enable((*inhigh*) EN_dfidq_prev_mat_in_LZ_J1);
    method dfidq_prev_mat_in_LZ_J2(dfidq_prev_mat_in_LZ_J2) enable((*inhigh*) EN_dfidq_prev_mat_in_LZ_J2);
    method dfidq_prev_mat_in_LZ_J3(dfidq_prev_mat_in_LZ_J3) enable((*inhigh*) EN_dfidq_prev_mat_in_LZ_J3);
    method dfidq_prev_mat_in_LZ_J4(dfidq_prev_mat_in_LZ_J4) enable((*inhigh*) EN_dfidq_prev_mat_in_LZ_J4);
    method dfidq_prev_mat_in_LZ_J5(dfidq_prev_mat_in_LZ_J5) enable((*inhigh*) EN_dfidq_prev_mat_in_LZ_J5);
    method dfidq_prev_mat_in_LZ_J6(dfidq_prev_mat_in_LZ_J6) enable((*inhigh*) EN_dfidq_prev_mat_in_LZ_J6);
    method dfidq_prev_mat_in_LZ_J7(dfidq_prev_mat_in_LZ_J7) enable((*inhigh*) EN_dfidq_prev_mat_in_LZ_J7);
    method dfidqd_prev_mat_in_AX_J1(dfidqd_prev_mat_in_AX_J1) enable((*inhigh*) EN_dfidqd_prev_mat_in_AX_J1);
    method dfidqd_prev_mat_in_AX_J2(dfidqd_prev_mat_in_AX_J2) enable((*inhigh*) EN_dfidqd_prev_mat_in_AX_J2);
    method dfidqd_prev_mat_in_AX_J3(dfidqd_prev_mat_in_AX_J3) enable((*inhigh*) EN_dfidqd_prev_mat_in_AX_J3);
    method dfidqd_prev_mat_in_AX_J4(dfidqd_prev_mat_in_AX_J4) enable((*inhigh*) EN_dfidqd_prev_mat_in_AX_J4);
    method dfidqd_prev_mat_in_AX_J5(dfidqd_prev_mat_in_AX_J5) enable((*inhigh*) EN_dfidqd_prev_mat_in_AX_J5);
    method dfidqd_prev_mat_in_AX_J6(dfidqd_prev_mat_in_AX_J6) enable((*inhigh*) EN_dfidqd_prev_mat_in_AX_J6);
    method dfidqd_prev_mat_in_AX_J7(dfidqd_prev_mat_in_AX_J7) enable((*inhigh*) EN_dfidqd_prev_mat_in_AX_J7);
    method dfidqd_prev_mat_in_AY_J1(dfidqd_prev_mat_in_AY_J1) enable((*inhigh*) EN_dfidqd_prev_mat_in_AY_J1);
    method dfidqd_prev_mat_in_AY_J2(dfidqd_prev_mat_in_AY_J2) enable((*inhigh*) EN_dfidqd_prev_mat_in_AY_J2);
    method dfidqd_prev_mat_in_AY_J3(dfidqd_prev_mat_in_AY_J3) enable((*inhigh*) EN_dfidqd_prev_mat_in_AY_J3);
    method dfidqd_prev_mat_in_AY_J4(dfidqd_prev_mat_in_AY_J4) enable((*inhigh*) EN_dfidqd_prev_mat_in_AY_J4);
    method dfidqd_prev_mat_in_AY_J5(dfidqd_prev_mat_in_AY_J5) enable((*inhigh*) EN_dfidqd_prev_mat_in_AY_J5);
    method dfidqd_prev_mat_in_AY_J6(dfidqd_prev_mat_in_AY_J6) enable((*inhigh*) EN_dfidqd_prev_mat_in_AY_J6);
    method dfidqd_prev_mat_in_AY_J7(dfidqd_prev_mat_in_AY_J7) enable((*inhigh*) EN_dfidqd_prev_mat_in_AY_J7);
    method dfidqd_prev_mat_in_AZ_J1(dfidqd_prev_mat_in_AZ_J1) enable((*inhigh*) EN_dfidqd_prev_mat_in_AZ_J1);
    method dfidqd_prev_mat_in_AZ_J2(dfidqd_prev_mat_in_AZ_J2) enable((*inhigh*) EN_dfidqd_prev_mat_in_AZ_J2);
    method dfidqd_prev_mat_in_AZ_J3(dfidqd_prev_mat_in_AZ_J3) enable((*inhigh*) EN_dfidqd_prev_mat_in_AZ_J3);
    method dfidqd_prev_mat_in_AZ_J4(dfidqd_prev_mat_in_AZ_J4) enable((*inhigh*) EN_dfidqd_prev_mat_in_AZ_J4);
    method dfidqd_prev_mat_in_AZ_J5(dfidqd_prev_mat_in_AZ_J5) enable((*inhigh*) EN_dfidqd_prev_mat_in_AZ_J5);
    method dfidqd_prev_mat_in_AZ_J6(dfidqd_prev_mat_in_AZ_J6) enable((*inhigh*) EN_dfidqd_prev_mat_in_AZ_J6);
    method dfidqd_prev_mat_in_AZ_J7(dfidqd_prev_mat_in_AZ_J7) enable((*inhigh*) EN_dfidqd_prev_mat_in_AZ_J7);
    method dfidqd_prev_mat_in_LX_J1(dfidqd_prev_mat_in_LX_J1) enable((*inhigh*) EN_dfidqd_prev_mat_in_LX_J1);
    method dfidqd_prev_mat_in_LX_J2(dfidqd_prev_mat_in_LX_J2) enable((*inhigh*) EN_dfidqd_prev_mat_in_LX_J2);
    method dfidqd_prev_mat_in_LX_J3(dfidqd_prev_mat_in_LX_J3) enable((*inhigh*) EN_dfidqd_prev_mat_in_LX_J3);
    method dfidqd_prev_mat_in_LX_J4(dfidqd_prev_mat_in_LX_J4) enable((*inhigh*) EN_dfidqd_prev_mat_in_LX_J4);
    method dfidqd_prev_mat_in_LX_J5(dfidqd_prev_mat_in_LX_J5) enable((*inhigh*) EN_dfidqd_prev_mat_in_LX_J5);
    method dfidqd_prev_mat_in_LX_J6(dfidqd_prev_mat_in_LX_J6) enable((*inhigh*) EN_dfidqd_prev_mat_in_LX_J6);
    method dfidqd_prev_mat_in_LX_J7(dfidqd_prev_mat_in_LX_J7) enable((*inhigh*) EN_dfidqd_prev_mat_in_LX_J7);
    method dfidqd_prev_mat_in_LY_J1(dfidqd_prev_mat_in_LY_J1) enable((*inhigh*) EN_dfidqd_prev_mat_in_LY_J1);
    method dfidqd_prev_mat_in_LY_J2(dfidqd_prev_mat_in_LY_J2) enable((*inhigh*) EN_dfidqd_prev_mat_in_LY_J2);
    method dfidqd_prev_mat_in_LY_J3(dfidqd_prev_mat_in_LY_J3) enable((*inhigh*) EN_dfidqd_prev_mat_in_LY_J3);
    method dfidqd_prev_mat_in_LY_J4(dfidqd_prev_mat_in_LY_J4) enable((*inhigh*) EN_dfidqd_prev_mat_in_LY_J4);
    method dfidqd_prev_mat_in_LY_J5(dfidqd_prev_mat_in_LY_J5) enable((*inhigh*) EN_dfidqd_prev_mat_in_LY_J5);
    method dfidqd_prev_mat_in_LY_J6(dfidqd_prev_mat_in_LY_J6) enable((*inhigh*) EN_dfidqd_prev_mat_in_LY_J6);
    method dfidqd_prev_mat_in_LY_J7(dfidqd_prev_mat_in_LY_J7) enable((*inhigh*) EN_dfidqd_prev_mat_in_LY_J7);
    method dfidqd_prev_mat_in_LZ_J1(dfidqd_prev_mat_in_LZ_J1) enable((*inhigh*) EN_dfidqd_prev_mat_in_LZ_J1);
    method dfidqd_prev_mat_in_LZ_J2(dfidqd_prev_mat_in_LZ_J2) enable((*inhigh*) EN_dfidqd_prev_mat_in_LZ_J2);
    method dfidqd_prev_mat_in_LZ_J3(dfidqd_prev_mat_in_LZ_J3) enable((*inhigh*) EN_dfidqd_prev_mat_in_LZ_J3);
    method dfidqd_prev_mat_in_LZ_J4(dfidqd_prev_mat_in_LZ_J4) enable((*inhigh*) EN_dfidqd_prev_mat_in_LZ_J4);
    method dfidqd_prev_mat_in_LZ_J5(dfidqd_prev_mat_in_LZ_J5) enable((*inhigh*) EN_dfidqd_prev_mat_in_LZ_J5);
    method dfidqd_prev_mat_in_LZ_J6(dfidqd_prev_mat_in_LZ_J6) enable((*inhigh*) EN_dfidqd_prev_mat_in_LZ_J6);
    method dfidqd_prev_mat_in_LZ_J7(dfidqd_prev_mat_in_LZ_J7) enable((*inhigh*) EN_dfidqd_prev_mat_in_LZ_J7);

    method output_ready output_ready();
    method dummy_output dummy_output();
    method dtauidq_curr_vec_out_J1 dtauidq_curr_vec_out_J1();
    method dtauidq_curr_vec_out_J2 dtauidq_curr_vec_out_J2();
    method dtauidq_curr_vec_out_J3 dtauidq_curr_vec_out_J3();
    method dtauidq_curr_vec_out_J4 dtauidq_curr_vec_out_J4();
    method dtauidq_curr_vec_out_J5 dtauidq_curr_vec_out_J5();
    method dtauidq_curr_vec_out_J6 dtauidq_curr_vec_out_J6();
    method dtauidq_curr_vec_out_J7 dtauidq_curr_vec_out_J7();
    method dtauidqd_curr_vec_out_J1 dtauidqd_curr_vec_out_J1();
    method dtauidqd_curr_vec_out_J2 dtauidqd_curr_vec_out_J2();
    method dtauidqd_curr_vec_out_J3 dtauidqd_curr_vec_out_J3();
    method dtauidqd_curr_vec_out_J4 dtauidqd_curr_vec_out_J4();
    method dtauidqd_curr_vec_out_J5 dtauidqd_curr_vec_out_J5();
    method dtauidqd_curr_vec_out_J6 dtauidqd_curr_vec_out_J6();
    method dtauidqd_curr_vec_out_J7 dtauidqd_curr_vec_out_J7();

	schedule (get_data, sinq_prev_in, cosq_prev_in, f_prev_vec_in_AX, f_prev_vec_in_AY, f_prev_vec_in_AZ, f_prev_vec_in_LX, f_prev_vec_in_LY, f_prev_vec_in_LZ, dfidq_prev_mat_in_AX_J1, dfidq_prev_mat_in_AX_J2, dfidq_prev_mat_in_AX_J3, dfidq_prev_mat_in_AX_J4, dfidq_prev_mat_in_AX_J5, dfidq_prev_mat_in_AX_J6, dfidq_prev_mat_in_AX_J7, dfidq_prev_mat_in_AY_J1, dfidq_prev_mat_in_AY_J2, dfidq_prev_mat_in_AY_J3, dfidq_prev_mat_in_AY_J4, dfidq_prev_mat_in_AY_J5, dfidq_prev_mat_in_AY_J6, dfidq_prev_mat_in_AY_J7, dfidq_prev_mat_in_AZ_J1, dfidq_prev_mat_in_AZ_J2, dfidq_prev_mat_in_AZ_J3, dfidq_prev_mat_in_AZ_J4, dfidq_prev_mat_in_AZ_J5, dfidq_prev_mat_in_AZ_J6, dfidq_prev_mat_in_AZ_J7, dfidq_prev_mat_in_LX_J1, dfidq_prev_mat_in_LX_J2, dfidq_prev_mat_in_LX_J3, dfidq_prev_mat_in_LX_J4, dfidq_prev_mat_in_LX_J5, dfidq_prev_mat_in_LX_J6, dfidq_prev_mat_in_LX_J7, dfidq_prev_mat_in_LY_J1, dfidq_prev_mat_in_LY_J2, dfidq_prev_mat_in_LY_J3, dfidq_prev_mat_in_LY_J4, dfidq_prev_mat_in_LY_J5, dfidq_prev_mat_in_LY_J6, dfidq_prev_mat_in_LY_J7, dfidq_prev_mat_in_LZ_J1, dfidq_prev_mat_in_LZ_J2, dfidq_prev_mat_in_LZ_J3, dfidq_prev_mat_in_LZ_J4, dfidq_prev_mat_in_LZ_J5, dfidq_prev_mat_in_LZ_J6, dfidq_prev_mat_in_LZ_J7, dfidqd_prev_mat_in_AX_J1, dfidqd_prev_mat_in_AX_J2, dfidqd_prev_mat_in_AX_J3, dfidqd_prev_mat_in_AX_J4, dfidqd_prev_mat_in_AX_J5, dfidqd_prev_mat_in_AX_J6, dfidqd_prev_mat_in_AX_J7, dfidqd_prev_mat_in_AY_J1, dfidqd_prev_mat_in_AY_J2, dfidqd_prev_mat_in_AY_J3, dfidqd_prev_mat_in_AY_J4, dfidqd_prev_mat_in_AY_J5, dfidqd_prev_mat_in_AY_J6, dfidqd_prev_mat_in_AY_J7, dfidqd_prev_mat_in_AZ_J1, dfidqd_prev_mat_in_AZ_J2, dfidqd_prev_mat_in_AZ_J3, dfidqd_prev_mat_in_AZ_J4, dfidqd_prev_mat_in_AZ_J5, dfidqd_prev_mat_in_AZ_J6, dfidqd_prev_mat_in_AZ_J7, dfidqd_prev_mat_in_LX_J1, dfidqd_prev_mat_in_LX_J2, dfidqd_prev_mat_in_LX_J3, dfidqd_prev_mat_in_LX_J4, dfidqd_prev_mat_in_LX_J5, dfidqd_prev_mat_in_LX_J6, dfidqd_prev_mat_in_LX_J7, dfidqd_prev_mat_in_LY_J1, dfidqd_prev_mat_in_LY_J2, dfidqd_prev_mat_in_LY_J3, dfidqd_prev_mat_in_LY_J4, dfidqd_prev_mat_in_LY_J5, dfidqd_prev_mat_in_LY_J6, dfidqd_prev_mat_in_LY_J7, dfidqd_prev_mat_in_LZ_J1, dfidqd_prev_mat_in_LZ_J2, dfidqd_prev_mat_in_LZ_J3, dfidqd_prev_mat_in_LZ_J4, dfidqd_prev_mat_in_LZ_J5, dfidqd_prev_mat_in_LZ_J6, dfidqd_prev_mat_in_LZ_J7, output_ready, dummy_output, dtauidq_curr_vec_out_J1, dtauidq_curr_vec_out_J2, dtauidq_curr_vec_out_J3, dtauidq_curr_vec_out_J4, dtauidq_curr_vec_out_J5, dtauidq_curr_vec_out_J6, dtauidq_curr_vec_out_J7, dtauidqd_curr_vec_out_J1, dtauidqd_curr_vec_out_J2, dtauidqd_curr_vec_out_J3, dtauidqd_curr_vec_out_J4, dtauidqd_curr_vec_out_J5, dtauidqd_curr_vec_out_J6, dtauidqd_curr_vec_out_J7) CF (get_data, sinq_prev_in, cosq_prev_in, f_prev_vec_in_AX, f_prev_vec_in_AY, f_prev_vec_in_AZ, f_prev_vec_in_LX, f_prev_vec_in_LY, f_prev_vec_in_LZ, dfidq_prev_mat_in_AX_J1, dfidq_prev_mat_in_AX_J2, dfidq_prev_mat_in_AX_J3, dfidq_prev_mat_in_AX_J4, dfidq_prev_mat_in_AX_J5, dfidq_prev_mat_in_AX_J6, dfidq_prev_mat_in_AX_J7, dfidq_prev_mat_in_AY_J1, dfidq_prev_mat_in_AY_J2, dfidq_prev_mat_in_AY_J3, dfidq_prev_mat_in_AY_J4, dfidq_prev_mat_in_AY_J5, dfidq_prev_mat_in_AY_J6, dfidq_prev_mat_in_AY_J7, dfidq_prev_mat_in_AZ_J1, dfidq_prev_mat_in_AZ_J2, dfidq_prev_mat_in_AZ_J3, dfidq_prev_mat_in_AZ_J4, dfidq_prev_mat_in_AZ_J5, dfidq_prev_mat_in_AZ_J6, dfidq_prev_mat_in_AZ_J7, dfidq_prev_mat_in_LX_J1, dfidq_prev_mat_in_LX_J2, dfidq_prev_mat_in_LX_J3, dfidq_prev_mat_in_LX_J4, dfidq_prev_mat_in_LX_J5, dfidq_prev_mat_in_LX_J6, dfidq_prev_mat_in_LX_J7, dfidq_prev_mat_in_LY_J1, dfidq_prev_mat_in_LY_J2, dfidq_prev_mat_in_LY_J3, dfidq_prev_mat_in_LY_J4, dfidq_prev_mat_in_LY_J5, dfidq_prev_mat_in_LY_J6, dfidq_prev_mat_in_LY_J7, dfidq_prev_mat_in_LZ_J1, dfidq_prev_mat_in_LZ_J2, dfidq_prev_mat_in_LZ_J3, dfidq_prev_mat_in_LZ_J4, dfidq_prev_mat_in_LZ_J5, dfidq_prev_mat_in_LZ_J6, dfidq_prev_mat_in_LZ_J7, dfidqd_prev_mat_in_AX_J1, dfidqd_prev_mat_in_AX_J2, dfidqd_prev_mat_in_AX_J3, dfidqd_prev_mat_in_AX_J4, dfidqd_prev_mat_in_AX_J5, dfidqd_prev_mat_in_AX_J6, dfidqd_prev_mat_in_AX_J7, dfidqd_prev_mat_in_AY_J1, dfidqd_prev_mat_in_AY_J2, dfidqd_prev_mat_in_AY_J3, dfidqd_prev_mat_in_AY_J4, dfidqd_prev_mat_in_AY_J5, dfidqd_prev_mat_in_AY_J6, dfidqd_prev_mat_in_AY_J7, dfidqd_prev_mat_in_AZ_J1, dfidqd_prev_mat_in_AZ_J2, dfidqd_prev_mat_in_AZ_J3, dfidqd_prev_mat_in_AZ_J4, dfidqd_prev_mat_in_AZ_J5, dfidqd_prev_mat_in_AZ_J6, dfidqd_prev_mat_in_AZ_J7, dfidqd_prev_mat_in_LX_J1, dfidqd_prev_mat_in_LX_J2, dfidqd_prev_mat_in_LX_J3, dfidqd_prev_mat_in_LX_J4, dfidqd_prev_mat_in_LX_J5, dfidqd_prev_mat_in_LX_J6, dfidqd_prev_mat_in_LX_J7, dfidqd_prev_mat_in_LY_J1, dfidqd_prev_mat_in_LY_J2, dfidqd_prev_mat_in_LY_J3, dfidqd_prev_mat_in_LY_J4, dfidqd_prev_mat_in_LY_J5, dfidqd_prev_mat_in_LY_J6, dfidqd_prev_mat_in_LY_J7, dfidqd_prev_mat_in_LZ_J1, dfidqd_prev_mat_in_LZ_J2, dfidqd_prev_mat_in_LZ_J3, dfidqd_prev_mat_in_LZ_J4, dfidqd_prev_mat_in_LZ_J5, dfidqd_prev_mat_in_LZ_J6, dfidqd_prev_mat_in_LZ_J7, output_ready, dummy_output, dtauidq_curr_vec_out_J1, dtauidq_curr_vec_out_J2, dtauidq_curr_vec_out_J3, dtauidq_curr_vec_out_J4, dtauidq_curr_vec_out_J5, dtauidq_curr_vec_out_J6, dtauidq_curr_vec_out_J7, dtauidqd_curr_vec_out_J1, dtauidqd_curr_vec_out_J2, dtauidqd_curr_vec_out_J3, dtauidqd_curr_vec_out_J4, dtauidqd_curr_vec_out_J5, dtauidqd_curr_vec_out_J6, dtauidqd_curr_vec_out_J7);
endmodule
