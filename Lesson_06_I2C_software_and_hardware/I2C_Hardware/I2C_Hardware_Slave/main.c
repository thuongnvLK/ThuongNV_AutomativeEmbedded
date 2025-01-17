#include "stm32f10x.h"                  // Device header
#include "stm32f10x_gpio.h"             // GPIO driver
#include "stm32f10x_i2c.h"              // I2C driver

#define SLAVE_ADDR 0x50 // Ð?a ch? 7-bit c?a Slave (0x50)

void I2C_Config(void) {
    GPIO_InitTypeDef GPIO_InitStruct;
    I2C_InitTypeDef I2C_InitStruct;

    // B?t d?ng h? cho GPIOB và I2C1
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C1, ENABLE);

    // C?u hình SCL và SDA (PB6 và PB7) làm chân I2C
    GPIO_InitStruct.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_7;
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AF_OD;  // Open-drain mode cho I2C
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStruct);

    // C?u hình I2C1
    I2C_InitStruct.I2C_Mode = I2C_Mode_I2C;
    I2C_InitStruct.I2C_ClockSpeed = 100000;  // T?c d? I2C 100kHz
    I2C_InitStruct.I2C_DutyCycle = I2C_DutyCycle_2; // Duty cycle 50%
    I2C_InitStruct.I2C_OwnAddress1 = SLAVE_ADDR; // Ð?a ch? c?a slave
    I2C_InitStruct.I2C_AcknowledgedAddress = I2C_AcknowledgedAddress_7bit;
    I2C_InitStruct.I2C_Ack = I2C_Ack_Enable; // B?t ACK

    // Kh?i t?o I2C1
    I2C_Init(I2C1, &I2C_InitStruct);
    I2C_Cmd(I2C1, ENABLE); // B?t I2C1
}
uint8_t receivedData;
void I2C_Slave_ReceiveData(void) {
    

    // Ð?i yêu c?u t? master
    while (!I2C_CheckEvent(I2C1, I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED));

    // Ð?c d? li?u t? master
    while (!I2C_CheckEvent(I2C1, I2C_EVENT_SLAVE_BYTE_RECEIVED)) {
        // Ki?m tra xem có byte nào du?c g?i t? master không
    }

    receivedData = I2C_ReceiveData(I2C1); // Nh?n byte d? li?u t? master

    // (Optional) X? lý d? li?u nh?n du?c t? master
    // Ví d?: Toggle LED ho?c luu d? li?u nh?n du?c vào m?t b? d?m
    if (receivedData == 0x01) {
        // Gi? s? nh?n d? li?u 0x01 s? làm m?t di?u gì dó, nhu b?t LED
    }

    // G?i ACK d? thông báo cho master r?ng d? li?u dã du?c nh?n
    I2C_AcknowledgeConfig(I2C1, ENABLE);
}

void I2C_Slave_SendData(uint8_t data) {
    // G?i d? li?u cho master
    while (!I2C_CheckEvent(I2C1, I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED));

    // Ch? d?n khi master s?n sàng nh?n d? li?u
    while (!I2C_CheckEvent(I2C1, I2C_EVENT_SLAVE_BYTE_TRANSMITTED));

    // G?i byte d? li?u
    I2C_SendData(I2C1, data);

    // G?i ACK d? thông báo cho master r?ng d? li?u dã du?c truy?n
    I2C_AcknowledgeConfig(I2C1, ENABLE);
}

int main(void) {
    // C?u hình I2C cho slave
    I2C_Config();

    while(1) {
        // Ki?m tra xem có yêu c?u t? master
        I2C_Slave_ReceiveData();

        // Sau khi nh?n d? li?u t? master, có th? g?i ph?n h?i n?u c?n
        // I2C_Slave_SendData(0xA5); // G?i d? li?u 0xA5 cho master

        // T?m d?ng m?t chút tru?c khi ti?p t?c
        // for(int i = 0; i < 100000; i++);
				
			// receivedData = 0;
    }
}
