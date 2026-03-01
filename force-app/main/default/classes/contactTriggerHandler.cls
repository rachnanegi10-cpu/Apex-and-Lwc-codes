public class contactTriggerHandler {
    
    public static void insertContactRole(List<Contact> contactList){
        List<Id> IdLIst = new List<Id>();
        for(Contact contactRec: contactList){
            
            if(contactRec.AccountId != NULL){
                IdList.add(contactRec.AccountId);
            }
        }
        
        List<Opportunity> oppList =[SELECT id,Account.Name, Accountid FROM Opportunity WHERE Accountid in :IdList AND Accountid !=NULL];
        
        Map<Id, Opportunity> oppMap = new Map<Id,Opportunity>();
        for(Opportunity oppRec: oppList){
            oppMap.put(oppRec.id,oppRec);
        }
        
        List<Opportunitycontactrole> oppConRole = new List<Opportunitycontactrole>();
        
        for(Contact conRec:contactList ){
            Opportunity oppRec =oppMap.get(conRec.Accountid);
            OpportunityContactRole oppRole = new OpportunityContactRole();
            oppRole.Contactid = conRec.id;
            oppRole.Role = 'Technical Buyer';
            oppRole.OpportunityId = oppRec.Id;
            oppConRole.add(oppRole);
            
        }
        
        insert oppConRole;
        
        
    }
    
    public static void handleContactDuplicacy(List<Contact> newContact){
        
        set<String> setContact = new set<String>();
        
        for(Contact newConRec: newContact){
            setContact.add(newConRec.Email);
        }
        
        List<Contact> oldContact= [select id,email from Contact where email in:setContact ];
        
        for(Contact newConRec: newContact){
            for(Contact oldConRec: oldContact){
                if(newConRec.Email==oldConRec.Email){
                    newConRec.addError('Emails can not be duplicate');
                }
            }
        }
    }
    
 public static void countOfContact(List<Contact> newCon,List<Contact> oldCon){
 
     set<Id> accId = new set<id>();
     if(newCon!=null){
         for(Contact c: newCon){
             accId.add(c.Accountid);
         }
     }
     
       if(oldCon!=null){
         for(Contact c: oldCon){
             accId.add(c.Accountid);
         }
     }
     
     List<Account> accList =[SELECT id,Count_Contact__c,(SELECT AccountId FROM contacts) FROM Account where id in:accId];
     
     if(!accList.isEmpty()){
         
         for(Account accRec: accList){
             accRec.Count_Contact__c = accRec.contacts.size();
         }
     }
     
     update accList;
 }
    
    public static void updateOpportunity(List<Contact> conList){
        set<Id> accId = new set<Id>();
        for(Contact con : conList){
            if(con.AccountId !=null){
                accId.add(con.AccountId);
            }
        }
        
        Map<Id,Contact> conMap = new Map<Id,Contact>();
        for(Contact conRec:[SELECT Id,Name,OwnerId FROM Contact WHERE Id IN : accId]){
            conMap.put(conRec.AccountId,conRec);
        }
        
        List<Opportunity> oppList = [SELECT AccountId,Contact_Name__c,Report_To__c FROM Opportunity WHERE AccountId IN:accId];
        
        for(Opportunity oppRec: oppList){
            if(conMap.containsKey(oppRec.AccountId)){
                Contact conRecNew = conMap.get(oppRec.AccountId);
                oppRec.Contact_Name__c = conRecNew.Name;
                oppRec.Report_To__c=conRecNew.OwnerId;
            }
        }
        update oppList;
  
    }
    
    public static void phoneValidation(List<Contact> conList){
        for(Contact conRec:conList){
            if(conRec.Phone != null){
            	string phoneCheck = conRec.Phone.replaceAll('[^\\d]','');
                if(phoneCheck.length()==10 && !phoneCheck.isNumeric()){
                    conRec.Phone.addError('Phone number must be valid');
                }
            }
            
        }
    }
    
    public static void contactAccountValidation(List<Contact> conList){
        for(Contact conRec:conList){
            
            if(conRec.AccountId == Null){
                conRec.AccountId.addError('Contact must have an Account');
            }
        }
    }
    
    public static void taskcreateonconupdate(List<Contact> conList){
        List<Task> tList = new List<Task>();
        for(Contact conRec:conList){
            Task taskRec = new Task();
            taskRec.WhoId = conRec.id;
            tList.add(taskRec);
            
        }
        
        if(!tList.isEmpty()){
            insert tList;
        }
        
    }
    
    //Share a contact record with public group.
    
    public static void handleContactShare(List<Contact> newRecords){
        Id publicGroupId = [SELECT Id,Name FROM Group WHERE Name='Contact Innovator' LIMIT 1].Id;
        List<ContactShare> addRecordsToList = new List<ContactShare>();
        for(Contact con:newRecords){
            ContactShare conS = new ContactShare();
            conS.ContactId = con.Id;
            conS.ContactAccessLevel='Edit';
            conS.RowCause='Manual';
            conS.UserOrGroupId=publicGroupId;
            addRecordsToList.add(conS);
        }
        if(!addRecordsToList.isEmpty()){
            insert addRecordsToList;
        }
    }
}