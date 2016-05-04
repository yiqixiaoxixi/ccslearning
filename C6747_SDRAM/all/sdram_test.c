#include "stdio.h"
#include "C6747.h"

void testallblock(void)
{
    Uint32 i;
	Uint32 temp;
    Uint32 *SDRAM_StartAdd;
	Uint32 *temp_add;
    Uint32 Length=96;
    SDRAM_StartAdd = (Uint32 *)0xc0000000;

  	for(i=0;i<Length;i++)
	{
		temp_add = SDRAM_StartAdd+i;
		*(temp_add) = 0;
	}

	for(i=0;i<Length;i++)
	{
		temp = *(SDRAM_StartAdd+i);
		if(temp != 0x00000000)
		{
			temp = *(SDRAM_StartAdd+i);
			printf("\nWhen writing 0x00000000, Address 0x%x is error!",i);
			SW_BREAKPOINT;
		}
	}
	printf("\nWriting 0x00000000 is ok.");

	for(i=0;i<Length;i++)
	{
		*(SDRAM_StartAdd+i) = 0xffff;

	}
	for(i=0;i<Length;i++)
	{
		if(*(SDRAM_StartAdd+i) != 0xffff)
		{
			printf("\nWhen writing 0xffff, Address 0x%x is error!",i);
			SW_BREAKPOINT;
		}
	}
	printf("\nWriting 0xffff is ok.");

	for(i=0;i<Length;i++)
	{
		*(SDRAM_StartAdd+i) = 0xAAAA;
	}
	for(i=0;i<Length;i++)
	{
		if(*(SDRAM_StartAdd+i) != 0xAAAA)
		{
			printf("\nWhen writing 0xAAAA, Address 0x%x is error!",i);
			SW_BREAKPOINT;
		}
	}
	printf("\nWriting 0xAAAA is ok.");

	for(i=0;i<Length;i++)
	{
		*(SDRAM_StartAdd+i) = 0x5555;
	}
	delay(10);
	for(i=0;i<Length;i++)
	{
		if(*(SDRAM_StartAdd+i) != 0x5555)
		{

			printf("\nWhen writing 0x5555, Address 0x%x is error!",i);
		}
	}
	printf("\nWriting 0x5555 is ok.");

	for(i=0;i<Length;i++)
	{

	//	*(SDRAM_StartAdd+i) = i;
		temp_add = SDRAM_StartAdd+i;
		*(temp_add) = i;
	}
	i=0;
	for(i=0;i<Length;i++)
	{
		if(*(SDRAM_StartAdd+i) != i)
		{
			printf("\nWhen writing sequence data, Address 0x%x is error!",i);
			SW_BREAKPOINT;
		}
	}

    printf("\nTesting is success.");
}

