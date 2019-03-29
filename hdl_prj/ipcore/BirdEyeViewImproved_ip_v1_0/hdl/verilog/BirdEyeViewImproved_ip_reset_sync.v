// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\BirdEyeView_Bilinear_V1\BirdEyeViewImproved_ip_reset_sync.v
// Created: 2019-03-29 20:31:42
// 
// Generated by MATLAB 9.6 and HDL Coder 3.14
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: BirdEyeViewImproved_ip_reset_sync
// Source Path: BirdEyeViewImproved_ip/BirdEyeViewImproved_ip_reset_sync
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module BirdEyeViewImproved_ip_reset_sync
          (clk,
           reset_in,
           reset_out);


  input   clk;
  input   reset_in;  // ufix1
  output  reset_out;  // ufix1


  wire enb;
  wire const_0;  // ufix1
  wire const_1;  // ufix1
  reg  reset_pipe;  // ufix1
  reg  reset_out_1;  // ufix1


  assign const_0 = 1'b0;



  assign const_1 = 1'b1;



  assign enb = const_1;

  always @(posedge clk or posedge reset_in)
    begin : reg_reset_pipe_process
      if (reset_in == 1'b1) begin
        reset_pipe <= 1'b1;
      end
      else begin
        if (enb) begin
          reset_pipe <= const_0;
        end
      end
    end



  always @(posedge clk or posedge reset_in)
    begin : reg_reset_delay_process
      if (reset_in == 1'b1) begin
        reset_out_1 <= 1'b1;
      end
      else begin
        if (enb) begin
          reset_out_1 <= reset_pipe;
        end
      end
    end



  assign reset_out = reset_out_1;

endmodule  // BirdEyeViewImproved_ip_reset_sync

