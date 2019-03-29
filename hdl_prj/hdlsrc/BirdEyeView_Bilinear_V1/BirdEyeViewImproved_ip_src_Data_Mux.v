// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\BirdEyeView_Bilinear_V1\BirdEyeViewImproved_ip_src_Data_Mux.v
// Created: 2019-03-29 20:31:29
// 
// Generated by MATLAB 9.6 and HDL Coder 3.14
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: BirdEyeViewImproved_ip_src_Data_Mux
// Source Path: BirdEyeView_Bilinear_V1/IP_Core/Data_Mux
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module BirdEyeViewImproved_ip_src_Data_Mux
          (D0,
           D1,
           D2,
           D3,
           mem_sel,
           deltaR,
           deltaC,
           D00,
           D11,
           D22,
           D33);


  input   [7:0] D0;  // uint8
  input   [7:0] D1;  // uint8
  input   [7:0] D2;  // uint8
  input   [7:0] D3;  // uint8
  input   [1:0] mem_sel;  // ufix2
  input   signed [39:0] deltaR;  // sfix40_En29
  input   signed [50:0] deltaC;  // sfix51_En35
  output  [7:0] D00;  // uint8
  output  [7:0] D11;  // uint8
  output  [7:0] D22;  // uint8
  output  [7:0] D33;  // uint8


  reg [7:0] D00_1;  // uint8
  reg [7:0] D11_1;  // uint8
  reg [7:0] D22_1;  // uint8
  reg [7:0] D33_1;  // uint8


  always @(D0, D1, D2, D3, mem_sel) begin
    case ( mem_sel)
      2'b00 :
        begin
          D00_1 = D0;
          D11_1 = D1;
          D22_1 = D2;
          D33_1 = D3;
        end
      2'b01 :
        begin
          D00_1 = D1;
          D11_1 = D0;
          D22_1 = D3;
          D33_1 = D2;
        end
      2'b10 :
        begin
          D00_1 = D2;
          D11_1 = D3;
          D22_1 = D0;
          D33_1 = D1;
        end
      2'b11 :
        begin
          D00_1 = D3;
          D11_1 = D2;
          D22_1 = D1;
          D33_1 = D0;
        end
      default :
        begin
          D00_1 = 8'd0;
          D11_1 = 8'd0;
          D22_1 = 8'd0;
          D33_1 = 8'd0;
        end
    endcase
    // deltaRC_3 = deltaR*deltaC;
    // deltaRC_2 = deltaR - deltaRC_3;
    // deltaRC_1 = deltaC - deltaRC_3;
    // deltaRC_0 = 1-deltaR-deltaC+deltaRC_3;
    // 
    // Data_interp = D00*deltaRC_0 + D11*deltaRC_1 +D22*deltaRC_2 +D33*deltaRC_3;
    // Data_interp = D11*(1-deltaR) + D33*(deltaR);
    // Data_interp = D00*(1-deltaR) + D22*(deltaR);
    // Data_interp = D00*(1-deltaC) + D11*(deltaC);
    // Data_interp = D22*(1-deltaC) + D33*(deltaC);
    // Data_interp = D00;
    // Data_Out = fi(Data_interp,0,8,0);
  end



  assign D00 = D00_1;

  assign D11 = D11_1;

  assign D22 = D22_1;

  assign D33 = D33_1;

endmodule  // BirdEyeViewImproved_ip_src_Data_Mux

