public class ApexUseCasFive {
    
    public static boolean checkParentChildCombo(string accountName, String contactName){
        if(!string.isblank(accountName) && !string.isblank(contactName)){
            
            list<Contact> conList = [SELECT id,FirstName FROM contact where Account.Name = : accountName and Name = :contactName];
            
            if(conList.size()>0){
                
                return true;
            }
                
            
            
        }
        return false;
    }
    
  

}