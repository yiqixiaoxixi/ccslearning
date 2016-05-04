	/*
 * flash.c
 *
 *  Created on: 2015-10-13
 *      Author: dashuai
 */
#include "stdio.h"
#include "C6747.h"

void c6747_spi_init()
{
	Uint32 spidat1;

	SPI_SPIGCR0=0;
	C6747_wait(0xff);
	SPI_SPIGCR0=1;

	SPI_SPIGCR1=0
	    |(0<<24)
	    |(0<<16)
	    |(1<<1)
	    |(1<<0);

//	spidat1=0
//	    |(0<<28)
//	    |(0<<24)
//	    |(2<<16)// CSRN [only CS0 enabled]
//	    |(0<<0);

	spidat1=0
	    |(0<<28)
	    |(0<<24)
	    |(0<<16)// CSRN [only CS0 enabled]
	    |(0<<0);
	SPI_SPIDAT1=spidat1;

	SPI_SPIDEF=0
//	    |(1<<1)
	    |(1<<0);  //define the state of the SPIx_SCS[n] pins when no transmissions are performed.

	SPI_SPIFMT0=0
	    |(0<<20)  //most significant bit is shifted our first
	    |(0<<17)
	    |(1<<16)  //mode 1——数据在第一个SPIx_CLK的上升沿之前的半个周期输出；在SPIx_CLK的上升沿锁存
	    |(3<<8)   //SPIclk=25*30/2/2/4
	    |(8<<0);  //SPI data word length 8bits

	SPI_SPIDELAY=0
	    |(18<<24)
	    |(18<<16);

	SPI_SPIINT=0
	    |(0<<16)
	    |(0<<8)
	    |(0<<6)
	    |(1<<4);//enables interrupt on the error

	SPI_SPILVL=0
	    |(0<<8) //Receive interrupt is mapped to interrupt line INT1 it is 1;(reserved)
	    |(0<<6) //Receive overrun interrupt is mapped to interrupt line INT1 it is 1;(reserved)
	    |(0<<4);//Bit error interrupt is mapped to the interrupt the INT1 if it is 1;(reserved)

	SPI_SPIPC0=0
	    |(1<<11)
	    |(1<<10)
	    |(1<<9)
	    |(0<<8)
	    |(1<<0);

//	SPI_SPIPC1=0
//	    |(1<<11)
//	    |(1<<10)
//	    |(1<<9)
//	    |(0<<8)
//	    |(1<<0);


	SPI_SPIGCR1|=(1<<24);
}

void spiflash_cycle(Uint8 *buf,Uint16 len)//flash读写执行函数
{
    Uint16 i;
    Uint32 spi_data1;

	spi_data1 = SPI_SPIDAT1;
    // empty the receive buffer.
    while (!(SPI_SPIBUF&0x80000000))
    {
       i = SPI_SPIBUF;//move data from SPI_SPIBUF
    }

    spi_data1|=0x10000000;
	for(i=0;i<len;i++)
	{
        while(SPI_SPIBUF&0x20000000);// transmit buffer is empty; TXBUF
                                     // SPIDAT0/SPIDAT1 id ready to accept a new data(实际上是没必要的吧)
//		while(SPI_SPIBUF&0x10000000);// no bit error occurred

		if(i==len-1)
			spi_data1&=~0x10000000;//CSHOLD在传输开始之前，选中1
			//一次传输完成之后,CS线保持active。直到新的带有数据和控制信息的控制字段被加载进SPIDAT1
	        //如果新的chip select和前面的一样，则保持下去。直到带有clear的数据写进来。
		spi_data1&=~0x0000FFFF;
		spi_data1|=buf[i];
		SPI_SPIDAT1=spi_data1;
		while ((SPI_SPIBUF&0x80000000)){}//依然是最之初的问题。为什么一定会有数据传输进来呢?
		buf[i]=(Uint8)SPI_SPIBUF;
	}

}


Uint8 spiflash_status(void)
{
	Uint8 statusbuf[2];
	statusbuf[0]=spiflash_CMD_RDSR;//Read-Status-Register
	statusbuf[1]=0; //查看读取状态字寄存器的时许就会明白，发送0x05之后，才会有数据返回，因此实际上需要的数据是第二个。因此也不得不写入一个无意义数据

	spiflash_cycle(statusbuf,2);
	return statusbuf[1];
}

void c6747_spi_read(Uint8 *recevie,Uint32 add0,Uint32 length)//从flash中读取数据
{
	Uint32 i;
	Uint8 spiflashbuf[4106];//这里会产生问题，因为如果length太大，超过了spiflashbuf的大小的话就会对下面的for循环产生影响，因为超过了空间，不知道是什么数据。超过了Uint8的范围

	spiflashbuf[0]=spiflash_CMD_READ;
	spiflashbuf[1]=(Uint8)(add0>>16);
	spiflashbuf[2]=(Uint8)(add0>>8);
	spiflashbuf[3]=(Uint8)(add0>>0);
	spiflashbuf[4]=0xff;

	spiflash_cycle(spiflashbuf,length+5);

	for(i=0;i<length;i++)
	*(recevie++) = spiflashbuf[i+5];
}


void c6747_spi_write(Uint8 *src0,Uint32 dst0,Uint16 length1)//写一个字节到flash
{
		Uint8 *src;
		Uint32 dst;
		Uint16 i;
		Uint8 spiflashbuf[6];

		dst=dst0;
		src=src0;
		for(i=0;i<length1;i++)//此处之所以更改为length1，是因为和下面length相同，运行时候出现错误。请查询真正原因，和存储方式应当有直接关系
		{
		spiflashbuf[0]=spiflash_CMD_WREN;
		spiflash_cycle(spiflashbuf,1);

		spiflashbuf[0]=spiflash_CMD_WRITE;  //Byte-Program instruction.
                                            //programs the bits in the selected byte to the desired data.
		spiflashbuf[1]=(Uint8)(dst>>16);
		spiflashbuf[2]=(Uint8)(dst>>8);
		spiflashbuf[3]=(Uint8)(dst);
		spiflashbuf[4]=*src++;
		dst++;

		spiflash_cycle(spiflashbuf,5);

		while (spiflash_status()&0x01);
		}
}

void c6747_spi_AAI(Uint8 *src,Uint32 dst,Uint16 length)//地址自动增加连续写flash
{
	Uint8 *srcp;
	Uint8 spiflashbuf[7];
	Uint16 i;

	srcp=src;
	if(length>0)
	{
	spiflashbuf[0]=spiflash_CMD_WREN;//it must be done before any write operation
	spiflash_cycle(spiflashbuf,1);

	spiflashbuf[0]=spiflash_CMD_AAI;
	spiflashbuf[1]=(Uint8)(dst>>16);
	spiflashbuf[2]=(Uint8)(dst>>8);
	spiflashbuf[3]=(Uint8)(dst);
	spiflashbuf[4]=*srcp++;
	spiflashbuf[5]=*srcp++;//two-bytes of data
	spiflash_cycle(spiflashbuf,6);

	while (spiflash_status()&0x01);

	for(i=2;i<length;i=i+2)
	{
		spiflashbuf[0]=spiflash_CMD_AAI;
		spiflashbuf[1]=*srcp++;
		spiflashbuf[2]=*srcp++;
		spiflash_cycle(spiflashbuf,3);
		while (spiflash_status()&0x01);
	}

	spiflashbuf[0]=spiflash_CMD_WRDI;//software mode.请查看数据手册关于其硬件和软件两种模式的问题
	spiflash_cycle(spiflashbuf,1);
	while (spiflash_status()&0x01);
	}
}

void OperationCtr(Uint8 num)
{
	Uint8 statubuf[3];
	statubuf[0]=spiflash_CMD_EWSR;	//Enable-Write-Register
	spiflash_cycle(statubuf,1);

	statubuf[0]=spiflash_CMD_WRSR;//Write-Status-Register
	statubuf[1]=num;
	spiflash_cycle(statubuf,2);
}

void spiflash_eraseSector(Uint32 add)
{
	Uint32 eraseaddr;
	Uint8 spiflashbuf[5];

	eraseaddr=add&spiflash_SECTORMASK;//地址的关系，查看Sectors的大小

	spiflashbuf[0]=spiflash_CMD_WREN;//写使能
	spiflash_cycle(spiflashbuf,1);

	spiflashbuf[0]=spiflash_CMD_ERASESEC;//Sector-Erase
	spiflashbuf[1]=(Uint8)(eraseaddr>>16);
	spiflashbuf[2]=(Uint8)(eraseaddr>>8);
	spiflashbuf[3]=(Uint8)(eraseaddr);//
	spiflash_cycle(spiflashbuf,4);

	while (spiflash_status()&0x01);//no internal Write operation is in progress
}

void c6747_spi(void)
{
	int i;
	c6747_spi_init();
	OperationCtr(0x14);

	for(i=0;i<4096;i++)
	{
		src[i]=11;
	}
	spiflash_eraseSector(0);
	c6747_spi_write(src,3,350);
//	spiflash_eraseSector(0);
	OperationCtr(0x1C);
	c6747_spi_read(read_data,2,500);
//	read_data[1] = spiflash_status();
}


