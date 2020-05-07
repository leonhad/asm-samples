// ConditionCodes.cpp : Este arquivo contém a função 'main'. A execução do programa começa e termina ali.
//

#include <iostream>

extern "C"
{
	int SignedMinA(int a, int b, int c);
	int SignedMaxA(int a, int b, int c);

	int SignedMinB(int a, int b, int c);
	int SignedMaxB(int a, int b, int c);
}

int main()
{
	int a = 345;
	int b = -783;
	int c = 34;

	int min_a = SignedMinA(a, b, c);
	int max_a = SignedMaxA(a, b, c);
	int min_b = SignedMinB(a, b, c);
	int max_b = SignedMaxB(a, b, c);

	printf("SignedMinA(%d, %d, %d) = %d\n", a, b, c, min_a);
	printf("SignedMinB(%d, %d, %d) = %d\n", a, b, c, min_b);
	printf("SignedMaxA(%d, %d, %d) = %d\n", a, b, c, max_a);
	printf("SignedMaxB(%d, %d, %d) = %d\n", a, b, c, max_b);
}
