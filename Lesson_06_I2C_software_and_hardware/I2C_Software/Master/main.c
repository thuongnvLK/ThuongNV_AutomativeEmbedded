#include "stm32f10x.h"

#define I2C_SCL_PIN   GPIO_Pin_5  // SCL: PA5
#define I2C_SDA_PIN   GPIO_Pin_7  // SDA: PA7
#define I2C_GPIO_PORT GPIOA
#define I2C_DELAY()   for (volatile int i = 0; i < 100; i++)  // Ð? tr? cho t?c d? xung

// Ð?nh nghia tr?ng thái logic
#define I2C_SCL_HIGH() GPIO_SetBits(I2C_GPIO_PORT, I2C_SCL_PIN)
#define I2C_SCL_LOW()  GPIO_ResetBits(I2C_GPIO_PORT, I2C_SCL_PIN)
#define I2C_SDA_HIGH() GPIO_SetBits(I2C_GPIO_PORT, I2C_SDA_PIN)
#define I2C_SDA_LOW()  GPIO_ResetBits(I2C_GPIO_PORT, I2C_SDA_PIN)

// Ð?c tr?ng thái SDA
#define I2C_SDA_READ() GPIO_ReadInputDataBit(I2C_GPIO_PORT, I2C_SDA_PIN)

// Kh?i t?o GPIO
void I2C_Init(void) {
    GPIO_InitTypeDef GPIO_InitStruct;

    // B?t clock cho GPIO
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);

    // C?u hình SCL và SDA làm d?u ra Open-Drain
    GPIO_InitStruct.GPIO_Pin = I2C_SCL_PIN | I2C_SDA_PIN;
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_Out_OD;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(I2C_GPIO_PORT, &GPIO_InitStruct);

    // Ð?t SCL và SDA ? tr?ng thái HIGH
    I2C_SCL_HIGH();
    I2C_SDA_HIGH();
}

// T?o tín hi?u START
void I2C_Start(void) {
    I2C_SDA_HIGH();
    I2C_SCL_HIGH();
    I2C_DELAY();
    I2C_SDA_LOW();  // SDA xu?ng LOW khi SCL ? HIGH
    I2C_DELAY();
    I2C_SCL_LOW();  // Gi? SCL LOW d? b?t d?u truy?n
}

// T?o tín hi?u STOP
void I2C_Stop(void) {
    I2C_SDA_LOW();
    I2C_SCL_HIGH();
    I2C_DELAY();
    I2C_SDA_HIGH();  // SDA lên HIGH khi SCL ? HIGH
    I2C_DELAY();
}

// G?i 1 bit d? li?u
void I2C_WriteBit(uint8_t bit) {
    if (bit) {
        I2C_SDA_HIGH();
    } else {
        I2C_SDA_LOW();
    }
    I2C_DELAY();
    I2C_SCL_HIGH();  // Xung clock
    I2C_DELAY();
    I2C_SCL_LOW();
    I2C_DELAY();
}

// Ð?c 1 bit d? li?u
uint8_t I2C_ReadBit(void) {
    uint8_t bit;

    I2C_SDA_HIGH();  // Ð?t SDA làm d?u vào
    I2C_DELAY();
    I2C_SCL_HIGH();
    I2C_DELAY();
    bit = I2C_SDA_READ();
    I2C_SCL_LOW();
    return bit;
}

// G?i 1 byte d? li?u
void I2C_WriteByte(uint8_t byte) {
    for (int i = 0; i < 8; i++) {
        I2C_WriteBit((byte & 0x80) != 0);  // G?i bit cao nh?t
        byte <<= 1;                        // D?ch trái d? g?i bit ti?p theo
    }
    I2C_ReadBit();  // Ð?c ACK t? slave
}

// Ð?c 1 byte d? li?u
uint8_t I2C_ReadByte(uint8_t ack) {
    uint8_t byte = 0;
    for (int i = 0; i < 8; i++) {
        byte = (byte << 1) | I2C_ReadBit();  // Ð?c t?ng bit và ghép thành byte
    }
    I2C_WriteBit(ack);  // G?i ACK ho?c NAK
    return byte;
}

// G?i d? li?u d?n slave
void I2C_SendData(uint8_t slaveAddr, uint8_t* data, uint8_t len) {
    I2C_Start();
    I2C_WriteByte(slaveAddr << 1);  // G?i d?a ch? slave + bit ghi (0)
    for (uint8_t i = 0; i < len; i++) {
        I2C_WriteByte(data[i]);  // G?i t?ng byte
    }
    I2C_Stop();
}

// Nh?n d? li?u t? slave
void I2C_ReceiveData(uint8_t slaveAddr, uint8_t* buffer, uint8_t len) {
    I2C_Start();
    I2C_WriteByte((slaveAddr << 1) | 1);  // G?i d?a ch? slave + bit d?c (1)
    for (uint8_t i = 0; i < len; i++) {
        buffer[i] = I2C_ReadByte(i < (len - 1));  // G?i ACK cho byte tr? byte cu?i
    }
    I2C_Stop();
}

 uint8_t receivedData[3];

// Hàm chính
int main(void) {
    uint8_t dataToSend[] = {0x01, 0x02, 0x03};
   

    SystemInit();  // Kh?i t?o h? th?ng
    I2C_Init();    // Kh?i t?o I2C

    while (1) {
        // G?i d? li?u d?n slave (d?a ch? 0x50)
        I2C_SendData(0x50, dataToSend, 1);

        // Nh?n d? li?u t? slave
        I2C_ReceiveData(0x50, receivedData, 1);
    }
}
