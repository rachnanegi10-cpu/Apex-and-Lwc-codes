public class reverseStringNew {
    
    public static void reverseString(string s){
        
        string s1;
        string s2;
        string s3='';
        integer iIndex = 0;
        integer lIndex = s.length();
        
        for(integer i=0; i<lIndex-1; i++){
            
            s1 = s.substring(0,i);
            if(s.charAt(i)==32 ){
               
               break; 
            }
           
            
            
        }
         system.debug(s1.reverse());
        //system.debug(s2);
    }

}