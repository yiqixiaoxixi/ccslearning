#include "stdio.h"
#include "C6747.h"

//Uint16  *SDRAM = (Uint16 *)0xC0000000;            ///外部SDRAM的映射起始地址
int t[120];
Uint8 read_data[4100];
Uint8 src[4100];
void delay(int x)
{
	int i,j;
	for(i=100;i>=0;i--)
		for(j=x;j>=0;j--);
}
void main( void )
{
	/* 初始化6747核*/
    C6747_init();
   	/* 调用SDRAM测试程序*/
    //testallblock();

	/*  KICK0R = 0x83e70b13;  // Kick0 register + data (unlock)
	    KICK1R = 0x95a4f1e0;  // Kick1 register + data (unlock)
	    PINMUX8  = 0x28122111;  // UART2, McASP1, I2C0, I2C1
	    KICK0R = 1;  // Kick0 register + data (unlock)
	    KICK1R = 1;  // Kick1 register + data (unlock)

	    printf( "[Done]\n" );

	    PSC1_lPSC_enable(0, 3);

	    GPIO_DIR45 = 0x00000000;

	    for(;;)
	    {
	    	GPIO_OUT_DATA45 = a^0x08000000;
	    	a=GPIO_OUT_DATA45;
	    	delay(10000);
	    }*/
	//宋俊皓led实验。
    c6747_spi();
    printf("The flashspi_cycle is right");
}

