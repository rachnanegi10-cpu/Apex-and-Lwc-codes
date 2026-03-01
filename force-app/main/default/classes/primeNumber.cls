public class primeNumber {
    
    public static boolean primeNumberfind(Integer n){
       boolean check = false;
       for(integer i=2; i<=n; i++){
            
           if(i==2 || i==3 || i==5){
                //system.debug(i);
            	check = true;
           }
           else {
         
            if(math.mod(i,2) ==0|| math.mod(i,13) == 0 || math.mod(i,3) == 0 || math.mod(i,5) == 0 ){
                
                //not prime
            }
               
               else{
                   check = true;
               system.debug(i);
                
            }
             
             
           }
           
       
    }
       return check;  
    }
    
    public static boolean checkPrimeNumber(Integer n){
       boolean check = false;
       
            
           if(n==2 || n==3 || n==5){
                system.debug('Prime Number');
            	check = true;
           }
           else {
         
            if(math.mod(n,2) ==0|| math.mod(n,13) == 0 || math.mod(n,3) == 0 || math.mod(n,5) == 0 ){
                
                //not prime
            }
               
               else{
                   check = true;
               system.debug('Prime Number');
                
            }
             
             
           }
           
       
    
       return check;  
    }
                
    }