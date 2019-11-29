// ArrayElementSquares.cpp : Este arquivo contém a função 'main'. A execução do programa começa e termina ali.
//

#include <iostream>

extern "C" int CalcArraySquaresAsm(int* y, int* x, int n);

int CalcArraySquaresCpp(int* y, int* x, int n)
{
	int sum = 0;

	for (int i = 0; i < n; i++)
	{
		y[i] = x[i] * x[i];
		sum += y[i];
	}

	return sum;
}

int main()
{
	int x[] =
	{
		2, 3, 4, 5, 6, 7, 8, 9
	};

	const int n = sizeof(x) / sizeof(int);

	int y1[n];
	int y2[n];

	int asm_sum = CalcArraySquaresAsm(y2, x, n);
	int cpp_sum = CalcArraySquaresCpp(y1, x, n);

	for (int i = 0; i < n; i++)
	{
		printf("i: %2d  x: %4d  y1: %4d  y2: %4d\n\n", i, x[i], y1[i], y2[i]);
		printf("Assembly sum: %d\n", asm_sum);
		printf("C++ sum: %d\n", cpp_sum);
	}

	return EXIT_SUCCESS;
}
