public class palendrome {
    
    public static void palendromeMethod(string str){
        
        string s = str.reverse();
        
        if(s == str){
            
            integer strInteger = integer.valueOf(str);
            
            system.debug('It is a palendrome');
            
            
        }
        else {
            system.debug('Not a Palendrome');
        }        
    }

}