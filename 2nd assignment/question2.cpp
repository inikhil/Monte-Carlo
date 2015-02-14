#include<iostream>
using namespace std;
int main()
{
    long long int m=244944,i,b=0,x=500,t=0,y;
    long int c,n;
    long int a;
    int j[20];
    for(c=0;c<20;c++)
    {
        j[c]=0;
    }
    cout<< "Choose the value of a either 1597 or 51749 : "<<endl;
    cin>>a;
    cout<<"choose the value of n:"<<endl;
    cin>>n;
    double u[n],d=0;
    for(i=0;i<n;i++)
    {
        y=(double)a*x;
        x=(y+b)%m;
        u[i]=(double)x/m;
        cout<<u[i]<< "   ";
    }
    cout<<"\n";
    cout<<"Frequency distribution is:"<<endl;
    i=0;
    c=0;
    for(c=0;c<20;c++)
    {
        for(t=0;t<n;t++)
        {
            if((0+d)<u[t])
            {
               if(u[t]<(.05+d))
               {
                    j[c]=j[c]+1;
               }
            }
        }
        d=d+0.05;

    }
    for(c=0;c<20;c++)
    {
        cout<<j[c] << "   ";
    }
    return 0;
}
/*In this code my output is ui's as well as frequencies*/
