public class CheckNumber {
    
    public static void checkMethod(){
        
        try{
            
            list<Account> acclist = new list<account>();
            
            for(integer i=2; i<10; i++){
                
                if(math.mod(i,2) !=0){
                    
                    throw new CustomException('This is not even number and not allowed to add in the list: '+i);
                }
                
                else{
                    
                    acclist.add(new account(name='NewAccount'+i, accountnumber = 'KJ'+i ));
                }
            }
            
            insert acclist;
        }
        
        catch(CustomException e){
            
            system.debug('Show message: '+e.getmessage());
            system.debug('Show Line Number: '+e.getlinenumber());
        }
    }

}