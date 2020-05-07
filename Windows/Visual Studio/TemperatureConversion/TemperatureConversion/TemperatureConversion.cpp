// TemperatureConversion.cpp : Este arquivo contém a função 'main'. A execução do programa começa e termina ali.
//

#include <iostream>

extern "C"
{
	double FtoC(double deg_f);
	double CtoF(double deg_c);
}

int main()
{
	double cel_temp = 32.0;
	double f_temp = 89.6;

	printf("Celcius value    %10.4lf  Fahrenheit: %10.4lf\n", cel_temp, CtoF(cel_temp));
	printf("Fahrenheit value %10.4lf  Celcius:    %10.4lf\n", f_temp, FtoC(f_temp));

	return EXIT_SUCCESS;
}
