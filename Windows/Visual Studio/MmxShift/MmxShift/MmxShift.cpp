// MmxShift.cpp : Este arquivo contém a função 'main'. A execução do programa começa e termina ali.
//

#include <iostream>
#include "MmxVal.h"

void MmxShiftWords()
{
    MmxVal a;
    MmxVal b;
    int count;
    char buff[256];

    a.u16[0] = 0x1234;
    a.u16[1] = 0xFF00;
    a.u16[2] = 0x00CC;
    a.u16[3] = 0x8000;
    count = 2;

    MmxShifter(a, MmxShiftOp::psllw, count, &b);

    printf("\nResult for psllw - count = %d\n", count);
    printf("a: %s\n", a.ToString_x16(buff, sizeof(buff)));
    printf("b: %s\n", b.ToString_x16(buff, sizeof(buff)));

    MmxShifter(a, MmxShiftOp::psrlw, count, &b);

    printf("\nResult for psrlw - count = %d\n", count);
    printf("a: %s\n", a.ToString_x16(buff, sizeof(buff)));
    printf("b: %s\n", b.ToString_x16(buff, sizeof(buff)));

    MmxShifter(a, MmxShiftOp::psraw, count, &b);

    printf("\nResult for psraw - count = %d\n", count);
    printf("a: %s\n", a.ToString_x16(buff, sizeof(buff)));
    printf("b: %s\n", b.ToString_x16(buff, sizeof(buff)));
}

void MmxShiftDWords()
{
    MmxVal a;
    MmxVal b;
    int count;
    char buff[256];

    a.u32[0] = 0x00010001;
    a.u32[1] = 0x80008000;
    count = 3;

    MmxShifter(a, MmxShiftOp::pslld, count, &b);

    printf("\nResult for pslld - count = %d\n", count);
    printf("a: %s\n", a.ToString_x32(buff, sizeof(buff)));
    printf("b: %s\n", b.ToString_x32(buff, sizeof(buff)));

    MmxShifter(a, MmxShiftOp::psrld, count, &b);

    printf("\nResult for psrld - count = %d\n", count);
    printf("a: %s\n", a.ToString_x32(buff, sizeof(buff)));
    printf("b: %s\n", b.ToString_x32(buff, sizeof(buff)));

    MmxShifter(a, MmxShiftOp::psrad, count, &b);

    printf("\nResult for psrad - count = %d\n", count);
    printf("a: %s\n", a.ToString_x32(buff, sizeof(buff)));
    printf("b: %s\n", b.ToString_x32(buff, sizeof(buff)));
}

int main()
{
    //MmxShiftWords();
    MmxShiftDWords();

    return EXIT_SUCCESS;
}
