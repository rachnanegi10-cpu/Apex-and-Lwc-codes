public class PracticeAssignmentSoql {
 
    public static List<Database.saveresult> databaseInsert(List<Account> accountList){
        List<Database.saveresult> res = database.insert(accountList,false);
          system.debug('res:'+res);
        return res;
   }
    
    public static void databaseUpdate(String accountName){
        
        List<Account> accountList = [SELECT Id, Name FROM Account WHERE Name =: accountName];
        
        for(Account acc: accountList){
            
            acc.Type = 'Customer - Direct';
        }
        
        database.saveresult[] result = database.update(accountList,false);
        for(database.saveresult res: result){
            
            if(res.issuccess()){
                system.debug('Update successfully: '+res.getid());
            }else{
                
                database.error[] error = res.geterrors();
                for(database.error er: error){
                    system.debug('Error Message: '+er.getMessage());
                }
            }
        
        }
    }
    
    public static void databaseDelete(String accountName){
        
        List<Account> accountList = [SELECT id, Name FROM Account WHERE Name Like 'Gov%' ];
        
        database.deleteresult[] del = database.delete(accountList, false);
        for(database.deleteresult deleteData: del){
            
            if(deleteData.isSuccess()){
                system.debug('Data Deleted Successfully: '+deleteData.getid());
            }else{
                
                database.error[] error = deleteData.geterrors();
                for(database.error er: error){
                    
                    system.debug('Error:'+er.getmessage());
                }
            }
        }
        
    }
    
    public static void governerLimitExceprion(){
        try{
        List<Account> accountList = new List<Account>();
        
        for(Integer i =0; i<=152; i++){
            
            Account acc = new Account();
            acc.Name = 'Governer Limit Check'+i+' Account';
            acc.Type = 'Prospects';
            acc.Industry ='Aggriculture';
            acc.Rating = 'Hot';
            accountList.add(acc);
            insert accountList;
        }
            
        }
        Catch(DMLException e){
					system.debug('Error Message: '+e.getMessage());
        }
    }
  

}