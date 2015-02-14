                                                                                                                                                                                                                     #include<iostream>
#include<cstdlib>
#include<fstream>
using namespace std;
int main()
{
    int a,n,x=1,i,j,k=0,s=0;
    double c;
    long int m;
    ofstream myfile;
    ofstream file;
    file.open("mont.txt");
    myfile.open("mon.txt");

    long long int t;
    cout<<"Enter your values of a,m and n : "<<endl;
    cin>>a>>m>>n;
    int count[20];
    for(i=0;i<20;i++)
    {
        count[i]=0;
    }

    long long int *p;
    long double *q,*u,*v;
    p=(long long int*) calloc (n,sizeof(long long int));
    q=(long double*) calloc (n,sizeof(long double));
    u=(long double*) calloc (n,sizeof(long double));
    v=(long double*) calloc (n,sizeof(long double));
    p[0]=1;
    q[0]=(long double)p[0]/m;
    //cout<<q[0]<<" ";
    for(i=1;i<n;i++)
    {
        t=p[i-1]*a;
        p[i]=(long long int)t%m;
        q[i]=(long double) p[i]/m;
        //cout<<q[i]<<" ";//this line is used to get ui's if you want you can execute it
    }
    cout<<"\n"<<endl;
    j=0;
    c=0;
    while(c<1)
    {
         while(j<n)
         {
            if(q[j]<c+.05)
            {
                if(c<q[j])
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
        file<<"("<<c<<"-"<<c+.05<<") "<<count[k]<<endl;//through this line I am giving the
                                    //output of frequency to my file to plot histograms
        j=0;
        c=c+.05;
        k=k+1;
    }
    for(k=0;k<20;k++)
    {
        cout<<count[k]<<" ";
        s=s+count[k];
    }
    for(i=0;i<n;i++)
    {
        u[i]=q[i];
        v[i]=q[i+1];
        myfile<<u[i]<<","<<v[i]<<endl;//through this I am giving the output to my file for
                                                //plotting u[i]vs u[i+1]
    }
    cout<<"\n"<<s;
    delete p;
    delete q;
    delete u;
    delete v;
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
------------------------------------------------------------------------------------------
*/
