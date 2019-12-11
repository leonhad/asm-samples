// MmxAddition.cpp : Este arquivo contém a função 'main'. A execução do programa começa e termina ali.
//

#include <iostream>
#include "MmxVal.h"

void MmxAddBytes()
{
	MmxVal a;
	MmxVal b;
	MmxVal c;
	char buff[256];

	// Packed byte addition - signed integers
	a.i8[0] = 50;
	b.i8[0] = 30;

	a.i8[1] = 80;
	b.i8[1] = 64;

	a.i8[2] = -27;
	b.i8[2] = -32;

	a.i8[3] = -70;
	b.i8[3] = -80;

	a.i8[4] = -42;
	b.i8[4] = 90;

	a.i8[5] = 60;
	b.i8[5] = -85;

	a.i8[6] = 64;
	b.i8[6] = 90;

	a.i8[7] = 100;
	b.i8[7] = -30;

	printf("\n\n Packed byte addition - signed integers\n");
	printf("a: %s\n", a.ToString_i8(buff, sizeof(buff)));
	printf("b: %s\n", b.ToString_i8(buff, sizeof(buff)));

	c = MmxAdd(a, b, MmxAddOp::paddsb);

	printf("\n paddsb results\n");
	printf("c: %s\n", c.ToString_i8(buff, sizeof(buff)));

	c = MmxAdd(a, b, MmxAddOp::paddb);

	printf("\n paddb results\n");
	printf("c: %s\n", c.ToString_i8(buff, sizeof(buff)));

	// Packed byte addition - unsigned integers
	a.i8[0] = 50;
	b.i8[0] = 30;

	a.i8[1] = 80;
	b.i8[1] = 64;

	a.i8[2] = 132;
	b.i8[2] = 130;

	a.i8[3] = 200;
	b.i8[3] = 90;

	a.i8[4] = 42;
	b.i8[4] = 90;

	a.i8[5] = 60;
	b.i8[5] = 85;

	a.i8[6] = 140;
	b.i8[6] = 160;

	a.i8[7] = 10;
	b.i8[7] = 14;

	printf("\n\n Packed byte addition - unsigned integers\n");
	printf("a: %s\n", a.ToString_u8(buff, sizeof(buff)));
	printf("b: %s\n", b.ToString_u8(buff, sizeof(buff)));

	c = MmxAdd(a, b, MmxAddOp::paddusb);

	printf("\n paddusb results\n");
	printf("c: %s\n", c.ToString_u8(buff, sizeof(buff)));

	c = MmxAdd(a, b, MmxAddOp::paddb);

	printf("\n paddb results\n");
	printf("c: %s\n", c.ToString_u8(buff, sizeof(buff)));
}

void MmxAddWords()
{
	MmxVal a;
	MmxVal b;
	MmxVal c;
	char buff[356];

	// Packed word addition - signed integers
	a.i16[0] = 500;
	b.i16[0] = 830;

	a.i16[1] = 30000;
	b.i16[1] = 5000;

	a.i16[2] = -270;
	b.i16[2] = -320;

	a.i16[3] = -7000;
	b.i16[3] = -32000;

	printf("\n\n Packed word addition - signed integers\n");
	printf("a: %s\n", a.ToString_i16(buff, sizeof(buff)));
	printf("b: %s\n", b.ToString_i16(buff, sizeof(buff)));

	c = MmxAdd(a, b, MmxAddOp::paddw);

	printf("\n paddw results\n");
	printf("c: %s\n", c.ToString_i16(buff, sizeof(buff)));

	c = MmxAdd(a, b, MmxAddOp::paddsw);

	printf("\n paddsw results\n");
	printf("c: %s\n", c.ToString_i16(buff, sizeof(buff)));

	// Packed word addition - unsigned integers
	a.i16[0] = 500;
	b.i16[0] = 30;

	a.i16[1] = 48000;
	b.i16[1] = 20000;

	a.i16[2] = 132;
	b.i16[2] = 130;

	a.i16[3] = 10000;
	b.i16[3] = 60000;

	printf("\n\n Packed word addition - unsigned integers\n");
	printf("a: %s\n", a.ToString_u16(buff, sizeof(buff)));
	printf("b: %s\n", b.ToString_u16(buff, sizeof(buff)));

	c = MmxAdd(a, b, MmxAddOp::paddusw);

	printf("\n paddusw results\n");
	printf("c: %s\n", c.ToString_u16(buff, sizeof(buff)));

	c = MmxAdd(a, b, MmxAddOp::paddusw);

	printf("\n paddusw results\n");
	printf("c: %s\n", c.ToString_u16(buff, sizeof(buff)));
}

int main()
{
	MmxAddBytes();
	MmxAddWords();

	return EXIT_SUCCESS;
}
