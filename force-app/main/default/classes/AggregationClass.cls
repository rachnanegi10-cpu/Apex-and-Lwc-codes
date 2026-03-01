public class AggregationClass {
    public static void aggrigationMethod(List<Opportunity> oppList){
        List<String> accId = new List<String>();
        for(Opportunity oppRec:oppList){
            accId.add(oppRec.AccountId);
        }
        
        List<Account> accList = [SELECT id,Maximum_Amount__c,Minimum_Amount__c FROM Account WHERE id in:accId ];
        for(Account accRec:accList){
            
            Aggregateresult result = [select max(Amount) maxAmount,min(Amount) minAmount from Opportunity where Accountid=:accRec.id];
            accRec.Maximum_Amount__c =(decimal)result.get('maxAmount');
            accRec.Minimum_Amount__c =(decimal)result.get('minAmount');
        }
        update accList;
    
    
    }
    
    

}