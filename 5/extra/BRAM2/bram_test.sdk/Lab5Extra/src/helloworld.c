///******************************************************************************
//*
//* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
//*
//* Permission is hereby granted, free of charge, to any person obtaining a copy
//* of this software and associated documentation files (the "Software"), to deal
//* in the Software without restriction, including without limitation the rights
//* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//* copies of the Software, and to permit persons to whom the Software is
//* furnished to do so, subject to the following conditions:
//*
//* The above copyright notice and this permission notice shall be included in
//* all copies or substantial portions of the Software.
//*
//* Use of the Software is limited solely to applications:
//* (a) running on a Xilinx device, or
//* (b) that interact with a Xilinx device through a bus or interconnect.
//*
//* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
//* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
//* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//* SOFTWARE.
//*
//* Except as contained in this notice, the name of the Xilinx shall not be used
//* in advertising or otherwise to promote the sale, use or other dealings in
//* this Software without prior written authorization from Xilinx.
//*
//******************************************************************************/
//
///*
// * helloworld.c: simple test application
// *
// * This application configures UART 16550 to baud rate 9600.
// * PS7 UART (Zynq) is not initialized by this application, since
// * bootrom/bsp configures it to baud rate 115200
// *
// * ------------------------------------------------
// * | UART TYPE   BAUD RATE                        |
// * ------------------------------------------------
// *   uartns550   9600
// *   uartlite    Configurable only in HW design
// *   ps7_uart    115200 (configured by bootrom/bsp)
// */
//
//#include "xil_printf.h"
//#include "xbram.h"
//#include <stdio.h>
//#include "pl_ram_ctrl.h"
//#include "xscugic.h"
//#include "xgpio.h"
//#include "math.h"
//
//#define BRAM_CTRL_BASE      XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR
//#define BRAM_CTRL_HIGH      XPAR_AXI_BRAM_CTRL_0_S_AXI_HIGHADDR
//#define PL_RAM_BASE         XPAR_PL_RAM_CTRL_0_S00_AXI_BASEADDR
//#define PL_RAM_START        PL_RAM_CTRL_S00_AXI_SLV_REG0_OFFSET
//#define PL_RAM_INIT_DATA    PL_RAM_CTRL_S00_AXI_SLV_REG1_OFFSET
//#define PL_RAM_LEN          PL_RAM_CTRL_S00_AXI_SLV_REG2_OFFSET
//#define PL_RAM_ST_ADDR      PL_RAM_CTRL_S00_AXI_SLV_REG3_OFFSET
//
//#define GPIO_DEVICE_ID      XPAR_AXI_GPIO_0_DEVICE_ID
//#define INTC_DEVICE_ID	    XPAR_SCUGIC_SINGLE_DEVICE_ID
//#define GPIO_INTR_ID        XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR
//#define GPIO_INTR_MASK      XGPIO_IR_CH1_MASK
//#define GPIO_BASE_ADDR      XPAR_AXI_GPIO_0_BASEADDR
//
//#define TEST_START_VAL      0x0
///*
// * BRAM bytes number
// */
//#define BRAM_BYTENUM        4
//
//XGpio PL_Gpio ;
//XScuGic INTCInst;
//
//int Len = 256, power  ;
//int Start_Addr ;
//int Gpio_flag ;
//double step = 2 * M_PI /(double)256 ;
///*
// * Function declaration
// */
//int bram_read_write() ;
//int IntrInitFuntion(u16 DeviceId, XGpio *GpioInstancePtr);
//void GpioHandler(void *InstancePtr);
//
//int main()
//{
//	xil_printf("hello\n");
//	int Status;
//	Gpio_flag = 1 ;
//
//	Status = XGpio_Initialize(&PL_Gpio, GPIO_DEVICE_ID) ;
//	if (Status != XST_SUCCESS)
//		return XST_FAILURE ;
//
//	Status = IntrInitFuntion(GPIO_DEVICE_ID, &PL_Gpio) ;
//	if (Status != XST_SUCCESS)
//		return XST_FAILURE ;
//
//
//	while(1)
//	{
//		if (Gpio_flag)
//		{
//			Gpio_flag = 0 ;
//			printf("Please provide start address\t\n") ;
//			scanf("%d", &Start_Addr) ;
//			printf("Start address is %d\t\n", Start_Addr) ;
//			printf("Please provide freq multiplier\t\n") ;
//			scanf("%d", &power) ;
//			printf("Freq. multiplier is %d\t\n", power) ;
//			Status = bram_read_write() ;
//			if (Status != XST_SUCCESS)
//			{
//				xil_printf("Bram Test Failed!\r\n") ;
//				xil_printf("******************************************\r\n");
//				Gpio_flag = 1 ;
//			}
//		}
//	}
//}
//
//
//int bram_read_write()
//{
//
//	u32 Write_Data, Read_Data ;
//	double data = TEST_START_VAL;
//	int i ;
//
//	/*
//	 * if exceed BRAM address range, assert error
//	 */
//	if ((Start_Addr + Len) > (BRAM_CTRL_HIGH - BRAM_CTRL_BASE + 1)/4)
//	{
//		xil_printf("******************************************\r\n");
//		xil_printf("Error! Exceed Bram Control Address Range!\r\n");
//		return XST_FAILURE ;
//	}
//	/*
//	 * Write data to BRAM
//	 */
//	for(i = BRAM_BYTENUM*Start_Addr ; i < BRAM_BYTENUM*(Start_Addr + Len) ; i += BRAM_BYTENUM)
//	{
//		Write_Data = (int32_t)(sin(data) * (1 << 16));
//		XBram_WriteReg(XPAR_BRAM_0_BASEADDR, i , Write_Data) ;
//		data += step ;
//	}
//
//	//Set ram read and write length
//	PL_RAM_CTRL_mWriteReg(PL_RAM_BASE, PL_RAM_LEN , BRAM_BYTENUM*Len) ;
//	//Set ram start address
//	PL_RAM_CTRL_mWriteReg(PL_RAM_BASE, PL_RAM_ST_ADDR , BRAM_BYTENUM*Start_Addr) ;
//	//Set pl initial data
//	PL_RAM_CTRL_mWriteReg(PL_RAM_BASE, PL_RAM_INIT_DATA , power) ;
//	//Set ram start signal
//	PL_RAM_CTRL_mWriteReg(PL_RAM_BASE, PL_RAM_START , 1) ;
//
//	return XST_SUCCESS ;
//}
//
//
//
//int IntrInitFuntion(u16 DeviceId, XGpio *GpioInstancePtr)
//{
//	XScuGic_Config *IntcConfig;
//	int Status ;
//
//
//	//check device id
//	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
//	//intialization
//	Status = XScuGic_CfgInitialize(&INTCInst, IntcConfig, IntcConfig->CpuBaseAddress) ;
//	if (Status != XST_SUCCESS)
//		return XST_FAILURE ;
//
//
//	XScuGic_SetPriorityTriggerType(&INTCInst, GPIO_INTR_ID,
//			0xA0, 0x3);
//
//	Status = XScuGic_Connect(&INTCInst, GPIO_INTR_ID,
//			(Xil_ExceptionHandler)GpioHandler,
//			(void *)GpioInstancePtr) ;
//	if (Status != XST_SUCCESS)
//		return XST_FAILURE ;
//
//	XScuGic_Enable(&INTCInst, GPIO_INTR_ID) ;
//	//enable interrupt
//	XGpio_InterruptEnable(GpioInstancePtr, GPIO_INTR_MASK) ;
//	XGpio_InterruptGlobalEnable(GpioInstancePtr) ;
//
//
//	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
//			(Xil_ExceptionHandler)XScuGic_InterruptHandler,
//			&INTCInst);
//	Xil_ExceptionEnable();
//
//
//	return XST_SUCCESS ;
//
//}
//
//void GpioHandler(void *CallbackRef)
//{
//	XGpio *GpioInstancePtr = (XGpio *)CallbackRef ;
//	int Read_Data ;
//	Len /= pow(2,power);
//
//	int i ;
//	printf("Enter interrupt\t\n");
//	//clear interrupt status
//	XGpio_InterruptClear(GpioInstancePtr, GPIO_INTR_MASK) ;
//
//	for(i = BRAM_BYTENUM*Start_Addr ; i < BRAM_BYTENUM*(Start_Addr + Len) ; i += BRAM_BYTENUM)
//	{
//		Read_Data = XBram_ReadReg(XPAR_BRAM_0_BASEADDR , i) ;
//		printf("Address is %d\t Read data is %d\t\n",  i/BRAM_BYTENUM ,Read_Data) ;
//	}
//	Gpio_flag = 1 ;
//}





/* ------------------------------------------------------------ */
/*				Include File Definitions						*/
/* ------------------------------------------------------------ */

#include "xil_printf.h"
#include "xbram.h"
#include <stdio.h>
#include "pl_ram_ctrl.h"
#include "xscugic.h"
#include "xgpio.h"
#include "xparameters.h"	/* SDK generated parameters */
#include "xsdps.h"		/* SD device driver */
#include "xil_printf.h"
#include "ff.h"
#include "xil_cache.h"
#include "xplatform_info.h"
#include "string.h"

#define BRAM_CTRL_BASE      XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR
#define BRAM_CTRL_HIGH      XPAR_AXI_BRAM_CTRL_0_S_AXI_HIGHADDR
#define PL_RAM_BASE         XPAR_PL_RAM_CTRL_0_S00_AXI_BASEADDR
#define PL_RAM_START        PL_RAM_CTRL_S00_AXI_SLV_REG0_OFFSET
#define PL_RAM_INIT_DATA    PL_RAM_CTRL_S00_AXI_SLV_REG1_OFFSET
#define PL_RAM_LEN          PL_RAM_CTRL_S00_AXI_SLV_REG2_OFFSET
#define PL_RAM_ST_ADDR      PL_RAM_CTRL_S00_AXI_SLV_REG3_OFFSET

#define GPIO_DEVICE_ID      XPAR_AXI_GPIO_0_DEVICE_ID
#define INTC_DEVICE_ID	    XPAR_SCUGIC_SINGLE_DEVICE_ID
#define GPIO_INTR_ID        XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR
#define GPIO_INTR_MASK      XGPIO_IR_CH1_MASK
#define GPIO_BASE_ADDR      XPAR_AXI_GPIO_0_BASEADDR

#define TEST_START_VAL      0xC
/*
 * BRAM bytes number
 */
#define BRAM_BYTENUM        4

XGpio PL_Gpio ;
XScuGic INTCInst;

int Len  ;
int Start_Addr ;
int Gpio_flag ;
/*
 * Function declaration
 */
/************************** Function Prototypes ******************************/
int FfsSdPolledExample(void);

/************************** Variable Definitions *****************************/
static FIL fil;		/* File object */
static FATFS fatfs;
/*
 * To test logical drive 0, FileName should be "0:/<File name>" or
 * "<file_name>". For logical drive 1, FileName should be "1:/<file_name>"
 */
static char FileName[32] = "cos.txt";
static char *SD_File;
u32 Platform;

#ifdef __ICCARM__
#pragma data_alignment = 32
u8 DestinationAddress[10*1024*1024];
u8 SourceAddress[10*1024*1024];
#pragma data_alignment = 4
#else
u8 DestinationAddress[32*1024*1024] __attribute__ ((aligned(32)));
u8 SourceAddress[16*1024] __attribute__ ((aligned(32)));
#endif

#define TEST 7

/*****************************************************************************/


int bram_read_write() ;
int IntrInitFuntion(u16 DeviceId, XGpio *GpioInstancePtr);
void GpioHandler(void *InstancePtr);

int main()
{

	int Status;


	Status = FfsSdPolledExample();

		Gpio_flag = 1 ;

		Status = XGpio_Initialize(&PL_Gpio, GPIO_DEVICE_ID) ;
		if (Status != XST_SUCCESS)
			return XST_FAILURE ;

		Status = IntrInitFuntion(GPIO_DEVICE_ID, &PL_Gpio) ;
		if (Status != XST_SUCCESS)
			return XST_FAILURE ;


		xil_printf("Bram Test Failed!\r\n");
		sleep(3);
		if (Gpio_flag)
		{
			Gpio_flag = 0 ;
			Start_Addr = 0;
			Len = 1024;
			Status = bram_read_write() ;
			if (Status != XST_SUCCESS)
			{
				xil_printf("Bram Test Failed!\r\n") ;
				xil_printf("******************************************\r\n");
				Gpio_flag = 1 ;
			}
		}

}


int bram_read_write()
{

	u32 Write_Data = TEST_START_VAL ;
	int i ;

	/*
	 * if exceed BRAM address range, assert error
	 */
	if ((Start_Addr + Len) > (BRAM_CTRL_HIGH - BRAM_CTRL_BASE + 1)/4)
	{
		xil_printf("******************************************\r\n");
		xil_printf("Error! Exceed Bram Control Address Range!\r\n");
		return XST_FAILURE ;
	}
	/*
	 * Write data to BRAM
	 */


	for(i = BRAM_BYTENUM*Start_Addr ; i < BRAM_BYTENUM*(Start_Addr + Len) ; i += BRAM_BYTENUM)
	{
		int cnt = 0;
		u32 num = 0;
		int p = 1;
		for(int j = 0; j < 16; j++)
		{
				cnt ++;
				num += (int)(SourceAddress[j + i * 4] - '0') * p;
				p *= 2;

			if (cnt == 16){
				cnt = 0;
				printf("%d",  num);
				printf("\n");
			}
		}

		XBram_WriteReg(XPAR_BRAM_0_BASEADDR, i , (u32)num) ;
	}


	//Set ram read and write length
	PL_RAM_CTRL_mWriteReg(PL_RAM_BASE, PL_RAM_LEN , BRAM_BYTENUM*Len) ;
	//Set ram start address
	PL_RAM_CTRL_mWriteReg(PL_RAM_BASE, PL_RAM_ST_ADDR , BRAM_BYTENUM*Start_Addr) ;
	//Set pl initial data
	PL_RAM_CTRL_mWriteReg(PL_RAM_BASE, PL_RAM_INIT_DATA , (Start_Addr+1)) ;
	//Set ram start signal
	PL_RAM_CTRL_mWriteReg(PL_RAM_BASE, PL_RAM_START , 1) ;




	XGpio *GpioInstancePtr = (XGpio *)&PL_Gpio ;
	int Read_Data ;


	printf("Enter interrupt\t\n");
	//clear interrupt status
	XGpio_InterruptClear(GpioInstancePtr, GPIO_INTR_MASK) ;

    int *address = (int *)XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR;
    int data;

   for (int i = 0; i<50 ; i++) {

  	   data = address[i];
  	   xil_printf("%d , data = %d \n" , i , data);
     }
	for(i = BRAM_BYTENUM*Start_Addr ; i < BRAM_BYTENUM*(Start_Addr + Len) ; i += 2*BRAM_BYTENUM)
	{
		Read_Data = XBram_ReadReg(XPAR_BRAM_0_BASEADDR , i) ;
		printf("Address is %d\t Read data is %d\t\n",  i/BRAM_BYTENUM ,Read_Data) ;

	}
	Gpio_flag = 1 ;



	return XST_SUCCESS ;
}



int IntrInitFuntion(u16 DeviceId, XGpio *GpioInstancePtr)
{
	XScuGic_Config *IntcConfig;
	int Status ;


	//check device id
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	//intialization
	Status = XScuGic_CfgInitialize(&INTCInst, IntcConfig, IntcConfig->CpuBaseAddress) ;
	if (Status != XST_SUCCESS)
		return XST_FAILURE ;


	XScuGic_SetPriorityTriggerType(&INTCInst, GPIO_INTR_ID,
			0xA0, 0x3);

	Status = XScuGic_Connect(&INTCInst, GPIO_INTR_ID,
			(Xil_ExceptionHandler)GpioHandler,
			(void *)GpioInstancePtr) ;
	if (Status != XST_SUCCESS)
		return XST_FAILURE ;

	XScuGic_Enable(&INTCInst, GPIO_INTR_ID) ;
	//enable interrupt
	XGpio_InterruptEnable(GpioInstancePtr, GPIO_INTR_MASK) ;
	XGpio_InterruptGlobalEnable(GpioInstancePtr) ;


	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)XScuGic_InterruptHandler,
			&INTCInst);
	Xil_ExceptionEnable();


	return XST_SUCCESS ;

}

void GpioHandler(void *CallbackRef)
{
	XGpio *GpioInstancePtr = (XGpio *)CallbackRef ;
	int Read_Data ;

	int i ;
	printf("Enter interrupt\t\n");
	//clear interrupt status
	XGpio_InterruptClear(GpioInstancePtr, GPIO_INTR_MASK) ;

	for(i = BRAM_BYTENUM*Start_Addr ; i < BRAM_BYTENUM*(Start_Addr + Len) ; i += BRAM_BYTENUM)
	{
		Read_Data = XBram_ReadReg(XPAR_BRAM_0_BASEADDR , i) ;
		printf("Address is %d\t Read data is %d\t\n",  i/BRAM_BYTENUM ,Read_Data) ;
	}
	Gpio_flag = 1 ;
}

int FfsSdPolledExample(void)
{
	FRESULT Res;
	UINT NumBytesRead = 1024;
	UINT NumBytesWritten;
	u32 BuffCnt;
	u32 FileSize = (32*1024);
	/*
	 * To test logical drive 0, Path should be "0:/"
	 * For logical drive 1, Path should be "1:/"
	 */
	TCHAR *Path = "0:/";

	Platform = XGetPlatform_Info();
	if (Platform == XPLAT_ZYNQ_ULTRA_MP) {
		/*
		 * Since 8MB in Emulation Platform taking long time, reduced
		 * file size to 8KB.
		 */
		FileSize = 8*1024;
	}

	for(BuffCnt = 0; BuffCnt < FileSize; BuffCnt++){
		SourceAddress[BuffCnt] = TEST + BuffCnt;
	}

	/*
	 * Register volume work area, initialize device
	 */
	Res = f_mount(&fatfs, Path, 0);

	if (Res != FR_OK) {
		return XST_FAILURE;
	}



	/*
	 * Open file with required permissions.
	 * Here - Creating new file with read/write permissions. .
	 * To open file with write permissions, file system should not
	 * be in Read Only mode.
	 */
	SD_File = (char *)FileName;

	Res = f_open(&fil, SD_File, FA_READ);
	if (Res) {
		return XST_FAILURE;
	}

	/*
	 * Pointer to beginning of file .
	 */
	Res = f_lseek(&fil, 0);
	if (Res) {
		return XST_FAILURE;
	}

	/*
	 * Read data from file.
	 */
	Res = f_read(&fil, (void*)DestinationAddress, FileSize,
			&NumBytesRead);
	int cnt = 0;
	int cc = 0;
	for(int i = 0; i < 16*1024 + 1024; i++)
	{

		if(DestinationAddress[i] != 10){
			cnt ++;
			SourceAddress[cc] = DestinationAddress[i];
			printf("%d",  SourceAddress[cc] - '0');
			cc++;
		}
		if (cnt == 16){
			printf("\n");
			cnt = 0;
		}

	}
	if (Res) {
		return XST_FAILURE;
	}


	/*
	 * Close file.
	 */
	Res = f_close(&fil);
	if (Res) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

