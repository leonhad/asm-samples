#include <iostream>

using namespace std;

extern "C" void Reverser(int* y, int* x, int n);

int main()
{
	const int n = 10;
	int x[n];
	int y[n];

	for (int i = 0; i < n; i++)
	{
		x[i] = i;
	}

	Reverser(y, x, 10);

	cout << "Array Reverser:" << endl;
	for (int i = 0; i < n; i++)
	{
		printf("i: %5d  y: %5d x%5d\n", i, y[i], x[i]);
	}
}
