public class breakAndcontinue {
    
    public static void breakMethod(){
        
        integer i;
        
        for(i=0;i<=5;i++){
            
            system.debug('');
            for(integer j=0; j<=5; j++){
                
                if(j==4){
                    
                    break;
                }
                system.debug('Value of j:'+j);
            }
            system.debug('value of i:'+i);
        }
    }

}