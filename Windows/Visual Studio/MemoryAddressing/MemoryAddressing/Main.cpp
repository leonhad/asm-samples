// MemoryAddressing.cpp : Este arquivo contém a função 'main'. A execução do programa começa e termina ali.

#include <iostream>

extern "C" int MemoryAddressing(int i, int* v1, int* v2, int* v3, int* v4);

extern "C" int NumFibVals;

using namespace std;

int main()
{
	int v1 = 0;
	int v2 = 0;
	int v3 = 0;
	int v4 = 0;
	int rv;

	for (int i = 0; i <= NumFibVals; i++)
	{
		rv = MemoryAddressing(i, &v1, &v2, &v3, &v4);

		printf("rv: %2d, v1: %3d, v2: %3d, v3: %3d, v4: %3d\n", rv, v1, v2, v3, v4);
	}

	return EXIT_SUCCESS;
}
