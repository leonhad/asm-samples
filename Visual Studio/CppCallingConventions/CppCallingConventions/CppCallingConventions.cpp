#include <iostream>

using namespace std;

extern "C" void CalculateSum(int a, int b, int c, int* s1, int* s2, int* s3);

int main()
{
	int a = 2;
	int b = 3;
	int c = 4;
	int s1;
	int s2;
	int s3;

	CalculateSum(a, b, c, &s1, &s2, &s3);

	cout << "Inputs a: " << a << " b: " << b << " c: " << c << endl;
	cout << "Outputs s1: " << s1 << " s2: " << s2 << " s3: " << s3 << endl;
}
