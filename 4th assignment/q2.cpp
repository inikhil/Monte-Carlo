#include<iostream>
#include<cmath>
#include<cstdlib>
#include<fstream>
using namespace std;
long long int *p;
long double *q;
long double *r;
ofstream myfile;
long double *s,*u,*v,*w,*g,*z;
long double *t;

long double* generate()//function used for generating values
{
    long long int a,m,x;
    int i;
    cout<<"Input your value of a,m and x0: "<<endl;
    cin>>a>>m>>x;
    p[0]=x;
    for (i=1;i<5001;i++)
    {
        p[i]=(p[i-1]*a)%m;
        //cout <<p[i]<<" ";
        q[i-1]=(long double)p[i-1]/m;
        q[i-1]=(1-q[i-1]);
    }
    return q;
}

long double* expo()//function used for generating exponential values
{
    int i;
    for(i=0;i<5000;i++)
    {
       r[i]=(-1)*(0.2)*log(z[i]);
       //cout<<r[i]<<" ";
    }
    return r;
}
long double* gamma()//function used for gamma distribution
{
    int i;
    for(i=0;i<5000;i++)
    {
        g[i]=g[i]+s[i];
    }
    return(g);
}
void mean()//function for mean
{
    double mean=0;
    int i;
    for(i=0;i<5000;i++)
    {
        mean=mean+g[i];
    }
    mean=mean/5000;
    cout<<mean<<endl;
}
void max()//function for maximum
{
    double t;
    int i;
    for(i=0;i<5000;i++)
    {
        if(g[i]>g[i+1])
        {
            t=g[i+1];
            g[i+1]=g[i];
            g[i]=t;
        }

    }
    cout<<g[4999]<<endl;
}
void min()//function for minimum
{
    double t;
    int i;
    for(i=0;i<5000;i++)
    {
        if(g[i]<g[i+1])
        {
            t=g[i+1];
            g[i+1]=g[i];
            g[i]=t;
        }

    }
    cout<<g[4999]<<endl;
}
int main()
{
    myfile.open("q2.txt");
    int i;
    p=(long long int*)malloc(5001*sizeof(long long int));
    q=(long double*)malloc(5000*sizeof(long double));
    r=(long double*)malloc(5000*sizeof(long double));
    s=(long double*)malloc(5000*sizeof(long double));
    t=(long double*)malloc(5000*sizeof(long double));
    u=(long double*)malloc(5000*sizeof(long double));
    v=(long double*)malloc(5000*sizeof(long double));
    w=(long double*)malloc(5000*sizeof(long double));
    g=(long double*)malloc(5000*sizeof(long double));
    for(i=0;i<5000;i++)
    {
        g[i]=0;
    }
    z=generate(/*71807,2147483647,4111*/);
    s=expo();
    g=gamma();
    z=generate(/*54807,2147483647,7113*/);
    t=expo();
    g=gamma();

    z=generate(/*91807,2147483647,7991*/);
    u=expo();
    g=gamma();
    z=generate(/*81807,2147483647,8111*/);
    v=expo();
    g=gamma();
    z=generate(/*83807,2147483647,9999*/);
    w=expo();
    g=gamma();
    for(i=0;i<5000;i++)
    {
        cout<<g[i]<<" ";
        myfile<<g[i]<<endl;
    }
    mean();
    max();
    min();

    delete(p,q,r,s,t,u,v,w,g);
    return 0;
    /*
For output we have to enter values of a,m and x0 5 times.
For plotting in Gnu plot:
reset
n=5000
max=100
min=0
width=0.08
#hist(x,width)=width*floor(x/width)+width/2.0
set output "histogram.png"
set xrange [0:5]
set yrange [0:400]
set offset graph 0.05,0.05,0.05,0.0
set boxwidth width*0.9
set style fill solid 0.2
set tics out nomirror
set xlabel "x"
set ylabel "Frequency"
plot "q2.txt" u (hist($1,width)):(1.0) smooth freq w boxes lc rgb"green" notitle
*/
}

