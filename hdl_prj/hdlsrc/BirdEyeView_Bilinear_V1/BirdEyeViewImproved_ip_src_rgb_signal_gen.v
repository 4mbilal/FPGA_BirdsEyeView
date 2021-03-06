// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\BirdEyeView_Bilinear_V1\BirdEyeViewImproved_ip_src_rgb_signal_gen.v
// Created: 2019-03-29 20:31:29
// 
// Generated by MATLAB 9.6 and HDL Coder 3.14
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: BirdEyeViewImproved_ip_src_rgb_signal_gen
// Source Path: BirdEyeView_Bilinear_V1/IP_Core/rgb_signal_gen
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module BirdEyeViewImproved_ip_src_rgb_signal_gen
          (col,
           row,
           Pixel_Data,
           RGB_out);


  input   [9:0] col;  // ufix10
  input   [9:0] row;  // ufix10
  input   signed [101:0] Pixel_Data;  // sfix102_En64
  output  [31:0] RGB_out;  // uint32


  wire [7:0] R;  // ufix8
  wire [7:0] G;  // ufix8
  wire [7:0] B;  // ufix8


  //Double precision format
  // if(row<196)
  //     in_d = 0;
  // elseif(row>430)
  //     in_d = 0;
  // end
  // if(col<50)
  //     in_d = 0;
  // elseif(col>590)
  //     in_d = 0;
  // end
  assign R = (((Pixel_Data[101] == 1'b0) && (Pixel_Data[100:72] != 29'b00000000000000000000000000000)) || ((Pixel_Data[101] == 1'b0) && (Pixel_Data[71:64] == 8'b11111111)) ? 8'b11111111 :
              (Pixel_Data[101] == 1'b1 ? 8'b00000000 :
              Pixel_Data[71:64] + Pixel_Data[63]));
  //convert to fixed-point 8-bit signal
  assign G = (((Pixel_Data[101] == 1'b0) && (Pixel_Data[100:72] != 29'b00000000000000000000000000000)) || ((Pixel_Data[101] == 1'b0) && (Pixel_Data[71:64] == 8'b11111111)) ? 8'b11111111 :
              (Pixel_Data[101] == 1'b1 ? 8'b00000000 :
              Pixel_Data[71:64] + Pixel_Data[63]));
  assign B = (((Pixel_Data[101] == 1'b0) && (Pixel_Data[100:72] != 29'b00000000000000000000000000000)) || ((Pixel_Data[101] == 1'b0) && (Pixel_Data[71:64] == 8'b11111111)) ? 8'b11111111 :
              (Pixel_Data[101] == 1'b1 ? 8'b00000000 :
              Pixel_Data[71:64] + Pixel_Data[63]));
  assign RGB_out = {8'b11111111, R, G, B};
  //32-bit output signal



endmodule  // BirdEyeViewImproved_ip_src_rgb_signal_gen

