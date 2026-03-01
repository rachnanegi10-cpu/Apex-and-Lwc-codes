public class stringSelector {
    
    public static void selectString(string s){
        
        string snew ;
        //integer len = snew.length();
        
        system.debug('Before trim: '+s);
        /*for(integer i=1; i<=len-1; i++){
            
                if(s.charAt(i)==48||s.charAt(i)==49||s.charAt(i)==50||s.charAt(i)==51||s.charAt(i)==52||s.charAt(i)==53||s.charAt(i)==54||s.charAt(i)==55||s.charAt(i)==56||s.charAt(i)==57){
                    //snew = s.replace(s.substring(0,i+1),''); trim starting numbers from string
                    //snew = s.replace(s.substring(i),' ');
                    //string charVal = String.valueOf(s.charAt(i));
                    snew = s.substring(i); 
                    
                   
                }
        		}*/
        
        
               
        snew = s.replaceAll('[0-9]','');                  
        
        system.debug('After trim: '+snew); 
         
    }

}