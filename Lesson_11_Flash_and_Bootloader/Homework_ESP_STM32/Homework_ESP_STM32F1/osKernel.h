/***************************************************************************
 * @file    osKernel.h
 * @brief   Khai báo các hàm và câu trúc liên quan Kernel
 * @details 
 * @version 1.0
 * @date    2024-09-11
 * @author  Nguyen Van Thuong
 * @website https://hala.edu.vn/
 ***************************************************************************/
#ifndef __OS_KERNEL_H__
#define __OS_KERNEL_H__

#include <stdint.h> 

#define NUM_OF_THREADS 		3
#define MAX_NUM_OF_THREADS 5
#define STACK_SIZE 				300
//Clock freq for SysTick
#define BUS_FREQ 			72000000

// Systick
#define __vo volatile
#define SYST_BASEADDR 	0xE000E010

typedef struct tcbType{
    uint32_t *stackPt;        
    struct tcbType *nextPt;
		uint32_t baseAddress;
} tcbType;

typedef struct {
	__vo uint32_t CSR;
	__vo uint32_t RVR;
	__vo uint32_t CVR;
	__vo uint32_t CALIB;
} STK_RegDef_t;
#define SYST ((STK_RegDef_t *)SYST_BASEADDR)

//Init some value for SysTick Reg
#define CTRL_ENABLE 		(1<<0)
#define CTRL_TICKINT 		(1<<1)
#define CTRL_CLCKSRC 		(1<<2)
#define CTRL_COUNTFLAG 		(1<<16)
#define SYSTICK_RST 		0

typedef void (*ProgramPtr)(void);

extern tcbType tcbs[MAX_NUM_OF_THREADS];
extern tcbType *currentPt;
extern uint32_t TCB_STACK[MAX_NUM_OF_THREADS][STACK_SIZE];
extern uint32_t MILLIS_PRESCALER;


void osKernelLaunch(uint32_t quanta);
void osKernelInit(void);
void osKernelStackInit(int i);
void osKernelStackInit1(int i);
void osSchedulerLaunch(void);

void JumpToProgram(uint32_t baseAddress);

uint8_t osKernelAddThread(void (*task)(void));

//uint8_t osKernelAddThread(void (*task0)(void), void (*task1)(void), void (*task2)(void));
//uint8_t osKernelAddThread1(void (*task0)(void), void (*task1)(void), void (*task2)(void));

#endif
