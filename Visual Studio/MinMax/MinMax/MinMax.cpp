// MinMax.cpp : Este arquivo contém a função 'main'. A execução do programa começa e termina ali.
//

#include <iostream>

extern "C" bool CalcMinMax(const float* a, int n, float* min, float* max);

int main()
{
	float a[] =
	{
		20,
		-34,
		56,
		87,
		-90,
		12,
		0,
		-0.0,
		-89
	};
	const int n = sizeof(a) / sizeof(float);

	float min;
	float max;

	CalcMinMax(a, n, &min, &max);

	for (int i = 0; i < n; i++)
	{
		printf("a[%2d] = %8.2f\n", i, a[i]);
	}

	printf("\n");
	printf("Min: %8.2f  Max: %8.2f\n", min, max);

	return EXIT_SUCCESS;
}
