// AVXFloatingPointArithmetic.cpp : Este arquivo contém a função 'main'. A execução do programa começa e termina ali.
//

#include <iostream>

extern "C" void AVX_fp_Arith(double a, double b, double results[8]);

int main()
{
    const char* inames[8] =
    {
        "vaddsd",
        "vsubsd",
        "vmulsd",
        "vdivsd",
        "vminsd",
        "vmaxsd",
        "vsqrtsd a",
        "fabs b"
    };

    double a = 13.90;
    double b = -78.68;
    double result[8];

    AVX_fp_Arith(a, b, result);

    printf("a: %.6lf\n", a);
    printf("b: %.6lf\n", b);

    for (int i = 0; i < 8; i++)
    {
        printf("%-9s:  %12.6lf\n", inames[i], result[i]);
    }

    return EXIT_SUCCESS;
}
