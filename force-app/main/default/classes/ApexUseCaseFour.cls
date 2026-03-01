public class ApexUseCaseFour {
    
    public static List<String> returnContactsEmails(String accountName){
        List<String> emailList = new List<String>();
        List<Account> accName = [Select id from Account where name =: accountName limit 1];
    
        if(accName.size() == 1){
            
            List<Contact> conList = [Select Id, email from Contact where AccountId =: accName[0].id];
            if(conList.size()>0){
                
                for(Contact con : conList){
                    
                    if(con.email !=null){
                        emailList.add(con.email);
                    }
                    
                }
            }
            
        }
    return emailList;
    
    }

}