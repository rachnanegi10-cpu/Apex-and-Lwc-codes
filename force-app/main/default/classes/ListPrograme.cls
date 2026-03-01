public class ListPrograme {
    
    public static void valueRepetitionInList(list<string> ls,string s){
        
        List<string> ls1 = new list<string>(ls);
        integer len = ls.size()-1;
        integer count =0;
        for(integer i= 0; i<=len; i++){
            if(s == ls.get(i)){
                count++;
            }
        }
        system.debug('The queried value appeared: '+count+' times');
        
    }
    
    public static void checkPrimeAndPutInSet(list<integer> ls){
        
        list<integer> ls1= new list<integer>(ls);
        set<integer> s1 = new set<integer>();
        
        for(integer i=0; i<=ls1.size()-1; i++){
            integer n = ls1[i];
            system.debug(n);
            if(primeNumber.checkPrimeNumber(n)){
                
                system.debug(s1.add(ls1[i]));
            }
        }
       
        system.debug('The extracted value from list: '+s1);
       
    }
    
    public static void leapYear(Integer year){
        
        if(math.mod(year,4)==0){
            system.debug('This is leap year');
        }else{
            system.debug('This is not a leap year');
        }
    }
    
    public static void fibonacciSeries(Integer n){
        integer x;
        integer j=0;
        list<integer> ls = new list<integer>();
        ls.add(0);
        ls.add(1);
        for(integer i =1; i<=n ; i++){
            for(integer f: ls){
                x=ls[i-1]+ls[i];
                
            }ls.add(x);
        }
        system.debug('Fibonacci series is: '+ls);
    }
    
    public static void listCheck(){
        
        list<string> ls = new list<string>();
        set<string> s= new set<string>();
        
        for(integer i=ls.size(); i<=20; i++){
            
            ls.add('New '+i);
            
            if(i>=10){
                
                s.add('New '+i);
            }
        }
        
        system.debug('Stored values in list are: '+ls);
        system.debug('Stored values in set are:  '+s);
    }

}