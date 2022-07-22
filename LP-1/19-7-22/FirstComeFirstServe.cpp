#include <bits/stdc++.h>
#include <cctype>
#include <iostream>
#include <cstring>
typedef long long int ll;
using namespace std;

class calculate
{
public:
    void createProcess();
    void printProcess(int at[], int bt[], int tat[], int wt[], int n);
    void calculateAvgWaitingTime(int at[], int bt[], int wt[], int n);
    void calculateAvgTurnAroundTime(int at[], int bt[], int tat[], int n);
};

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
    tat[0] = bt[0];
    cout << "PN\t\tAT\t\t"
         << "BT\t\tTAT\t\t"
         << "WT\n\n";
    cout << "1"
         << "\t\t" << at[0] << "\t\t"
         << bt[0] << "\t\t" << tat[0] << "\t\t" << wt[0] << endl;

    for (int i = 1; i < n; i++)
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

    obj.printProcess(at, bt, tat, wt, n);
    obj.calculateAvgWaitingTime(at, bt, wt, n);
    obj.calculateAvgWaitingTime(at, bt, tat, n);
    return 0;
}