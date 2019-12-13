// SSEfpArithmetic.cpp : Este arquivo contém a função 'main'. A execução do programa começa e termina ali.
//

#include <iostream>

extern "C" void SseArithmeticOperationsFloat(float a, float b, float c[8]);
extern "C" void SseArithmeticOperationsDouble(double a, double b, double c[8]);

void SseSinglePrecisionTest()
{
    float a = 2.5f;
    float b = -7.56;
    float c[8];

    SseArithmeticOperationsFloat(a, b, c);
    printf("\nResults of Single Precision\n");

    printf("a:        %.6f\n", a);
    printf("b:        %.6f\n", b);
    printf("add:      %.6f\n", c[0]);
    printf("sub:      %.6f\n", c[1]);
    printf("mul:      %.6f\n", c[2]);
    printf("div:      %.6f\n", c[3]);
    printf("min:      %.6f\n", c[4]);
    printf("max:      %.6f\n", c[5]);
    printf("fabs(b):  %.6f\n", c[6]);
    printf("sqrt(b):  %.6f\n", c[7]);    
}

void SseDoublePrecisionTest()
{
    double a = 3.1415926535897932384626433832795;
    double b = 2.7182818284590452353602874713527;
    double c[8];

    SseArithmeticOperationsDouble(a, b, c);
    printf("\nResults of Double Precision\n");

    printf("a:        %.14f\n", a);
    printf("b:        %.14f\n", b);
    printf("add:      %.14f\n", c[0]);
    printf("sub:      %.14f\n", c[1]);
    printf("mul:      %.14f\n", c[2]);
    printf("div:      %.14f\n", c[3]);
    printf("min:      %.14f\n", c[4]);
    printf("max:      %.14f\n", c[5]);
    printf("fabs(b):  %.14f\n", c[6]);
    printf("sqrt(b):  %.14f\n", c[7]);
}

int main()
{
    SseSinglePrecisionTest();
    SseDoublePrecisionTest();

    return EXIT_SUCCESS;
}
