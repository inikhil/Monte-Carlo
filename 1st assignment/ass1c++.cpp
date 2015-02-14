#include<cmath>
#include<iostream>

using namespace std;
double func(double x)
{
	return 3*x*x-exp(x);
}
double diff(double x)
{
	return 6*x-exp(x);
}
int main()
{
	double x0,x1;
	cout<<"the given x0 is : ";
	cin>>x0;

	while(1)
	{
		x1=x0-(func(x0)/diff(x0));
		if(abs(x1-x0) < 0.00001)
		{
			 break;
		}
			x0=x1;
	}
cout<<x1;
return 0;
}
