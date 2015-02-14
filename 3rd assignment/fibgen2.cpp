#include<iostream>
#include<cstdlib>
#include<fstream>
using namespace std;
int main()
{
    int a=45677,b=0,x=1,n,i,j=0,k=0;
    long double d=0,var,e=0,f,g=0;
    double c;
    long long int m;
    cout<<"Input your value of m:"<<endl;
    cin>>m;
    cout<<"input your value of n :"<<endl;
    cin>>n;
    int count[20];
    for(i=0;i<20;i++)
    {
        count[i]=0;
    }
    ofstream file;
    ofstream myfile;
    myfile.open("monti.txt");
    file.open("freq.txt");
    long long int t;
    long long int q[17];
    q[0]=(a*x)%m;
    for(i=1;i<17;i++)
    {
        t=a*q[i-1];
        q[i]=t%m;
        //cout<<q[i]<<" ";
    }

    long long int *p,*u,*v;
    p=(long long int*)malloc((n+17)*(sizeof(long long int)));
    u=(long long int*)malloc((n+17)*(sizeof(long long int)));
    v=(long long int*)malloc((n+17)*(sizeof(long long int)));
    long double *r;
    r=(long double*)malloc((n+17)*(sizeof(long double)));
    for(i=0;i<17;i++)
    {
        p[i]=q[i];
        r[i]=(long double)p[i]/m;
    }
    for(i=17;i<n+17;i++)
    {
        t=p[i-17]+p[i-5];
        p[i]=t%m;
        r[i]=(long double)p[i]/m;
        cout<<p[i]<<" ";//Through this command I am generating the
                        // entire numbers generated through Fibonacci Generator
    }
    for(i=0;i<n+17;i++)
    {
    	//cout<<r[i]<<" ";//Through this I am converting entire numbers in the range[0,1]
    	//myfile<<r[i]<<endl;
    }
    cout<<"\n"<<endl;
    for(i=0;i<n+16;i++)
    {
        u[i]=p[i];
        v[i]=p[i+1];
        myfile<<u[i]<<","<<v[i]<<endl;//Through this I am giving output to my file for
                                        //plotting u[i] vs u[i+1]
    }
    //////////////////////////////////frequency distribution/////////////////////////
     cout<<"\n"<<endl;
    j=0;
    c=0;
    while(c<1)
    {
         while(j<n)
         {
            if(r[j]<c+.05)
            {
                if(c<r[j])
                {
                    count[k]=count[k]+1;
                    j++;
                }
                else
                {
                    j++;
                }
            }
            else
            {
                j++;
            }
        }
        file<<"("<<c<<"-"<<c+.05<<") "<<count[k]<<endl;//Through this i am giving output to
                                        //my file for plotting the probability distribution
        j=0;
        c=c+.05;
        k=k+1;
    }

    //////////////////////////////////mean and variance//////////////////////////////
    for(i=0;i<n+17;i++)
    {
    	d=d+(long double)r[i]/n;
    }
    cout<<d<<endl;//Through this I am generating my mean
    for(i=0;i<n+17;i++)
    {
    	var=(r[i]-d)*(r[i]-d);
    	e=e+(long double) var/n;
    }
    cout<<e<<endl;//Through this I am generating my variance
    ////////////////////////////////////Autocorrelation of lags///////////////////////
    for(i=1;i<6;i++)
    {
    	for(x=i;x<n;x++)
    	{
    		f=(r[x]-d)*(r[x-1]-d);
    		g=g+(long double)f/(e*n);
    	}
    	cout<< "the Autocorrelation for "<<i<<"is :" <<g<<endl;//Through this I am generating
                                                                //autocorrelation values
    }
    delete p;
    return 0;
}
/*Steps to get the histogram from GNU plot :
set yrange [0:70] ''''''[0:70] depends on the y axis range for n=10000 it is used as [0:600]
set ylabel "Frequeny" setting x naming
set xlabel "Range"
set boxwidth 1 relative
set style data histograms
set style fill solid 0.45 noborder
plot 'freq.txt' using 2:xticlabels(1) */
/*Steps to get the u[i] vs u[i+1] graph from GNU plot :
Arrange the reading in a text file as (x,y)
set yrange [0:1]
set xrange [0:1]
Write plot "nameoffile.extension" using "%lf,%lf"
-----------------------------------------------------------------------------------
*/
