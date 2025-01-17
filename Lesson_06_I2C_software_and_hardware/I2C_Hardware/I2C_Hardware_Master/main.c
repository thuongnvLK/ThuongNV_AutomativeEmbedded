#include "stm32f10x.h"                  // Device header
#include "stm32f10x_gpio.h"             // GPIO driver
#include "stm32f10x_i2c.h"              // I2C driver
#include "stm32f10x_tim.h"              // Device:StdPeriph Drivers:TIM
#include "stm32f10x_rcc.h"              // Device:StdPeriph Drivers:RCC

void I2C_Config(void) {
    GPIO_InitTypeDef GPIO_InitStruct;
    I2C_InitTypeDef I2C_InitStruct;

    // B?t d?ng h? cho GPIOB và I2C1
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C1, ENABLE);

    // C?u hình SCL và SDA (PB6 và PB7) làm chân I2C
    GPIO_InitStruct.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_7;
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AF_OD;  // Open-drain mode for I2C
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStruct);

    // C?u hình I2C1
    I2C_InitStruct.I2C_Mode = I2C_Mode_I2C;
    I2C_InitStruct.I2C_ClockSpeed = 100000;  // T?c d? I2C 100kHz
    I2C_InitStruct.I2C_DutyCycle = I2C_DutyCycle_2; // Duty cycle 50%
    I2C_InitStruct.I2C_OwnAddress1 = 0x00;   // Ð?a ch? c?a master (không dùng)
    I2C_InitStruct.I2C_AcknowledgedAddress = I2C_AcknowledgedAddress_7bit;
    I2C_InitStruct.I2C_Ack = I2C_Ack_Enable; // B?t ACK

    // Kh?i t?o I2C1
    I2C_Init(I2C1, &I2C_InitStruct);
    I2C_Cmd(I2C1, ENABLE); // B?t I2C1
}

void I2C_Master_Write(uint8_t deviceAddress, uint8_t data) {
    // Ð?i I2C s?n sàng
    while(I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY));

    // G?i start condition
    I2C_GenerateSTART(I2C1, ENABLE);
    while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT)); // Ch? START

    // G?i d?a ch? slave và ch? d? ghi
    I2C_Send7bitAddress(I2C1, deviceAddress, I2C_Direction_Transmitter);
    while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)); // Ch? d?a ch? ACK

    // G?i d? li?u
    I2C_SendData(I2C1, data);
    while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED)); // Ch? byte du?c truy?n

    // G?i stop condition
    I2C_GenerateSTOP(I2C1, ENABLE);
    while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF)); // Ch? STOP
}

uint8_t I2C_Master_Read(uint8_t deviceAddress) {
    uint8_t receivedData;

    // Ð?i I2C s?n sàng
    while(I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY));

    // G?i start condition
    I2C_GenerateSTART(I2C1, ENABLE);
    while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT)); // Ch? START

    // G?i d?a ch? slave và ch? d? d?c
    I2C_Send7bitAddress(I2C1, deviceAddress, I2C_Direction_Receiver);
    while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED)); // Ch? d?a ch? ACK

    // Ð?c d? li?u
    while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)); // Ch? byte nh?n
    receivedData = I2C_ReceiveData(I2C1);

    // G?i stop condition
    I2C_GenerateSTOP(I2C1, ENABLE);
    while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF)); // Ch? STOP

    return receivedData;
}

void TIM_Config() {
		RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);
    TIM_TimeBaseInitTypeDef TIM_InitStruct;
    TIM_InitStruct.TIM_ClockDivision = TIM_CKD_DIV1;  // 72MHz
    TIM_InitStruct.TIM_CounterMode = TIM_CounterMode_Up;
    TIM_InitStruct.TIM_Period = 0xFFFF;
    TIM_InitStruct.TIM_Prescaler = 7200 - 1;  // 0.1ms/count
    TIM_TimeBaseInit(TIM2, &TIM_InitStruct);
    TIM_Cmd(TIM2, ENABLE);
}

void I2C_DELAY(uint32_t time) {
    TIM_SetCounter(TIM2, 0);
    while (TIM_GetCounter(TIM2) < time / 100) {}
}

uint8_t receivedData;
int main(void) {
    uint8_t dataToSend = 0x55; // D? li?u c?n g?i
    

    // C?u hình I2C
    I2C_Config();
		TIM_Config();
    while(1) {
        // G?i d? li?u d?n slave có d?a ch? 0x50
        I2C_Master_Write(0x50, dataToSend);

        // Ð?c d? li?u t? slave có d?a ch? 0x50
        // receivedData = I2C_Master_Read(0x50);

        // (Th?c hi?n m?t s? hành d?ng v?i d? li?u dã nh?n n?u c?n)

        // T?m d?ng m?t chút
        I2C_DELAY(3000000);
			
				I2C_Master_Write(0x50, 0x22);
			
				I2C_DELAY(3000000);
    }
}
