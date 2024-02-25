// ArrayElements.cpp : Este arquivo contém a função 'main'. A execução do programa começa e termina ali.
//

#include <iostream>

using std::cout;

extern "C" int CalcArraySumAsm(int* x, int n);

int CalcArraySumCpp(int* x, int n)
{
	int sum = 0;
	for (int i = 0; i < n; i++)
	{
		sum += *x++;
	}
	return sum;
}

int main()
{
	int x[] =
	{
		1, 3, 4, 5, 10, 8, 45
	};
	int n = sizeof(x) / sizeof(int);

	int ass_sum = CalcArraySumAsm(x, n);
	int cpp_sum = CalcArraySumCpp(x, n);

	cout << "Assembly Sum = " << ass_sum << "\n";
	cout << "C++ Sum = " << cpp_sum << "\n";
}
