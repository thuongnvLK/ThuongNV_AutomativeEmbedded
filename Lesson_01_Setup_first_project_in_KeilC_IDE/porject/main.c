//#define RCC_APB2ENR   *((unsigned int *)0x40021018)
//#define GPIO_CRH      *((unsigned int *)0x40011004)
//#define GPIO_ODR      *((unsigned int *)0x4001100C)

#define 	RCC_BASEADDR		0x40021000
#define 	GPIOC_BASEADDR	0x40011000
#define 	GPIOA_BASEADDR	0x40010800

typedef struct
{
  unsigned int CRL;
  unsigned int CRH;
  unsigned int IDR;
  unsigned int ODR;
  unsigned int BSRR;
  unsigned int BRR;
  unsigned int LCKR;
} GPIO_RegDef_t;
#define	GPIOC			((GPIO_RegDef_t *)GPIOC_BASEADDR)
#define	GPIOA			((GPIO_RegDef_t *)GPIOA_BASEADDR)

typedef struct
{
  unsigned int CR;
  unsigned int CFGR;
  unsigned int CIR;
  unsigned int APB2RSTR;
  unsigned int APB1RSTR;
  unsigned int AHBENR;
  unsigned int APB2ENR;
  unsigned int APB1ENR;
  unsigned int BDCR;
  unsigned int CSR;
} RCC_RegDef_t;
#define	RCC			((RCC_RegDef_t *)RCC_BASEADDR)

void delay( unsigned int  timedelay	)  {
  for (unsigned int i = 0; i < timedelay; i++) {
		
	}
}

int main(){
	
	RCC->APB2ENR|= (1 << 4);	
	GPIOC->CRH |= (3 << 20);		
	GPIOC->CRH &= ~(3 << 22);
	
	while(1){
		GPIOC->ODR |= (1 << 13);
		delay(1000000);
		GPIOC->ODR &= ~(1 << 13);
		delay(1000000);
	}
}