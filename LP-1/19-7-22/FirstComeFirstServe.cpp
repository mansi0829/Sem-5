//============================================================================
// Name        : a131.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================


#include <bits/stdc++.h>
typedef long long int ll;
using namespace std;

class calculate
{
public:
    void createProcess();
    void printProcess(int at[], int bt[], int tat[], int wt[], int n);
//    void processSequence(int at[], int bt[], int n);
    void calculateAvgWaitingTime(int at[], int bt[], int wt[], int n);
    void calculateAvgTurnAroundTime(int at[], int bt[], int tat[], int n);
};

void swap(int *xp, int *yp)
{
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
}

void sort(int at[],int bt[], int n)
{
	int min_idx;
	for (int i = 0; i < n-1; i++)
	    {
	        min_idx = i;
	        for (int j = i+1; j < n; j++)
	        if (at[j] < at[min_idx])
	       		min_idx = j;
	        swap(&at[min_idx], &at[i]);
	        swap(&bt[min_idx], &bt[i]);
	    }
}

void printArray(int at[],int n)
{
	for(int i=0;i<n;i++) cout<<at[i]<<" ";
}

void processSequence(int at[],int bt[], int n)
{
	for(int i=0;i<n;i++){
		if(at[i]>at[i+1]){
			swap(&at[i] , &at[i+1]);
			swap(&bt[i] , &bt[i+1]);
		}
	}
}

void calculate::createProcess()
{
    int n;
    cin >> n;
    int at[n], bt[n];
    for (int i = 0; i < n; i++)
        cin >> at[i];
    for (int i = 0; i < n; i++)
        cin >> at[i];
}

void calculate::printProcess(int at[], int bt[], int tat[], int wt[], int n)
{
	sort(at,bt, n);
//	void calculate::

//	processSequence(at,bt,n);
	tat[0] = bt[0];
    cout<<"PN\t\tAT\t\t"
         << "BT\t\tTAT\t\tWT";

    cout << "1"
         << "\t\t" << at[0] << "\t\t"
         << bt[0] << "\t\t" << tat[0] << "\t\t" << wt[0] << endl;

    for (int i = 0; i < n; i++)
    {
        wt[i] = (at[i - 1] + bt[i - 1] + wt[i - 1]) - at[i];
        tat[i] = bt[i] + wt[i];
        cout << i + 1 << "\t\t" << at[i]
             << "\t\t" << bt[i] << "\t\t"
             << tat[i] << "\t\t" << wt[i] << endl;
    }
}





void calculate::calculateAvgWaitingTime(int at[], int bt[], int wt[], int n)
{
    float average;
    float sum = 0;

    for (int i = 0; i < n; i++)
    {
        sum = sum + wt[i];
    }

    average = sum / n;

    cout << "\nAverage waiting time = "
         << average;
}

void calculate::calculateAvgTurnAroundTime(int at[], int bt[], int tat[], int n)
{
    float average;
    float sum = 0;

    for (int i = 0; i < n; i++)
    {
        sum = sum + tat[i];
    }

    average = sum / n;

    cout << "\nAverage waiting time = "
         << average;
}

int main()
{
    calculate obj;
    int n;
    cin >> n;
    int at[n], bt[n];
    for (int i = 0; i < n; i++)
        cin >> at[i] >> bt[i];
    int wt[n], tat[n];
    wt[0] = 0;
//    sort(at,n);
    obj.printProcess(at, bt, tat, wt, n);
    obj.calculateAvgWaitingTime(at, bt, wt, n);
    obj.calculateAvgWaitingTime(at, bt, tat, n);
    return 0;
}
