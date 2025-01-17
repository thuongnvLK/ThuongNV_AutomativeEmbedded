//#include "stm32f10x.h"

//#define STACK_SIZE 1024

//typedef void (*pFunction)(void);

//// Task Control Block
//typedef struct {
//    uint32_t *stackPointer;
//    uint32_t baseAddress;
//} TaskControlBlock;

//// Kh?i t?o Task Control Block
//TaskControlBlock TC1_TCB, TC2_TCB;

//// Stack cho các task
//uint32_t stack_CT1[STACK_SIZE], stack_CT2[STACK_SIZE];

//// Nh?y d?n chuong trình bên ngoài
//void jumToApplication(uint32_t address) {
//    pFunction jumpToApp;
//    uint32_t jumpAddress;

//    // L?y d?a ch? hàm kh?i t?o c?a ?ng d?ng
//    jumpAddress = *(__IO uint32_t *)(address + 4);

//    // C?u hình stack pointer cho ?ng d?ng
//    __set_MSP(*(__IO uint32_t *)address);

//    // Nh?y vào ?ng d?ng
//    jumpToApp = (pFunction)jumpAddress;
//    jumpToApp();
//}

//// Kh?i t?o stack cho task
//void initTask(TaskControlBlock *tcb, uint32_t *stack, uint32_t baseAddress) {
//    tcb->stackPointer = &stack[STACK_SIZE - 16];
//    tcb->baseAddress = baseAddress;

//    // Kh?i t?o stack cho task
//    stack[STACK_SIZE - 1] = (1 << 24); // xPSR
//    stack[STACK_SIZE - 2] = baseAddress + 4; // PC
//    stack[STACK_SIZE - 3] = 0xFFFFFFFD; // LR
//    stack[STACK_SIZE - 4] = 0xFFFFFFFD; // R12
//    stack[STACK_SIZE - 5] = 0xFFFFFFFD; // R3
//    stack[STACK_SIZE - 6] = 0xFFFFFFFD; // R2
//    stack[STACK_SIZE - 7] = 0xFFFFFFFD; // R1
//    stack[STACK_SIZE - 8] = 0xFFFFFFFD; // R0
//    stack[STACK_SIZE - 9] = 0xFFFFFFFD; // R11
//    stack[STACK_SIZE - 10] = 0xFFFFFFFD; // R10
//    stack[STACK_SIZE - 11] = 0xFFFFFFFD; // R9
//    stack[STACK_SIZE - 12] = 0xFFFFFFFD; // R8
//    stack[STACK_SIZE - 13] = 0xFFFFFFFD; // R7
//    stack[STACK_SIZE - 14] = 0xFFFFFFFD; // R6
//    stack[STACK_SIZE - 15] = 0xFFFFFFFD; // R5
//    stack[STACK_SIZE - 16] = 0xFFFFFFFD; // R4
//}

//// Scheduler
//void scheduler(void) {
//    TaskControlBlock *currentTask = &TC1_TCB;
//    TaskControlBlock *nextTask = &TC2_TCB;

//    while (1) {
//        // Luu ng? c?nh c?a task hi?n t?i
//        __asm volatile (
//            "MRS R0, MSP\n" // L?y MSP hi?n t?i
//            "STR R0, [%0]\n" // Luu MSP vào TCB c?a task hi?n t?i
//            : 
//            : "r" (&currentTask->stackPointer)
//            : "r0"
//        );

//        // Chuy?n sang task ti?p theo
//        currentTask = nextTask;
//        nextTask = (currentTask == &TC1_TCB) ? &TC2_TCB : &TC1_TCB;

//        // T?i ng? c?nh c?a task ti?p theo
//        __asm volatile (
//            "LDR R0, [%0]\n" // T?i MSP c?a task ti?p theo
//            "MSR MSP, R0\n" // Ð?t MSP cho task ti?p theo
//            : 
//            : "r" (&currentTask->stackPointer)
//            : "r0"
//        );

//        // Th?c hi?n chuy?n d?i ng? c?nh
//        __asm volatile ("BX LR");
//    }
//}

//int main(void) {
//    // Kh?i t?o các task v?i chuong trình t?i hai d?a ch? c? th?
//    initTask(&TC1_TCB, stack_CT1, 0x08010000);
//    initTask(&TC2_TCB, stack_CT2, 0x08013800);
//    
//    // Ch?y scheduler d? qu?n lý các task
//    scheduler();

//    // Trong tru?ng h?p b?n c?n nh?y d?n chuong trình khác
//    // uint32_t address = 0x08010000; // Ð?a ch? c?a chuong trình mu?n nh?y d?n
//    // jumToApplication(address);

//    while (1) {
//    }
//}

#include "osKernel.h"
#include "stm32f10x.h"



#define QUANTA 100
//uint32_t counter1, counter2;

//void Thread0(void)
//{
//	while(1){counter1++; }
//}

//void Thread1(void)
//{
//	while(1){counter2++;}
//}

void (*program1)(void) = (void (*)(void))0x08010000  ; //  0x08000800; // sTOP
void (*program2)(void) = (void (*)(void))0x08018000   ;//  0x08002C00;  // rUNG
void (*program3)(void) = (void (*)(void))0x08008000  ;// 0x08005000; // SLOW

int main(void)
{
	osKernelInit();
	osKernelAddThread(program1);
	osKernelAddThread(program2);
	osKernelAddThread(program3);
	osKernelLaunch(QUANTA);
	
}

