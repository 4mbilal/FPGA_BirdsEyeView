// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\BirdEyeView_Bilinear_V1\BirdEyeViewImproved_ip_addr_decoder.v
// Created: 2019-03-29 20:31:43
// 
// Generated by MATLAB 9.6 and HDL Coder 3.14
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: BirdEyeViewImproved_ip_addr_decoder
// Source Path: BirdEyeViewImproved_ip/BirdEyeViewImproved_ip_axi_lite/BirdEyeViewImproved_ip_addr_decoder
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module BirdEyeViewImproved_ip_addr_decoder
          (clk,
           reset,
           data_write,
           addr_sel,
           wr_enb,
           rd_enb,
           read_ip_timestamp,
           data_read,
           write_axi_enable,
           write_axi4_stream_video_slave_image_width,
           write_axi4_stream_video_slave_image_height,
           write_axi4_stream_video_slave_hporch,
           write_axi4_stream_video_slave_vporch);


  input   clk;
  input   reset;
  input   [31:0] data_write;  // ufix32
  input   [13:0] addr_sel;  // ufix14
  input   wr_enb;  // ufix1
  input   rd_enb;  // ufix1
  input   [31:0] read_ip_timestamp;  // ufix32
  output  [31:0] data_read;  // ufix32
  output  write_axi_enable;  // ufix1
  output  [12:0] write_axi4_stream_video_slave_image_width;  // ufix13
  output  [12:0] write_axi4_stream_video_slave_image_height;  // ufix13
  output  [12:0] write_axi4_stream_video_slave_hporch;  // ufix13
  output  [12:0] write_axi4_stream_video_slave_vporch;  // ufix13


  wire enb;
  wire decode_sel_ip_timestamp;  // ufix1
  wire const_1;  // ufix1
  wire [31:0] const_0;  // ufix32
  reg [31:0] read_reg_ip_timestamp;  // ufix32
  wire [31:0] decode_rd_ip_timestamp;  // ufix32
  wire decode_sel_axi_enable;  // ufix1
  wire reg_enb_axi_enable;  // ufix1
  wire data_in_axi_enable;  // ufix1
  reg  write_reg_axi_enable;  // ufix1
  wire decode_sel_axi4_stream_video_slave_image_width;  // ufix1
  wire reg_enb_axi4_stream_video_slave_image_width;  // ufix1
  wire [12:0] data_in_axi4_stream_video_slave_image_width;  // ufix13
  reg [12:0] write_reg_axi4_stream_video_slave_image_width;  // ufix13
  wire decode_sel_axi4_stream_video_slave_image_height;  // ufix1
  wire reg_enb_axi4_stream_video_slave_image_height;  // ufix1
  wire [12:0] data_in_axi4_stream_video_slave_image_height;  // ufix13
  reg [12:0] write_reg_axi4_stream_video_slave_image_height;  // ufix13
  wire decode_sel_axi4_stream_video_slave_hporch;  // ufix1
  wire reg_enb_axi4_stream_video_slave_hporch;  // ufix1
  wire [12:0] data_in_axi4_stream_video_slave_hporch;  // ufix13
  reg [12:0] write_reg_axi4_stream_video_slave_hporch;  // ufix13
  wire decode_sel_axi4_stream_video_slave_vporch;  // ufix1
  wire reg_enb_axi4_stream_video_slave_vporch;  // ufix1
  wire [12:0] data_in_axi4_stream_video_slave_vporch;  // ufix13
  reg [12:0] write_reg_axi4_stream_video_slave_vporch;  // ufix13


  assign decode_sel_ip_timestamp = addr_sel == 14'b00000000000110;



  assign const_1 = 1'b1;



  assign enb = const_1;

  assign const_0 = 32'b00000000000000000000000000000000;



  always @(posedge clk or posedge reset)
    begin : reg_ip_timestamp_process
      if (reset == 1'b1) begin
        read_reg_ip_timestamp <= 32'b00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          read_reg_ip_timestamp <= read_ip_timestamp;
        end
      end
    end



  assign decode_rd_ip_timestamp = (decode_sel_ip_timestamp == 1'b0 ? const_0 :
              read_reg_ip_timestamp);



  assign data_read = decode_rd_ip_timestamp;

  assign decode_sel_axi_enable = addr_sel == 14'b00000000000001;



  assign reg_enb_axi_enable = decode_sel_axi_enable & wr_enb;



  assign data_in_axi_enable = data_write[0];



  always @(posedge clk or posedge reset)
    begin : reg_axi_enable_process
      if (reset == 1'b1) begin
        write_reg_axi_enable <= 1'b1;
      end
      else begin
        if (enb && reg_enb_axi_enable) begin
          write_reg_axi_enable <= data_in_axi_enable;
        end
      end
    end



  assign write_axi_enable = write_reg_axi_enable;

  assign decode_sel_axi4_stream_video_slave_image_width = addr_sel == 14'b00000000000010;



  assign reg_enb_axi4_stream_video_slave_image_width = decode_sel_axi4_stream_video_slave_image_width & wr_enb;



  assign data_in_axi4_stream_video_slave_image_width = data_write[12:0];



  always @(posedge clk or posedge reset)
    begin : reg_axi4_stream_video_slave_image_width_process
      if (reset == 1'b1) begin
        write_reg_axi4_stream_video_slave_image_width <= 13'b0011110000000;
      end
      else begin
        if (enb && reg_enb_axi4_stream_video_slave_image_width) begin
          write_reg_axi4_stream_video_slave_image_width <= data_in_axi4_stream_video_slave_image_width;
        end
      end
    end



  assign write_axi4_stream_video_slave_image_width = write_reg_axi4_stream_video_slave_image_width;

  assign decode_sel_axi4_stream_video_slave_image_height = addr_sel == 14'b00000000000011;



  assign reg_enb_axi4_stream_video_slave_image_height = decode_sel_axi4_stream_video_slave_image_height & wr_enb;



  assign data_in_axi4_stream_video_slave_image_height = data_write[12:0];



  always @(posedge clk or posedge reset)
    begin : reg_axi4_stream_video_slave_image_height_process
      if (reset == 1'b1) begin
        write_reg_axi4_stream_video_slave_image_height <= 13'b0010000111000;
      end
      else begin
        if (enb && reg_enb_axi4_stream_video_slave_image_height) begin
          write_reg_axi4_stream_video_slave_image_height <= data_in_axi4_stream_video_slave_image_height;
        end
      end
    end



  assign write_axi4_stream_video_slave_image_height = write_reg_axi4_stream_video_slave_image_height;

  assign decode_sel_axi4_stream_video_slave_hporch = addr_sel == 14'b00000000000100;



  assign reg_enb_axi4_stream_video_slave_hporch = decode_sel_axi4_stream_video_slave_hporch & wr_enb;



  assign data_in_axi4_stream_video_slave_hporch = data_write[12:0];



  always @(posedge clk or posedge reset)
    begin : reg_axi4_stream_video_slave_hporch_process
      if (reset == 1'b1) begin
        write_reg_axi4_stream_video_slave_hporch <= 13'b0000100011000;
      end
      else begin
        if (enb && reg_enb_axi4_stream_video_slave_hporch) begin
          write_reg_axi4_stream_video_slave_hporch <= data_in_axi4_stream_video_slave_hporch;
        end
      end
    end



  assign write_axi4_stream_video_slave_hporch = write_reg_axi4_stream_video_slave_hporch;

  assign decode_sel_axi4_stream_video_slave_vporch = addr_sel == 14'b00000000000101;



  assign reg_enb_axi4_stream_video_slave_vporch = decode_sel_axi4_stream_video_slave_vporch & wr_enb;



  assign data_in_axi4_stream_video_slave_vporch = data_write[12:0];



  always @(posedge clk or posedge reset)
    begin : reg_axi4_stream_video_slave_vporch_process
      if (reset == 1'b1) begin
        write_reg_axi4_stream_video_slave_vporch <= 13'b0000000101101;
      end
      else begin
        if (enb && reg_enb_axi4_stream_video_slave_vporch) begin
          write_reg_axi4_stream_video_slave_vporch <= data_in_axi4_stream_video_slave_vporch;
        end
      end
    end



  assign write_axi4_stream_video_slave_vporch = write_reg_axi4_stream_video_slave_vporch;

endmodule  // BirdEyeViewImproved_ip_addr_decoder

