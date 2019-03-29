/*
 * File Name:         hdl_prj\ipcore\BirdEyeViewImproved_ip_v1_0\include\BirdEyeViewImproved_ip_addr.h
 * Description:       C Header File
 * Created:           2019-03-29 20:31:43
*/

#ifndef BIRDEYEVIEWIMPROVED_IP_H_
#define BIRDEYEVIEWIMPROVED_IP_H_

#define  IPCore_Reset_BirdEyeViewImproved_ip                          0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_BirdEyeViewImproved_ip                         0x4  //enabled (by default) when bit 0 is 0x1
#define  AXI4_Stream_Video_Slave_ImageWidth_BirdEyeViewImproved_ip    0x8  //Active pixels per line in each video frame for "AXI4-Stream Video Slave" interface, the default value is 1920.
#define  AXI4_Stream_Video_Slave_ImageHeight_BirdEyeViewImproved_ip   0xC  //Active video lines in each video frame for "AXI4-Stream Video Slave" interface, the default value is 1080.
#define  AXI4_Stream_Video_Slave_HPorch_BirdEyeViewImproved_ip        0x10  //Horizontal porch length in each video frame for "AXI4-Stream Video Slave" interface, the default value is 280.
#define  AXI4_Stream_Video_Slave_VPorch_BirdEyeViewImproved_ip        0x14  //Vertical porch length in each video frame for "AXI4-Stream Video Slave" interface, the default value is 45.
#define  IPCore_Timestamp_BirdEyeViewImproved_ip                      0x18  //contains unique IP timestamp (yymmddHHMM): 1903292031

#endif /* BIRDEYEVIEWIMPROVED_IP_H_ */
