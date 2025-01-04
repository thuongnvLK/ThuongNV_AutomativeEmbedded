#define RCC_APB2ENR   *((unsigned int *)0x40021018)
#define GPIO_CRH      *((unsigned int *)0x40011004)
#define GPIO_ODR      *((unsigned int *)0x4001100C)

void delay( unsigned int  timedelay	)  {
  for (unsigned int i = 0; i < timedelay; i++) {
		
	}
}

int main(){
	RCC_APB2ENR |= (1 << 4);
  GPIO_CRH |= (3 << 20);
  GPIO_CRH &= ~(3 << 22);
  while(1){
		GPIO_ODR |= (1 << 13);
    delay(1000000);
    GPIO_ODR &= ~(1 << 13);
    delay(1000000);
  }
}