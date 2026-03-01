public class mapConversion {

    public static void listToMap(){
        
        List<Account> accList = [select id,name,type from account limit 10];
        Map<id,Account> accMap = new Map<id,Account>();
        
        for(Account a: accList){
            
            accMap.put(a.id,a);
        }
        
        
    }
    
    public static void ListToMapConversion(){
        
        list<Account> accList = [select id,Name,(select firstname,lastname from contacts where accountid !=null) from Account limit 10];
        
        Map<id,Contact> conMap = new Map<Id,Contact>();
        
        for(Account a: accList){
            Contact con = new Contact();
            con.LastName = a.Name;
            con.AccountId = a.Id;
            
            conMap.put(a.Id,con);
            system.debug(conMap);
            system.debug(accList);
        }
    }
}