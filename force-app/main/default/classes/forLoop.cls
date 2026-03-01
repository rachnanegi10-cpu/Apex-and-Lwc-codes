public class forLoop {
    
    public static void reverseString(string x){
        
        integer i;
        
       /* for(i=0; i<5; i++){
            /*if(math.mod(i,2)!=0){
                system.debug('Print odd number: '+i);
            }*/
           /* system.debug('');
            for(integer j=0; j<=i; j++){
                system.debug(''+'*');
            }
        }*/
        
       /* for(i=5; i>=1; i--){
          
            system.debug('');
            for(integer j=1; j<=i; j++){
                system.debug(''+'*');
            }
        }*/
        
        /*for(i=1; i<=5; i++){
          
            system.debug('');
            for(integer j=5; j>=i; j--){
                system.debug('*');
            }
        }*/
        
        /*string rev='';
        integer len = x.length();
        system.debug('Show me the length'+len);
        for(i=len-1;i>=0;i--){
            
           rev+=x.substring(i,i+1);
            
        }
        system.debug(''+rev+'');*/
        
        string sub;
        integer len = x.length();
        sub=x.substring(0,1);
        for(i=0; i<=len-1 ;i++){
            
            //sub[i]=x[i];
            if(x.substring(i)!=x.substring(i+1)){
                sub=x.substring(i+1);
                //string s1 = sub;
                //integer lengthSub =s1.length();
                
                
            }
            
        }   integer lenghtsub = sub.length();
            system.debug(lenghtsub+' : '+sub);
        
    }

}