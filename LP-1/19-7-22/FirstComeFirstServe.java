import java.util.*;

class FCFS {
    static void CalculateTurnAroundTime(int at[],
            int bt[], int tat[], int N) {
        float average;
        float sum = 0;

        for (int i = 0; i < N; i++) {
            sum = sum + tat[i];
        }

        average = sum / 5;

        System.out.print("Average Turn Around time = "
                + average + "\n");
    }

    static void PrintProcess(int at[],
            int bt[], int tat[], int wt[], int N) {
        tat[0] = bt[0];
        System.out.print("P.No.\tArrival Time\t"
                + "Burst Time\tTurn Around Time\tWaiting Time\n");
        System.out.print("1"
                + "\t\t" + at[0] + "\t\t"
                + bt[0] + "\t\t" + tat[0] + "\t\t" + wt[0] + "\n");

        for (int i = 1; i < N; i++) {
            wt[i] = (at[i - 1] + bt[i - 1] + wt[i - 1]) - at[i];
            tat[i] = bt[i] + wt[i];
            System.out.print(i + 1 + "\t\t" + at[i]
                    + "\t\t" + bt[i] + "\t\t"
                    + tat[i] + "\t\t"
                    + wt[i] + "\n");
        }
    }

    static void CalculateWaitingTime(int at[],
            int bt[], int wt[], int N) {

        float average;
        float sum = 0;

        for (int i = 0; i < N; i++) {
            sum = sum + wt[i];
        }

        average = sum / 5;

        System.out.print("Average waiting time = "
                + average + "\n");
    }

    // Driver code
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        System.out.print("Enter total number of process - ");
        int N = sc.nextInt();
        int[] at = new int[N];
        int[] bt = new int[N];
        for (int i = 0; i < N; i++) {
            at[i] = sc.nextInt();
            bt[i] = sc.nextInt();
        }
        int[] wt = new int[N];
        int[] tat = new int[N];
        wt[0] = 0;
        PrintProcess(at, bt, tat, wt, N);
        CalculateTurnAroundTime(at, bt, tat, N);
        CalculateWaitingTime(at, bt, wt, N);
    }
}
