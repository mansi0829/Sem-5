import java.util.Scanner;

class SJF {
    static void PrintProcess(int at[], int bt[], int N) {

    }

    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the Total Number of Process - ");
        int N = sc.nextInt();
        int at[] = new int[N];
        int bt[] = new int[N];
        for (int i = 0; i < N; i++) {
            at[i] = sc.nextInt();
            bt[i] = sc.nextInt();
        }
        int tat[] = new int[N];
        PrintProcess(at, bt, N);

    }
}
