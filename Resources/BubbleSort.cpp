#include <iostream>
using namespace std;

void bubblesort(int *a, int n)
{
	for(int i=0;i<n-1;i++)
	{
		for(int j=0;j<n-1-i;j++)
		{
			if(a[j]>a[j+1])
			{
				int x = a[j];
				a[j] = a[j+1];
				a[j+1] = x;
			}
		}
	}
}

int main()
{
	int a[5] = {5,4,3,2,1};
	int n = 5;
	bubblesort(a,n);
	for(int i=0;i<n;i++)
		a[i] = a[i] + 0;
	
	return 0;
}




