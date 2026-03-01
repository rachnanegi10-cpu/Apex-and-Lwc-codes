public class StringFunction {
	 public static void strex()
    {
        
        string s1='Hello worlD';
        string s2='heLLo worlD';
        system.debug(s1==s2); 
        system.debug(s1.startswith('h'));
        system.debug(s1.startswithignorecase('h'));
         system.debug(s1.endswith('d')); 
        system.debug(s1.endswithignorecase('d')); 
        system.debug('show me s1 in upper case '+ s1.touppercase()); 
         system.debug('show me s1 in lower case '+s2.tolowercase());
       
        system.debug(s2.swapcase());
        system.debug(s1.reverse()); 
        string x1='900';
        string x2='700';
       integer res=integer.valueof(x1)+integer.valueof(x2); 
        system.debug('show me result '+res);
        
        system.debug(math.mod(9,2));
        system.debug(math.abs(-9));
        system.debug(math.sqrt(2));

        
    }
    public static void dateex( integer a,integer b,integer c)
    {
       /* date d1=system.today(); //current date
        system.debug('show me date '+d1);
        datetime dt=datetime.now(); //current date and time
         system.debug('show me datetime '+dt);
        time t=datetime.now().time(); //current time only
         system.debug('show me current time '+t);
        date x=date.newinstance(2025,3,13); // assign the value in x
        system.debug('show me date assign '+x);
        date x1=date.newinstance(a,b,c); //take  a date value
        system.debug('show me date insert by the user '+x1);
        datetime dttime=datetime.newinstancegmt(2025,2,12,5,30,12);
        system.debug('show me datetime assign by the user '+dttime);
        time t20=time.newinstance(8,20,9,2);
        system.debug('show me time insert by user '+t20);
        
        
*/        
	string s1=datetime.now().format('yyyy-MM-dd hh:mm:ss');
        
        system.debug('show me datetime of s1 '+s1);
        datetime d23=datetime.valueof(s1); 
        system.debug('show me datetime format'+d23);
       
        
    }

    
}