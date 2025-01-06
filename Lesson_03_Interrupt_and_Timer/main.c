#include "stm32f10x_gpio.h"             // Device:StdPeriph Drivers:GPIO
#include "stm32f10x_rcc.h"              // Device:StdPeriph Drivers:RCC
#include "stm32f10x.h"                  // Device header
#include "stm32f10x_tim.h"              // Device:StdPeriph Drivers:TIM

void TIM_Config(void);
void GPIO_Config(void);
void RCC_Config(void);
void delay_ms(unsigned int timedelay);

void RCC_Config() {
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);
}

void GPIO_Config(){
	GPIO_InitTypeDef GPIO_InitStruct;

	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_4 | GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
	
	GPIO_Init(GPIOC, &GPIO_InitStruct);
	
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_0;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IPU;
	
	GPIO_Init(GPIOA, &GPIO_InitStruct);
}

void TIM_Config() {
    TIM_TimeBaseInitTypeDef TIM_InitStruct; 

    // Cau hình thông so co ban cho Timer
    TIM_InitStruct.TIM_ClockDivision = TIM_CKD_DIV1;       // Không chia xung nhip, gi 72MHz
    TIM_InitStruct.TIM_CounterMode = TIM_CounterMode_Up;   // Ðem lên
    TIM_InitStruct.TIM_Prescaler = 7200 - 1;               // Chia tan so d? tao xung 10 kHz (72 MHz / 7200)
    TIM_InitStruct.TIM_Period = 0xFFFF;                 // Giá tri dem (10 kHz -> 1 giây)
    TIM_InitStruct.TIM_RepetitionCounter = 0;              // Không l?p l?i
    TIM_TimeBaseInit(TIM2, &TIM_InitStruct);

    // Kích hoat Timer
    TIM_Cmd(TIM2, ENABLE);
}


void delay_ms(unsigned int timedelay) {
	TIM_SetCounter(TIM2, 0);
	while(TIM_GetCounter(TIM2)	< timedelay*10) {}
}

int main() {
	RCC_Config();
	GPIO_Config();
	TIM_Config();
	while (1) {
		GPIO_SetBits(GPIOC, GPIO_Pin_13);
		delay_ms(1000);
		GPIO_ResetBits(GPIOC, GPIO_Pin_13);
		delay_ms(1000);
	}
}
