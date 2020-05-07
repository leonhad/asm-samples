// Statistics.cpp : Este arquivo contém a função 'main'. A execução do programa começa e termina ali.
//

#include <iostream>

extern "C" bool CalcMEanStdevASM(const double* a, int n, double* mean, double* stdev);

bool CalcMEanStdevCPP(const double* a, int n, double* mean, double* stdev)
{
	if (n <= 1)
	{
		return false;
	}

	double sum = 0.0;

	for (int i = 0; i < n; i++)
	{
		sum += a[i];
	}

	*mean = sum / n;

	sum = 0.0;
	for (int i = 0; i < n; i++)
	{
		double temp = a[i] - *mean;
		sum += temp * temp;
	}

	*stdev = sqrt(sum / (n - 1));
	return true;
}

int main()
{
	double a[] =
	{
		2,
		5,
		6,
		7,
		12,
		45,
		67,
		12,
		9,
		0,
		1,
		3,
		21
	};
	const int n = sizeof(a) / sizeof(double);

	double mean_asm;
	double mean_cpp;
	double stdev_asm;
	double stdev_cpp;

	CalcMEanStdevASM(a, n, &mean_asm, &stdev_asm);
	CalcMEanStdevCPP(a, n, &mean_cpp, &stdev_cpp);

	for (int i = 0; i < n; i++)
	{
		printf("a[%d] = %g\n", i, a[i]);
	}

	printf("\n");
	printf("Assembly Mean: %g Stdev: %g\n", mean_asm, stdev_asm);
	printf("CPP      Mean: %g Stdev: %g\n", mean_cpp, stdev_cpp);

	return EXIT_SUCCESS;
}
