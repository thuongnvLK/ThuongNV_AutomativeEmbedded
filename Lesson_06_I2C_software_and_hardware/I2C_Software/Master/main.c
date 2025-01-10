#include "stm32f10x.h"
#include "stm32f10x_rcc.h"
#include "stm32f10x_gpio.h"
#include "stm32f10x_tim.h"
#include "stm32f10x_i2c.h"              // Keil::Device:StdPeriph Drivers:I2C

#define I2C_SCL 	GPIO_Pin_6
#define I2C_SDA		GPIO_Pin_7

#define I2C_GPIO 	GPIOB

#define WRITE_SDA_0 	GPIO_ResetBits(I2C_GPIO, I2C_SDA)
#define WRITE_SDA_1 	GPIO_SetBits(I2C_GPIO, I2C_SDA)
#define WRITE_SCL_0 	GPIO_ResetBits(I2C_GPIO, I2C_SCL)
#define WRITE_SCL_1 	GPIO_SetBits(I2C_GPIO, I2C_SCL)
#define READ_SDA_VAL 	GPIO_ReadInputDataBit(I2C_GPIO, I2C_SDA)

//T(SCL) = 10us, 5us HIGH, 5us LOW

typedef enum{
	NOT_OK = 0,
	OK = 1
} status;

typedef enum{
	NACK = 0,
	ACK = 1
} ACK_Bit;


void delay_us(uint32_t delay)
{
	TIM_SetCounter(TIM2, 0);
 	while (TIM_GetCounter(TIM2) < delay / 100) {
	}
}

void RCC_Config(){
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);
}

void TIM_Config(){
	
	TIM_TimeBaseInitTypeDef TIM_TimBaseInitStructure;
	TIM_TimBaseInitStructure.TIM_CounterMode = TIM_CounterMode_Up;
	TIM_TimBaseInitStructure.TIM_Period = 0xFFFF;
	TIM_TimBaseInitStructure.TIM_Prescaler = 7200 - 1;
	TIM_TimBaseInitStructure.TIM_ClockDivision = TIM_CKD_DIV1;
	
	TIM_TimeBaseInit(TIM2, &TIM_TimBaseInitStructure);
	
	TIM_Cmd(TIM2, ENABLE);
}

void GPIO_Config(){
	GPIO_InitTypeDef GPIO_InitStructure;
	
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_OD;
	GPIO_InitStructure.GPIO_Pin = I2C_SCL | I2C_SDA;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	
	GPIO_Init(I2C_GPIO, &GPIO_InitStructure);
}

void I2C_Config(){
	WRITE_SDA_1;
	delay_us(1);
	WRITE_SCL_1;
	delay_us(1);
}

void I2C_Start(){
	
	WRITE_SCL_1;  	//Set SDA, SCL to 1: ideal status.
	delay_us(3);	
	WRITE_SDA_1;
	delay_us(3);
	
	WRITE_SDA_0;	//SDA reset to 0 before SCL.
	delay_us(3);
	WRITE_SCL_0;
	delay_us(3);
}

void I2C_Stop(){
	
	WRITE_SDA_0;
	delay_us(3);
	WRITE_SCL_1; 	//SCL set to 1 before SDA.
	delay_us(3);
	WRITE_SDA_1;
	delay_us(3);
}

void Clock() {
	WRITE_SCL_1;
	delay_us(5);
	WRITE_SCL_0;
	delay_us(5);
}
status I2C_Write(uint8_t pData){	//Wrrite a byte data, return the status of writing. 
	status stRet;
	for(int i = 0; i< 8; i++){		//Write byte data.
		if (pData & 0x80) {					//0b1000 0000
			WRITE_SDA_1;
		} else {
			WRITE_SDA_0;
		}
		delay_us(3);		//Make sure SDA HIGH complete
		
		//SCL Clock
		Clock();
		
		//Shift 1 bit to the left
		pData <<= 1;
	}
	
	WRITE_SDA_1;					//Set SDA to read ACK from slave.
	delay_us(3);
	WRITE_SCL_1;					//
	delay_us(3);
	
	if (READ_SDA_VAL) {				//Read ACK bit at the 9th clock.
		stRet = NOT_OK;					//If SDA still at High >> NACK>> NOT_OK
	} else {
		stRet = OK;					//else
	}
	
	delay_us(2);
	WRITE_SCL_0;
	delay_us(5);
	
	return stRet;
}

uint8_t I2C_Read(ACK_Bit _ACK){		//Read a byte data frome slave and write a ACK bit at 9th clock;
	uint8_t u8Ret = 0x00;
	
	WRITE_SDA_1;
	delay_us(1);	
	
	for (int i = 0; i < 8; i++) {
		u8Ret <<= 1;
		
		//SCL Clock
		WRITE_SCL_1;
		delay_us(3);
		if (READ_SDA_VAL) {
			u8Ret |= 0x01;
		}
		delay_us(2);
		WRITE_SCL_0;
		delay_us(5);
	}
	
	if (_ACK) {						//Check the ACK to write back.
		WRITE_SDA_0;
	} else {
		WRITE_SDA_1;
	}
	delay_us(1);
	
	//SCL Clock
	WRITE_SCL_1;
	delay_us(5);
	WRITE_SCL_0;
	delay_us(5);
	
	return u8Ret;
}

int main(){
	RCC_Config();
	TIM_Config();
	GPIO_Config();
	I2C_Config();
	
	while(EPROM_Write(0x0045, 0x50 ,10, Data1) == NOT_OK){}	//Default address of eprom is 0x50
	
	while(EPROM_Write(0x0060, 0x50 ,10, Data2) == NOT_OK){}
	
	while(1){
		while(EPROM_Read(0x0045, 0x50 ,10, Rcv) == NOT_OK) {}
		while(EPROM_Read(0x0060, 0x50 ,10, Rcv) == NOT_OK) {}
	}
}