#include "stm32f10x.h"                  // Device header
#include "stm32f10x_rcc.h"              // Device:StdPeriph Drivers:RCC
#include "stm32f10x_gpio.h"             // Device:StdPeriph Drivers:GPIO
#include "stm32f10x_tim.h"              // Device:StdPeriph Drivers:TIM

#define SPI_CS_Pin 				GPIO_Pin_4
#define SPI_SCK_Pin 			GPIO_Pin_5
#define SPI_MISO_Pin 			GPIO_Pin_6
#define SPI_MOSI_Pin 			GPIO_Pin_7
#define SPI_GPIO 					GPIOA
#define SPI_RCC 					RCC_APB2Periph_GPIOA

void RCC_Config(){
  RCC_APB2PeriphClockCmd(SPI_RCC, ENABLE);
  RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);
}

void GPIO_Config(){
	GPIO_InitTypeDef GPIO_InitStructure;
	GPIO_InitStructure.GPIO_Pin = SPI_SCK_Pin | SPI_MOSI_Pin | SPI_CS_Pin;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(SPI_GPIO, &GPIO_InitStructure);
	
	GPIO_InitStructure.GPIO_Pin = SPI_MISO_Pin;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_Init(SPI_GPIO, &GPIO_InitStructure);
}


void TIM_Config() {
	TIM_TimeBaseInitTypeDef	TIM_InitStruct;
	
	TIM_InitStruct.TIM_ClockDivision	= TIM_CKD_DIV1;	//	72MHz
	TIM_InitStruct.TIM_CounterMode		=	TIM_CounterMode_Up;	//	Counting up mode
	TIM_InitStruct.TIM_Period					=	0xFFFF;	//	Maximum counter value
	TIM_InitStruct.TIM_Prescaler			= 7200 - 1;	//	0.1	ms/counting
	
	TIM_TimeBaseInit(TIM2, &TIM_InitStruct);
	TIM_Cmd(TIM2, ENABLE);
}

void delay_us(uint32_t time) {
	TIM_SetCounter(TIM2, 0);
	while(TIM_GetCounter(TIM2) < time/100) {}
}

uint8_t SPI_Slave_Receive() {
    uint8_t dataReceive = 0x00;
    uint8_t temp = 0x00;

    while (GPIO_ReadInputDataBit(SPI_GPIO, SPI_CS_Pin));

    for (int i = 0; i < 8; i++) {

        while (!GPIO_ReadInputDataBit(SPI_GPIO, SPI_SCK_Pin));

        temp = GPIO_ReadInputDataBit(SPI_GPIO, SPI_MOSI_Pin);

        dataReceive = (dataReceive << 1) | temp;

        while (GPIO_ReadInputDataBit(SPI_GPIO, SPI_SCK_Pin));
    }

    while (!GPIO_ReadInputDataBit(SPI_GPIO, SPI_CS_Pin));

    return dataReceive;
}

uint8_t SPI_Slave_Receive_1(uint8_t dataToSend) {
    uint8_t dataReceive = 0x00;
    uint8_t temp = 0x00;

    while (GPIO_ReadInputDataBit(SPI_GPIO, SPI_CS_Pin));

    for (int i = 0; i < 8; i++) {

        while (!GPIO_ReadInputDataBit(SPI_GPIO, SPI_SCK_Pin));

        temp = GPIO_ReadInputDataBit(SPI_GPIO, SPI_MOSI_Pin);

        dataReceive = (dataReceive << 1) | temp;
				
				if (dataToSend & 0x80) { 
						GPIO_WriteBit(SPI_GPIO, SPI_MISO_Pin, Bit_SET);
				} else {
						GPIO_WriteBit(SPI_GPIO, SPI_MISO_Pin, Bit_RESET);
				}
				
				delay_us(1);
				
				dataToSend = dataToSend << 1;

        while (GPIO_ReadInputDataBit(SPI_GPIO, SPI_SCK_Pin));
    }

    while (!GPIO_ReadInputDataBit(SPI_GPIO, SPI_CS_Pin));

    return dataReceive;
}

uint8_t txBuffer[] = {71, 61, 51, 41, 31, 21, 11};

uint8_t rxBuffer[7];

int main(){
	RCC_Config();
	GPIO_Config();
	TIM_Config();
	while(1){	
		for(int i = 0; i < 7; i++){
			rxBuffer[i] = SPI_Slave_Receive_1(txBuffer[i]);
		}
		
		delay_us(500000);
		for(int i = 0; i < 7; i++){
				rxBuffer[i] = 0;
		}
		delay_us(500000);
	}
}
