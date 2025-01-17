#include "osKernel.h"
#include "stm32f10x.h"

tcbType tcbs[MAX_NUM_OF_THREADS];
tcbType *currentPt;
uint32_t TCB_STACK[MAX_NUM_OF_THREADS][STACK_SIZE];

static int current_num_of_thread = 0;

//Set value for SysTick (to calculate quanta time)
uint32_t MILLIS_PRESCALER;

void osKernelStackInit1(int i) {
	  // Ðánh d?u stack v?i giá tr? d?c bi?t (ví d?: 0xDEADBEEF)
    for (int j = 0; j < STACK_SIZE; j++) {
        TCB_STACK[i][j] = 0xDEADBEEF;
    }

    tcbs[i].stackPt = &TCB_STACK[i][STACK_SIZE-16]; // StackPointer
    /* Set bit 21 (T-Bit) in PSR to 1 to operate it in Thumb Mode */
    TCB_STACK[i][STACK_SIZE-1] = 1 << 24; /* PSR 0x01000000*/
    /* Dummy stack content */            // PC
    TCB_STACK[i][STACK_SIZE-3] = 0x14141414; /* R14 (LR) */
    TCB_STACK[i][STACK_SIZE-4] = 0x12121212; /* R12 */
    TCB_STACK[i][STACK_SIZE-5] = 0x03030303; /* R3 */
    TCB_STACK[i][STACK_SIZE-6] = 0x02020202; /* R2 */
    TCB_STACK[i][STACK_SIZE-7] = 0x01010101; /* R1 */
    TCB_STACK[i][STACK_SIZE-8] = 0x00000000; /* R0 */
		/* We have to save manually*/
    TCB_STACK[i][STACK_SIZE-9] = 0x11111111; /* R11 */
    TCB_STACK[i][STACK_SIZE-10] = 0x10101010; /* R10 */
    TCB_STACK[i][STACK_SIZE-11] = 0x09090909; /* R9 */
    TCB_STACK[i][STACK_SIZE-12] = 0x08080808; /* R8 */
    TCB_STACK[i][STACK_SIZE-13] = 0x07070707; /* R7 */
    TCB_STACK[i][STACK_SIZE-14] = 0x06060606; /* R6 */
    TCB_STACK[i][STACK_SIZE-15] = 0x05050505; /* R5 */
    TCB_STACK[i][STACK_SIZE-16] = 0x04040404; /* R4 */
}

void osKernelStackInit(int i) {
    // Initialize the stack with a known pattern (0xDEADBEEF)
    for (int j = 0; j < STACK_SIZE; j++) {
        TCB_STACK[i][j] = 0xDEADBEEF;
    }

    tcbs[i].stackPt = &TCB_STACK[i][STACK_SIZE - 16]; // Set Stack Pointer
    TCB_STACK[i][STACK_SIZE - 1] = 1 << 24;           // PSR Thumb bit
    TCB_STACK[i][STACK_SIZE - 2] = *(volatile uint32_t *)(tcbs[i].baseAddress + 4); // PC (address of program to run)
    
    // Initialize other registers as dummy values for simplicity
    TCB_STACK[i][STACK_SIZE - 3] = 0x14141414; // LR
    TCB_STACK[i][STACK_SIZE - 4] = 0x12121212; // R12
    TCB_STACK[i][STACK_SIZE - 5] = 0x03030303; // R3
    TCB_STACK[i][STACK_SIZE - 6] = 0x02020202; // R2
    TCB_STACK[i][STACK_SIZE - 7] = 0x01010101; // R1
    TCB_STACK[i][STACK_SIZE - 8] = 0x00000000; // R0
    
    // Manually saved registers
    TCB_STACK[i][STACK_SIZE - 9]  = 0x11111111; // R11
    TCB_STACK[i][STACK_SIZE - 10] = 0x10101010; // R10
    TCB_STACK[i][STACK_SIZE - 11] = 0x09090909; // R9
    TCB_STACK[i][STACK_SIZE - 12] = 0x08080808; // R8
    TCB_STACK[i][STACK_SIZE - 13] = 0x07070707; // R7
    TCB_STACK[i][STACK_SIZE - 14] = 0x06060606; // R6
    TCB_STACK[i][STACK_SIZE - 15] = 0x05050505; // R5
    TCB_STACK[i][STACK_SIZE - 16] = 0x04040404; // R4
}

/*Ex
1s -> Bus_Freq 
1000ms-> Bus_Freq
1ms -> Bus_Freq/1000
*/
void osKernelInit(void){
	//1ms
	MILLIS_PRESCALER = (BUS_FREQ/1000);
}

void osKernelLaunch(uint32_t quanta){
	/*Reset the SysTick*/
	SysTick->CTRL = SYSTICK_RST;
	
	/*Clear Systick current value register*/
	SysTick->VAL = 0;
	
	/*Load the quanta*/
	SysTick->LOAD = (quanta*MILLIS_PRESCALER-1);
	
	/*Set Systick interupt to lowest priority*/
	NVIC_SetPriority(SysTick_IRQn, 15);
	
	/*Enable Systick, select Internal clock*/
	SysTick->CTRL |= CTRL_CLCKSRC|CTRL_ENABLE;
	
	/*Enable Systick interupt*/
	SysTick->CTRL |= CTRL_TICKINT;
	
	// __set_PSP(*(__IO uint32_t *)(currentPt->stackPt));
	//os launch scheduler
	osSchedulerLaunch();

  // JumpToProgram(0x08010000); 
}

void JumpToProgram(uint32_t baseAddress) {
   // void *const temp = baseAddress; 
		RCC_DeInit();
    SCB->SHCSR &= ~(SCB_SHCSR_USGFAULTENA_Msk | SCB_SHCSR_BUSFAULTENA_Msk | SCB_SHCSR_MEMFAULTENA_Msk); 
		// __set_MSP(*(__IO uint32_t*)baseAddress);
		__set_MSP((uint32_t)currentPt->stackPt);
	
    uint32_t JumAddress = *(__IO uint32_t*)(baseAddress + 4);
    ProgramPtr reset_handler = (ProgramPtr)JumAddress;
    
    reset_handler();
}

//void osSchedulerLaunch(void) {
//    currentPt = &tcbs[0];                // Set current task to Task1
//    __set_MSP((uint32_t)currentPt->stackPt);  // Set MSP to Task1's stack pointer
//    JumpToProgram(currentPt->baseAddress);         // Jump to Task1 program
//}

uint8_t osKernelAddThread(void (*task)(void)) {
	__disable_irq();
	
	
	tcbs[current_num_of_thread].baseAddress = (uint32_t)(task);
	osKernelStackInit(current_num_of_thread);
	
	if (!current_num_of_thread) {
		tcbs[current_num_of_thread].nextPt = &tcbs[current_num_of_thread];
	}else {
		tcbs[current_num_of_thread - 1].nextPt = &tcbs[current_num_of_thread];
		tcbs[current_num_of_thread].nextPt = &tcbs[0];
	}
	
	currentPt = &tcbs[0];
	
	current_num_of_thread++;
	__enable_irq();
	
	return 1;
}



//uint8_t osKernelAddThread1(void (*task0)(void), void (*task1)(void), void (*task2)(void)) {
//    /*Disable global interrupts */
//    __disable_irq();
//	
//    tcbs[0].nextPt = &tcbs[1];
//    tcbs[1].nextPt = &tcbs[2];
//		tcbs[2].nextPt = &tcbs[0];

//    osKernelStackInit1(0);
//    TCB_STACK[0][STACK_SIZE-2] = (uint32_t)(task0);

//    osKernelStackInit1(1);
//    TCB_STACK[1][STACK_SIZE-2] = (uint32_t)(task1);
//	
//		osKernelStackInit1(2);
//    TCB_STACK[1][STACK_SIZE-2] = (uint32_t)(task2);

//		currentPt = &tcbs[0];
//	
//    /* Enable global interrupts */
//    __enable_irq();

//    return 1;
//}

//uint8_t osKernelAddThread(void (*task0)(void), void (*task1)(void), void (*task2)(void)) {
//    __disable_irq();  // Disable global interrupts

//    // Chain threads in circular linked list
//    tcbs[0].nextPt = &tcbs[1];
//    tcbs[1].nextPt = &tcbs[2];
//		tcbs[2].nextPt = &tcbs[0];

//    // Set base address for each task and initialize their stack
//    tcbs[0].baseAddress = (uint32_t)(task0) + 4;
//    osKernelStackInit(0);

//    tcbs[1].baseAddress = (uint32_t)(task1) + 4;
//    osKernelStackInit(1);
//	
//		tcbs[2].baseAddress = (uint32_t)(task2) + 4;
//    osKernelStackInit(2);

//    currentPt = &tcbs[0];  // Point to the first thread

//    __enable_irq();  // Enable global interrupts

//    return 1;
//}
