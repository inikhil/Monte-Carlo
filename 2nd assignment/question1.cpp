/*Generating the xi's and ui's using a for loop*/
#include<iostream>
using namespace std;
int main(){
    int a,b,m,x0;
    int c,i,x1[20];
    double u[20];
    cout<<"input values of a,b and m : "<< endl;
    cin>>a>>b>>m;
    for(x0=0;x0<11;x0++)
    {
         cout<<"your sequence for x0 = "<< x0 << "is"<<endl;
         cout<< x0 << "   ";
         x1[0]=x0;
         u[0]=(double)x1[0]/m;
         cout<<u[0]<<"   "<<endl;
         for(c=1;c<20;c++)
         {
               x1[c]=(x1[c-1]*a+b)%m;
               cout<<x1[c]<<" ";
               u[c]= (double) x1[c]/m;
               cout<<u[c]<< "   "<<endl;

         }
         cout<<"\n";
    }
}
/*At the end it prints out each value of xi's along with ui's*/
