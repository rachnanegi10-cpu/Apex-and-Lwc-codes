public class UnsolvedScenarios {
    
    public static void code7(List<Account> accList){
        List<Account_Success__c> accSucList = new List<Account_Success__c>();
        try{
        for(Account acc:accList){
            if(acc.Name!=Null && acc.Type!=Null){
            Account_Success__c accSuc= new Account_Success__c();
            accSuc.Name = acc.Name;
            accSuc.Type__c = acc.Type;
            accSucList.add(accSuc);    
            }
        }
            insert accSucList;
    }
        catch(DMLException e){
            
            system.debug('Error in code handling: '+e.getMessage());
        }
    }
    
    public static void code8(List<Account> accList){
        List<Opportunity> oppList = new List<opportunity>();
        List<case> cList = new List<case>();
        List<Contact> conList = new List<Contact>();
        for(Account acc:accList){
            if(acc.Name!=Null){
                Contact con = new Contact();
                con.AccountId = acc.Id;
                con.LastName = 'Contact with '+acc.Name;
                conList.add(con);
                
                Case cs = new Case();
                cs.AccountId = acc.Id;
                cs.ContactId = con.Id;
                cList.add(cs);
                
                Opportunity oppRec = new Opportunity();
                oppRec.AccountId=acc.Id;
                oppRec.Name = 'Opportunity with '+acc.Name;
                oppRec.ContactId= con.Id;
                oppList.add(oppRec);
              
            }
        }
        if(!conList.isEmpty()){
            insert conList;
        }
        if(!cList.isEmpty()){
            insert cList;
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
    
    public static void code9(List<Account> accList){
        List<Opportunity> oppList = new List<opportunity>();
        List<case> cList = new List<case>();
        List<Contact> conList = new List<Contact>();
        Map<Id,Account> accMap = new Map<Id,Account>();
        for(Account acc:accList){
            accMap.put(acc.id,acc);
        }
        Integer a = 0;
        List<Account> acList = [SELECT Id,Name FROM Account WHERE Id in:accMap.keyset()];
        for(Integer i=0; i<=3 ;i++){
            Account acc =acList[a];
            Contact con =  new Contact();
            con.AccountId = acc.Id;
            con.LastName='Unsolved Contact '+i;
            conList.add(con);
        }
        
        for(Integer i=0; i<2 ;i++){
            Account acc =acList[a];
            Opportunity opp =  new Opportunity();
            opp.AccountId = acc.Id;
            opp.Name='Unsolved Opportunity '+i;
            oppList.add(opp);
        }
        
            Account acc =acList[a];
            Case cs =  new Case();
            cs.AccountId = acc.Id;
            cList.add(cs);
        
        if(!conList.isEmpty()){
            insert conList;
        }
        if(!cList.isEmpty()){
            insert cList;
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
            

    }
    
    public static void code10(List<Account> accList){
        for(Account accRec:accList){
            Account acc= (Account)trigger.oldmap.get(accRec.id);
            if(acc.AnnualRevenue >accRec.AnnualRevenue){
                accRec.addError('You are not allowed to update account');
            }
            
        }
        
        
    }
    
    public static void code18(List<Account> accList){
        set<Id> accId = new set<Id>();
        for(Account acc:accList){
            if(acc.Id!=null){
                accId.add(acc.Id);
            }
        }
        Integer a=0;
        Map<string,id> conmap = new Map<string,id>();
        List<Account> acCon=[SELECT Id,AnnualRevenue,name,(select AccountId,Description,email from contacts) FROM Account where id in:accId];
        for(Account accRec:acCon){
            Account acc = (Account)trigger.oldmap.get(accRec.Id);
            List<Contact> conList = accRec.contacts;
            if(acc.AnnualRevenue != accRec.AnnualRevenue){
                EmailMessageTriggerHandler.sendmail(conList[a].Email,'Annual Revenue '+accRec.Name,conList[a].Description);
            }
            
        }
    }
    
    public static void code19(List<Contact> conList){
       Integer a=0;
       List<String> user1 = new List<String>();
       List<User> us = [Select id,ManagerId,IsActive,email from User where IsActive = true And ManagerId!=null];
        for(User rec: us){
            if(rec.ManagerId!=Null){
                
                user1.add(rec.Email);
            }
        }
        for(Contact conRec:conList){
            Contact con = (Contact)Trigger.oldmap.get(conRec.Id);
            if(con.AccountId!=null && con.AccountId != conRec.AccountId && !user1.isEmpty()){
                EmailMessageTriggerHandler.sendmail(user1[a], 'To Manager', 'Account is changed from '+con.AccountId+' to '+conRec.AccountId);
            }
        }
    }
    
    public static void code21(List<Account> accList){
        set<Id> accId = new set<Id>();
        for(Account rec:accList){
            accId.add(rec.Id);
        }
        
        List<Account> accList2 = [Select id,Name from Account where id in : accId];
        for(Account acc:accList){
            
            acc.Name = acc.Name+' XYZ';
            //cList.add(acc);
        }
        
       
    }
    
       public static void contactAddOrDelete(List<Contact> conList){
        Set<Id> conId = new Set<Id>();
        for(Contact con:conList){
            conId.add(con.AccountId);
        }
        
        List<Account> accList = new List<Account>();
           for(Account acc:[Select Id,Contact_Added__c,Contact_Deleted__c,(Select AccountId From Contacts ) 
                                From Account Where Id in:conId and Id!=null]){
               Integer count =acc.contacts.size();
               if(acc.contacts.size()>0){
                   acc.Contact_Added__c = True;
                   acc.Contact_Deleted__c = false;
               }else {
                   if(acc.contacts.size()<=count || acc.contacts.size()==0) {
                   		acc.Contact_Deleted__c = True;
                       acc.Contact_Added__c = false;
               }
                     }
                 accList.add(acc);
           }
        update accList;
    }
    
    

}