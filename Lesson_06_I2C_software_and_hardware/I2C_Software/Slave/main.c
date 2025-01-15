#include "stm32f10x.h"

#define I2C_SCL_PIN   GPIO_Pin_5  // SCL: PA5
#define I2C_SDA_PIN   GPIO_Pin_7  // SDA: PA7
#define I2C_GPIO_PORT GPIOA
#define I2C_DELAY()   for (volatile int i = 0; i < 100; i++)  // Delay for clock speed

// Logic states
#define I2C_SCL_HIGH() GPIO_SetBits(I2C_GPIO_PORT, I2C_SCL_PIN)
#define I2C_SCL_LOW()  GPIO_ResetBits(I2C_GPIO_PORT, I2C_SCL_PIN)
#define I2C_SDA_HIGH() GPIO_SetBits(I2C_GPIO_PORT, I2C_SDA_PIN)
#define I2C_SDA_LOW()  GPIO_ResetBits(I2C_GPIO_PORT, I2C_SDA_PIN)

// Read SDA state
#define I2C_SDA_READ() GPIO_ReadInputDataBit(I2C_GPIO_PORT, I2C_SDA_PIN)

// Initialize GPIO for I2C
void I2C_Slave_Init(void) {
    GPIO_InitTypeDef GPIO_InitStruct;

    // Enable GPIO clock
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);

    // Configure SCL and SDA as input pull-up
    GPIO_InitStruct.GPIO_Pin = I2C_SCL_PIN | I2C_SDA_PIN;
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IPU;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(I2C_GPIO_PORT, &GPIO_InitStruct);
}

// Wait for START signal from master
void I2C_Slave_WaitForStart(void) {
    while (I2C_SDA_READ() == 1 || GPIO_ReadInputDataBit(I2C_GPIO_PORT, I2C_SCL_PIN) == 0);
}

// Read one bit from master
uint8_t I2C_Slave_ReadBit(void) {
    uint8_t bit;

    // Wait for SCL to go high
    while (GPIO_ReadInputDataBit(I2C_GPIO_PORT, I2C_SCL_PIN) == 0);

    // Read SDA state
    bit = I2C_SDA_READ();

    // Wait for SCL to go low
    while (GPIO_ReadInputDataBit(I2C_GPIO_PORT, I2C_SCL_PIN) == 1);

    return bit;
}

// Read one byte from master
uint8_t I2C_Slave_ReadByte(void) {
    uint8_t data = 0;

    for (int i = 0; i < 8; i++) {
        data <<= 1;
        data |= I2C_Slave_ReadBit();
    }

    return data;
}

// Send ACK/NACK to master
void I2C_Slave_SendAck(uint8_t ack) {
    GPIO_InitTypeDef GPIO_InitStruct;

    // Configure SDA as output
    GPIO_InitStruct.GPIO_Pin = I2C_SDA_PIN;
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(I2C_GPIO_PORT, &GPIO_InitStruct);

    if (ack) {
        I2C_SDA_LOW();
    } else {
        I2C_SDA_HIGH();
    }

    // Pulse SCL
    I2C_SCL_HIGH();
    I2C_DELAY();
    I2C_SCL_LOW();

    // Configure SDA back to input
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IPU;
    GPIO_Init(I2C_GPIO_PORT, &GPIO_InitStruct);
}
uint8_t received_data;

int main(void) {
    

    // Initialize I2C slave
    I2C_Slave_Init();

    while (1) {
        // Wait for start condition
        I2C_Slave_WaitForStart();

        // Read data from master
        received_data = I2C_Slave_ReadByte();

        // Send ACK back to master
        I2C_Slave_SendAck(1);
				
        // (Optional) Process received data
        // For example, toggle an LED or store data in a buffer
    }
}
