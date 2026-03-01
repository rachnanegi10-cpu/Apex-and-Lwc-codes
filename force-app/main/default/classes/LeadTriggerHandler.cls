public class LeadTriggerHandler {
    
    public static void handleDeleteActivity(List<Lead> leadList){
        for(Lead leadRec: leadList){
            if(leadRec.status == 'Working - Contacted'){
                leadRec.addError('You can not delete lead:');
            }
        }
    }
    
    public static void handleLeadDuplicacy(List<Lead> newLeads){
        
     	set<String> setEmail = new set<String>();
        set<String> setName = new set<String>();
        
        for(Lead newLeadRec: newLeads){
            setEmail.add(newLeadRec.Email);
            setName.add(newLeadRec.Name);
        }
        
        List<Lead> oldLeads= [select id,email,Name from lead where email in:setEmail and Name in:setName];
        List<Lead_Duplicacy__c> dupLeadList = new List<Lead_Duplicacy__c>();
        
        Map<string,id> myMap = new map<string,id>();
        
        for(Lead leadRec : oldLeads){
            myMap.put(leadRec.Name,leadRec.Id);
            myMap.put(leadRec.Email,leadRec.Id);
        }
        
        for(Lead newRec: newLeads){
            if(myMap.containsKey(newRec.Name) && myMap.containsKey(newRec.Email)){
                Lead_Duplicacy__c dupLead= new Lead_Duplicacy__c();
                    dupLead.Name = newRec.Name;
                    dupLead.EmailDplicate__c = newRec.Email;
                    dupLeadList.add(dupLead);
                    newRec.addError('Data can not be duplicate');
            }
        }
        insert dupLeadList;
    }
    
    Public static void leadUpdate(List<Lead> ldList){
        
        List<User> userin = [Select Id,UserName,IsActive from User where UserName ='udays@salesforce.com'];
        Map<String,User> mapUser = new Map<String,User>();
        for(User rec: userin){
                
            mapUser.put(rec.UserName,rec);
            
        }
        for(Lead leadRec:ldList){
            
            if(leadRec.Id !=Null && leadRec.LeadSource =='Web'){
                User u = mapUser.get('udays@salesforce.com');
                leadRec.Assigned_to__c=u.Username;
                //ldList.add(leadRec);
            }
        }
        //insert ldList;

    }

}