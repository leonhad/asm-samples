// CalculateSum.cpp : Este arquivo contém a função 'main'. A execução do programa começa e termina ali.
//

#include <iostream>

using namespace std;

extern "C" int AdderASM(int a, int b, int c);

int AdderCPP(int a, int b, int c)
{
	return a + b + c;
}

int main()
{
	cout << AdderASM(10, 20, 30) << endl;

	return 0;
}
