#include "stm32f10x_gpio.h"             // Device:StdPeriph Drivers:GPIO
#include "stm32f10x_spi.h"              // Device:StdPeriph Drivers:SPI
#include "stm32f10x_rcc.h"              // Device:StdPeriph Drivers:RCC
#include "stm32f10x.h"                  // Device header
#include "stm32f10x_tim.h"              // Device:StdPeriph Drivers:TIM


#define SPI1_NSS		GPIO_Pin_4
#define SPI1_SCK		GPIO_Pin_5
#define SPI1_MISO		GPIO_Pin_6
#define SPI1_MOSI		GPIO_Pin_7
#define SPI1_GPIO		GPIOA

void RCC_Config() {
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE); // Clock cho GPIOA
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1, ENABLE);  // Clock cho SPI1
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);	// Clock cho TIM2
}

void GPIO_Config(){
	GPIO_InitTypeDef GPIO_InitStruct;
	
	GPIO_InitStruct.GPIO_Pin = SPI1_NSS | SPI1_SCK | SPI1_MISO | SPI1_MOSI;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AF_PP;

	GPIO_Init(SPI1_GPIO, &GPIO_InitStruct);
}

void SPI_Config(){
	SPI_InitTypeDef SPI_InitStruct;
	SPI_InitStruct.SPI_Mode = SPI_Mode_Master;
	SPI_InitStruct.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
	SPI_InitStruct.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_16;
	SPI_InitStruct.SPI_CPOL = SPI_CPOL_Low;
	SPI_InitStruct.SPI_CPHA = SPI_CPHA_1Edge;
	SPI_InitStruct.SPI_DataSize = SPI_DataSize_8b;
	SPI_InitStruct.SPI_FirstBit = SPI_FirstBit_LSB;
	SPI_InitStruct.SPI_CRCPolynomial = 7;
	SPI_InitStruct.SPI_NSS = SPI_NSS_Soft;
	
	SPI_Init(SPI1, &SPI_InitStruct);
	SPI_Cmd(SPI1, ENABLE);
}

void SPI_Send1Byte(uint8_t data){
	GPIO_ResetBits(GPIOA, SPI1_NSS);
	while(SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE) == RESET){}
	SPI_I2S_SendData(SPI1, data);
	while(SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_BSY) == SET){}
	GPIO_SetBits(GPIOA, SPI1_NSS);
}

void TIM_Config(){
	TIM_TimeBaseInitTypeDef TIM_InitStruct;
	
	TIM_InitStruct.TIM_ClockDivision = TIM_CKD_DIV1;
	TIM_InitStruct.TIM_Prescaler = 7200 - 1;
	TIM_InitStruct.TIM_Period = 0xFFFF;
	TIM_InitStruct.TIM_CounterMode = TIM_CounterMode_Up;
	
	TIM_TimeBaseInit(TIM2, &TIM_InitStruct);
	TIM_Cmd(TIM2, ENABLE);
}

void delay_us(uint32_t time){
	TIM_SetCounter(TIM2, 0);
	while(TIM_GetCounter(TIM2) < time / 100){}
}

uint8_t SPI_Transfer1Byte(uint8_t data){
	GPIO_ResetBits(GPIOA, SPI1_NSS);
	
	while(SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE) == RESET);
	SPI_I2S_SendData(SPI1, data);
	
	while(SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_RXNE) == RESET);
	uint8_t receivedData = (uint8_t)SPI_I2S_ReceiveData(SPI1);
	
	while(SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_BSY) == SET){}
	GPIO_SetBits(GPIOA, SPI1_NSS);
	return receivedData;
}

uint8_t SPI_MasterTransfer(uint8_t data) {
    // K�o ch�n NSS xu?ng m?c th?p d? b?t d?u truy?n
    GPIO_ResetBits(GPIOA, SPI1_NSS);
		
    // Ch? thanh ghi truy?n (TXE) s?n s�ng
    while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE) == RESET);

    // G?i d? li?u
    SPI_I2S_SendData(SPI1, data);

    // Ch? d? li?u t? Slave du?c nh?n xong
    while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_RXNE) == RESET);

    // �?c d? li?u nh?n du?c
    uint8_t receivedData = (uint8_t)SPI_I2S_ReceiveData(SPI1);

    // Ch? truy?n ho�n t?t (BSY = 0)
    while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_BSY) == SET);

		
    // K�o ch�n NSS l�n m?c cao d? k?t th�c truy?n
    GPIO_SetBits(GPIOA, SPI1_NSS);
		
    return receivedData;
}


uint8_t data;
uint8_t dataSend[] = {1, 2, 3, 4, 5, 6, 7};

uint8_t txBuffer[] = {10, 20, 30, 40, 50};
uint8_t rxBuffer[7];

int main(){
	RCC_Config();
	GPIO_Config();
	TIM_Config();
	SPI_Config();
	while(1){
		for(int i = 0; i < 7; i++){
			rxBuffer[i] = SPI_Transfer1Byte(dataSend[i]);
			delay_us(1000000);
		}
		
		for(int i = 0; i < 7; i++){
				rxBuffer[i] = 0;
		}
	}
}

