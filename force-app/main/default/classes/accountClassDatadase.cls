public class accountClassDatadase {
    public static boolean flag = true;
    
    public static void acInsert(List<Account> accList){
        List<Account_Success__c> accSuccessList = new List<Account_Success__c>();
        for(Account accRec:accList){
            if(accRec.Name!=null){
            Account_Success__c accSuc =new Account_Success__c();
            accSuc.Name = accRec.Name;
            accSuc.Type__c = accRec.Type;
            accSuccessList.add(accSuc);
           }else{
                AccountTriggerHandler.bulkAccountInsertion(accList);

            }
        }
        insert accSuccessList;
    }

}