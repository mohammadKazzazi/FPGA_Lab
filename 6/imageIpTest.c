/*
 * imageIpTest.c
 *
 *  Created on: 
 *      Author: 
 */

#include "xaxidma.h"
#include "xparameters.h"
#include "sleep.h"
#include "xil_cache.h"
#include "xil_io.h"
#include "xscugic.h"

#define imageSize 512*512

XScuGic IntcInstance;
static void imageProcISR(void *CallBackRef);
static void dmaReceiveISR(void *CallBackRef);
int done;

int main(){
    u32 status;
	u32 totalTransmittedBytes=0;
	u32 transmittedBytes = 0;

	XAxiDma_Config *myDmaConfig;
	XAxiDma myDma;
    //DMA Controller Configuration
	myDmaConfig = XAxiDma_LookupConfigBaseAddr(XPAR_AXI_DMA_0_BASEADDR);
	status = XAxiDma_CfgInitialize(&myDma, myDmaConfig);
	if(status != XST_SUCCESS){
		print("DMA initialization failed\n");
		return -1;
	}

	XAxiDma_IntrEnable(&myDma, XAXIDMA_IRQ_IOC_MASK, XAXIDMA_DEVICE_TO_DMA);

	//Interrupt Controller Configuration
	XScuGic_Config *IntcConfig;
	IntcConfig = XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);
	status =  XScuGic_CfgInitialize(&IntcInstance, IntcConfig, IntcConfig->CpuBaseAddress);

	if(status != XST_SUCCESS){
		xil_printf("Interrupt controller initialization failed..");
		return -1;
	}

	//Set priority for o_intr
	XScuGic_SetPriorityTriggerType(&IntcInstance,XPAR_FABRIC_IMAGEPROCESS_0_O_INTR_INTR,0xA0,3);
	status = XScuGic_Connect(&IntcInstance,XPAR_FABRIC_IMAGEPROCESS_0_O_INTR_INTR,(Xil_InterruptHandler)imageProcISR,(void *)&myDma);
	if(status != XST_SUCCESS){
		xil_printf("Interrupt connection failed");
		return -1;
	}
	XScuGic_Enable(&IntcInstance,XPAR_FABRIC_IMAGEPROCESS_0_O_INTR_INTR);

	//Set priority for s2mm_introut
	XScuGic_SetPriorityTriggerType(&IntcInstance,XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR,0xA1,3);
	status = XScuGic_Connect(&IntcInstance,XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR,(Xil_InterruptHandler)dmaReceiveISR,(void *)&myDma);
	if(status != XST_SUCCESS){
		xil_printf("Interrupt connection failed");
		return -1;
	}
	XScuGic_Enable(&IntcInstance,XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR);

	//Always need this part
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,(Xil_ExceptionHandler)XScuGic_InterruptHandler,(void *)&IntcInstance);
	Xil_ExceptionEnable();

	//Sending and recieving data
	status = XAxiDma_SimpleTransfer(&myDma,(u32)imageData, 512*512,XAXIDMA_DEVICE_TO_DMA);
	status = XAxiDma_SimpleTransfer(&myDma,(u32)imageData, 4*512,XAXIDMA_DMA_TO_DEVICE); 
	if(status != XST_SUCCESS){
		print("DMA initialization failed\n");
		return -1;
	}


    while(!done){

    }

	//Now you have output image on memory.


}

//Check if the last transmission is completed
u32 checkIdle(u32 baseAddress,u32 offset){
	u32 status;
	status = (XAxiDma_ReadReg(baseAddress,offset))&XAXIDMA_IDLE_MASK;
	return status;
}

//The data proccessed and ready to recieve new line buffer
static void imageProcISR(void *CallBackRef){
	static int i=4;
	int status;
	XScuGic_Disable(&IntcInstance,XPAR_FABRIC_IMAGEPROCESS_0_O_INTR_INTR);
	status = checkIdle(XPAR_AXI_DMA_0_BASEADDR,0x4);
	while(status == 0)
		status = checkIdle(XPAR_AXI_DMA_0_BASEADDR,0x4);
	if(i<514){
		status = XAxiDma_SimpleTransfer((XAxiDma *)CallBackRef,(u32)&imageData[i*512],512,XAXIDMA_DMA_TO_DEVICE);
		i++;
	}
	XScuGic_Enable(&IntcInstance,XPAR_FABRIC_IMAGEPROCESS_0_O_INTR_INTR);
}

//Recieved all the data from IP 
static void dmaReceiveISR(void *CallBackRef){
	XAxiDma_IntrDisable((XAxiDma *)CallBackRef, XAXIDMA_IRQ_IOC_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrAckIrq((XAxiDma *)CallBackRef, XAXIDMA_IRQ_IOC_MASK, XAXIDMA_DEVICE_TO_DMA);
	done = 1;
	XAxiDma_IntrEnable((XAxiDma *)CallBackRef, XAXIDMA_IRQ_IOC_MASK, XAXIDMA_DEVICE_TO_DMA);
}


