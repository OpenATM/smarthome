#include <iostream>

using namespace std;

void _sort(int arr[], int n);
void _select_sort(int arr[], int n);

void output_arr(int *arr, int length)
{
    //int length = sizeof(arr)/sizeof(arr[0]);
    //cout<<"the length:" <<length<<endl;
    for(int i=0; i< length; i++)
    {
        cout<<arr[i]<<" ";
    }
    cout << endl;
}

int main()
{
    //cout << "Hello world!" << endl;
    int a[]= {1,3,2,5,4,0,9, -3};
    //cout<<"the length:" <<sizeof(a)/sizeof(a[0])<<endl;
    int length = sizeof(a)/sizeof(a[0]);
    //_sort(a,length);
    _select_sort(a,length);
    //cout << "-1:"<<a[-1]<< endl;
    output_arr(a, length);
    return 0;
}
void _select_sort(int arr[], int n)
{
    int k, tmp;
    for(int i=0; i < n; i++)
    {
        k=i;
        for(int j=1+i; j < n; j++)
            if(arr[k] > arr[j])
                k = j;
        tmp = arr[i];
        arr[i] = arr[k];
        arr[k] = tmp;

    }
}
void _sort(int arr[], int n)
{
    int temp;
    for(int i = 0; i < n-1 ; i++)
    {
        for(int j = n-1; j > i; j--)
        {
            if(arr[j] < arr[j-1])
            {

                temp = arr[j-1];
                arr[j-1] = arr[j];
                arr[j] = temp;
            }
        }
    }

}
