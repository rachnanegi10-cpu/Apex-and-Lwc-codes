public class AssignmentTriggerHandler {
    
    public static void assignment1(List<Opportunity> oppList){
        for(Opportunity oppRec:oppList)
        if(oppRec.closedate!=null){
            oppRec.closeDate = system.today()+10;
            
        }
    }
    public static void assignment2(List<Contact> conList){
        set<id> conid = new set<id>();
        for(Contact con:conList){
            conid.add(con.id);
        }
        List<Contact> oldCon=[select id,email from contact where id in :conid];
        Map<id,String> conMap = new Map<id,String>();
        for(contact conRec:oldCon){
            conMap.put(conRec.id,conRec.Email);
           
        }
        
        for(Contact con:conList){
            if(conMap.containsKey(con.id)){
                if(con.Email == conMap.get(con.id)){
                    con.addError('Email can not be duplicate');
                }
            }
        }
        
    }
    
    public static void assignment3(List<Case> caseList){
        for(Case rec:caseList){
            if(rec.CaseCreate__c ==False){
                rec.CaseCreate__c = true;
            }
        }
    }
    
    public static void assignment5(List<Contact> conList){
        set<id> accid = new set<id>();
        Map<id,String> accmap =new Map<id,String>();
        List<Account> accList = [select id, Name from Account];
        for(Account accRec:accList){
            accid.add(accRec.id);
            accmap.put(accRec.id,accRec.Name);
        }
        
        for(Contact conRec:conList){
            string str =accmap.get(conRec.AccountId);
            conRec.ParenteAccountName__c = str;
            
        }
    }
    
    

}