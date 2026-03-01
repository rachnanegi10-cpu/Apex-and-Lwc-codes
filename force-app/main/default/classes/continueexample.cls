public class continueexample {
    
    public static void accountStatement(){
        List<Account> acclist = [select id, Name,Active__c from account limit 20];
        
        
        for(Account acc: acclist){
            
            if(acc.Active__c == 'No'){
                continue;
            }
            system.debug('Active account: ' +acc.Id);
        }
        
    }

}