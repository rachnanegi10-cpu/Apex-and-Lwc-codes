public class fibonacciRecursion {
    
    public static void fibonaci(integer p1, integer p2,integer n){
        Integer[] fibo = new Integer[n];
        fibo.add(p1);
        fibo.add(p2);
        Integer count=0 ;
        if(count<n-1){
           count = p1 +p2; 
           
 }
        
    system.debug('Fibonacci Series with recursion is: '+fibo);
        fibonaci(p2,count,n);
    

    }

}