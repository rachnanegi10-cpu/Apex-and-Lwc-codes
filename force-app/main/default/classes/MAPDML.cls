public class MAPDML {

    public static void mapInsert(){
        
        map<string,Account> acMap = new Map<string,Account>();
        string x ='A01';
        
        acMap.put(x,new Account(Name = 'MapTest', type ='Prospect', AccountNumber='abcd',Industry = 'Technology'));
        acMap.put('B1', new Account(Name = 'mapTest2', type = 'prospect', AccountNumber = 'aaaa',Industry = 'Technology'));
        
        insert acmap.values();
        
    }
    
    public static void mapUpdate(){
        
        map<id,Account> mapUpdate = new map<id,Account>([select name, type, industry from Account where createddate=today]);
        
        for(id key: mapUpdate.keyset()){
            
            system.debug('Show me all record id: '+key);
            system.debug('Show me all records: '+mapUpdate.get(key));
            
            Account acc = mapUpdate.get(key);
            
            acc.type = 'Customer - Direct';
            acc.Rating = 'Warm';
            
            mapUpdate.put(key,acc);
            
            system.debug('Show me data: '+mapUpdate.values());
        }
        
        update mapUpdate.values();
        
        for(Account acc: mapUpdate.values()){
            
            system.debug('Updated accounts: '+acc.Name+' :'+acc.Type+' : '+acc.Rating);
        }
    }
    
    public static void mapDelete(){
        
        Map<id,Account> mapDelete = new Map<id,Account>([select id,name from Account where createddate = today]);
        
        for(id key: mapDelete.keyset()){
            
            system.debug('Today Created Accounts are:'+mapDelete.get(key));
        }
        
        delete mapDelete.values();
        
        List<Account> a = [select id,isDeleted from account where isDeleted = true All Rows];
   
        for(Account acc:a) {
            if(acc.IsDeleted){
            
            
            system.debug('Account is deleted '+a);
                
            }
        
        }
    }
    
    public static sobject sObjectMethod(SObject sObj){
        
        return sObj;
    }
    
}