#include <iostream>

using namespace std;

extern "C" int IntegerMulDiv(int a, int b, int* prod, int* quo, int* rem);

int main()
{
	int a = 21;
	int b = 9;
	int prod = 0;
	int quo = 0;
	int rem = 0;
	int rv;

	rv = IntegerMulDiv(a, b, &prod, &quo, &rem);

	cout << "Input a: " << a << " b: " << b << endl;
	cout << "Output rv: " << rv << " prod: " << prod << " quo: " << quo << " rem: " << rem << endl;
	cout << rv << endl;

	return EXIT_SUCCESS;
}
