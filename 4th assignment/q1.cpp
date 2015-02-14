#include<iostream>
#include<cmath>
#include<fstream>
using namespace std;
long double y[5000];
void mean()//Function used for calculating mean
{
    double mean=0;
    int i;
    for(i=0;i<5000;i++)
    {
        mean=mean+y[i];
    }
    mean=mean/5000;
    cout<<mean<<endl;
}
void max()//function used for calculating maximum value
{
    double t;
    int i;
    for(i=0;i<5000;i++)
    {
        if(y[i]>y[i+1])
        {
            t=y[i+1];
            y[i+1]=y[i];
            y[i]=t;
        }

    }
    cout<<y[5000]<<endl;
}
void min()//function used for calculating maximum value
{
    int i;
    double t;
    for(i=0;i<5000;i++)
    {
        if(y[i]<y[i+1])
        {
            t=y[i+1];
            y[i+1]=y[i];
            y[i]=t;
        }

    }
    cout<<y[5000]<<endl;

}
int main()
{
    long long int x[5001];
    long double u[5000];
    ofstream myfile;
    myfile.open("q1.txt");
    double d,e;
    int i;
    long long int a=16807,m=2147483648,mi=5,c;
    x[0]=7437;
    for(i=1;i<5001;i++)
    {

        c=a*x[i-1];
        x[i]=(long long int)c%m;
        //cout<<x[i]<<" ";
        u[i-1]=(long double)x[i-1]/m;
        //cout<<u[i-1]<<" ";
        d=log(1-u[i-1]);
        //cout<<d<<" ";
        y[i-1]=mi*d*(-1);
        cout<<y[i-1]<<" ";
        myfile<<y[i-1]<<endl;//printing in file for plotting
    }
    cout<<endl;
    mean();
    max();
    min();

    return 0;
/*plotting in gnu:
reset
n=5000
width=0.08
hist(x,width)=width*floor(x/width)+width/2.0
set output "histogram.png"
set xrange [0:7]
set yrange [0:200]
set offset graph 0.05,0.05,0.05,0.0
set boxwidth width*0.9
set style fill solid 0.2
set tics out nomirror
set xlabel "x"
set ylabel "Frequency"
plot "q1.txt" u (hist($1,width)):(1.0) smooth freq w boxes lc rgb"green" notitle
*/
}
