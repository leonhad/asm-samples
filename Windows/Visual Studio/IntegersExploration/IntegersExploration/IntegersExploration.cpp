// IntegersExploration.cpp : Este arquivo contém a função 'main'. A execução do programa começa e termina ali.
//

#include <iostream>

using namespace std;

extern "C" {
	char GlChar = 0;
	short GlShort = 20;
	int GlInt = 30;
	long long GLongLong = 1;

	void IntegerAddition(char a, short b, int c, long long d);
}

int main()
{
	IntegerAddition(3, 5, -37, 11);

	printf("Char value %d\n", GlChar);
	printf("Short value %d\n", GlShort);
	printf("Int value %d\n", GlInt);
	printf("Long long value %lld\n", GLongLong);

	return EXIT_SUCCESS;
}
