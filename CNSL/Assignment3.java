// Online Java Compiler
// Use this editor to write, compile and run your Java code online

class HelloWorld {
    static void Printarr(int arr[]) {
        for(int i=0; i<arr.length; i++) {
            System.out.println(arr[i]);
        }
        System.out.println();
    }
    
    static int[] CalculateReductantBit(int arr[], int r) {
        for(int i=0; i<r; i++) {
            int x = (int) Math.pow(2, i);
            for(int j=1; j<arr.length; j++) {
                if((j>>i & 1)==1)
                    if(x!=j) {
                        arr[x] = arr[x] ^ arr[j];
                    }
            }
            System.out.println("r : "+ x +" = " + arr[x]);
        }
        return arr;
    }
    static int[] generateCode(String str, int M, int r)
    {
        int[] ar = new int[r + M + 1];
        int j = 0;
        for (int i = 1; i < ar.length; i++) {
            if ((Math.ceil(Math.log(i) / Math.log(2))
                 - Math.floor(Math.log(i) / Math.log(2)))
                == 0) {
                ar[i] = 0;
            }
            else {
                ar[i] = (int)(str.charAt(j) - '0');
                j++;
            }
        }
        return ar;
    }
    public static void main(String[] args) {
        System.out.println("Hello, World!");
        
        String str = "0101";
        int M = str.length();
        int r = 1;
  
        while (Math.pow(2, r) < (M + r + 1)) {
            r++;
        }
        int[] ar = generateCode(str, M, r);
  
        System.out.println("Generated hamming code ");
        ar = CalculateReductantBit(ar, r);
        Printarr(ar);
    }
}
