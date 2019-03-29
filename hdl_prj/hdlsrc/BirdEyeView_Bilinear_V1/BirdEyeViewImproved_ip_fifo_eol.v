// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\BirdEyeView_Bilinear_V1\BirdEyeViewImproved_ip_fifo_eol.v
// Created: 2019-03-29 20:31:43
// 
// Generated by MATLAB 9.6 and HDL Coder 3.14
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: BirdEyeViewImproved_ip_fifo_eol
// Source Path: BirdEyeViewImproved_ip/BirdEyeViewImproved_ip_axi4_stream_video_slave/BirdEyeViewImproved_ip_fifo_eol
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module BirdEyeViewImproved_ip_fifo_eol
          (clk,
           reset,
           enb,
           In,
           Push,
           Pop,
           Out);


  input   clk;
  input   reset;
  input   enb;
  input   In;  // ufix1
  input   Push;  // ufix1
  input   Pop;  // ufix1
  output  Out;  // ufix1


  wire R_x;  // ufix1
  wire cache_wr_en;  // ufix1
  wire out_wr_en;  // ufix1
  wire fwft_wr_en;  // ufix1
  wire R_x_1;  // ufix1
  reg  fifo_valid;  // ufix1
  wire Q_keep;  // ufix1
  reg  out_valid;  // ufix1
  wire fifo_and_out_valid;  // ufix1
  wire R_x_2;  // ufix1
  reg  cache_valid;  // ufix1
  wire Q_keep_1;  // ufix1
  wire relop_relop1;
  wire Q_next;  // ufix1
  wire all_valid;  // ufix1
  wire fifo_full;  // ufix1
  wire fifo_nfull;  // ufix1
  wire fifo_push;  // ufix1
  wire fifo_pop;  // ufix1
  wire fifo_data_out;  // ufix1
  wire fifo_empty;  // ufix1
  wire [2:0] fifo_num;  // ufix3
  wire Q_next_1;  // ufix1
  wire int_valid;  // ufix1
  wire Q_keep_2;  // ufix1
  wire Q_next_2;  // ufix1
  wire fwft_empty;  // ufix1
  wire data_flow;  // ufix1
  reg  cache_data;  // ufix1
  wire data_out_next;  // ufix1
  reg  Out_1;  // ufix1


  assign R_x =  ~ Pop;



  assign fwft_wr_en = cache_wr_en | out_wr_en;



  assign R_x_1 =  ~ fwft_wr_en;



  assign Q_keep = R_x_1 & fifo_valid;



  assign fifo_and_out_valid = fifo_valid & out_valid;



  assign R_x_2 =  ~ out_wr_en;



  assign Q_keep_1 = R_x_2 & cache_valid;



  assign relop_relop1 = cache_valid == out_wr_en;



  assign cache_wr_en = relop_relop1 & fifo_valid;



  assign Q_next = cache_wr_en | Q_keep_1;



  always @(posedge clk or posedge reset)
    begin : Q_reg_process
      if (reset == 1'b1) begin
        cache_valid <= 1'b0;
      end
      else begin
        if (enb) begin
          cache_valid <= Q_next;
        end
      end
    end



  assign all_valid = cache_valid & fifo_and_out_valid;



  assign fifo_nfull =  ~ fifo_full;



  assign fifo_push = Push & fifo_nfull;



  BirdEyeViewImproved_ip_fifo_eol_classic u_BirdEyeViewImproved_ip_fifo_eol_classic_inst (.clk(clk),
                                                                                          .reset(reset),
                                                                                          .enb(enb),
                                                                                          .In(In),  // ufix1
                                                                                          .Push(fifo_push),  // ufix1
                                                                                          .Pop(fifo_pop),  // ufix1
                                                                                          .Out(fifo_data_out),  // ufix1
                                                                                          .Empty(fifo_empty),  // ufix1
                                                                                          .Full(fifo_full),  // ufix1
                                                                                          .Num(fifo_num)  // ufix3
                                                                                          );

  assign fifo_pop =  ~ (fifo_empty | all_valid);



  assign Q_next_1 = fifo_pop | Q_keep;



  always @(posedge clk or posedge reset)
    begin : Q_reg_1_process
      if (reset == 1'b1) begin
        fifo_valid <= 1'b0;
      end
      else begin
        if (enb) begin
          fifo_valid <= Q_next_1;
        end
      end
    end



  assign int_valid = fifo_valid | cache_valid;



  assign Q_keep_2 = R_x & out_valid;



  assign Q_next_2 = out_wr_en | Q_keep_2;



  always @(posedge clk or posedge reset)
    begin : Q_reg_2_process
      if (reset == 1'b1) begin
        out_valid <= 1'b0;
      end
      else begin
        if (enb) begin
          out_valid <= Q_next_2;
        end
      end
    end



  assign fwft_empty =  ~ out_valid;



  assign data_flow = Pop | fwft_empty;



  assign out_wr_en = data_flow & int_valid;



  always @(posedge clk or posedge reset)
    begin : cache_data_reg_process
      if (reset == 1'b1) begin
        cache_data <= 1'b0;
      end
      else begin
        if (enb && cache_wr_en) begin
          cache_data <= fifo_data_out;
        end
      end
    end



  assign data_out_next = (cache_valid == 1'b0 ? fifo_data_out :
              cache_data);



  always @(posedge clk or posedge reset)
    begin : out_data_reg_process
      if (reset == 1'b1) begin
        Out_1 <= 1'b0;
      end
      else begin
        if (enb && out_wr_en) begin
          Out_1 <= data_out_next;
        end
      end
    end



  assign Out = Out_1;

endmodule  // BirdEyeViewImproved_ip_fifo_eol

