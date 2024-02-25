// StringCharacterCount.cpp : Este arquivo contém a função 'main'. A execução do programa começa e termina ali.
//

#include <iostream>

extern "C" int CountChar(wchar_t *s, wchar_t c);

int main()
{
	wchar_t c = L'e';
	wchar_t* s = (wchar_t*)L"Hello, assembly is awesome";

	wprintf(L"\n test string: %s\n", s);
	wprintf(L"Search Character: %c Count: %d\n", c, CountChar(s, c));

	return EXIT_SUCCESS;
}
