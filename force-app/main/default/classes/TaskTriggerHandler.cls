public class TaskTriggerHandler {
    
    public static void insertTask(List<Account> accountList){
        List<Task> taskList = new List<Task>();
        for(Account accRec:accountList){
            
            Task taskRec = new Task();
            taskRec.WhatId = accRec.id;
            taskRec.Priority ='Medium';
            taskRec.Subject =accRec.Description;
            taskList.add(taskRec);
        }
        insert taskList;
    }
    
    public static void insertTaskWhenActive(List<Account> accountList){
        List<Task> taskList = new List<Task>();
        for(Account accRec:accountList){
            if(accRec.Active__c =='Yes'){
            Task taskRec = new Task();
            taskRec.WhatId = accRec.id;
            taskRec.Priority ='Medium';
            taskRec.Subject ='Complete the task';
            taskList.add(taskRec);
        }
      }
        insert taskList;
    }
    
    public static void insertTaskForOtherProfile(List<Account> accountList){
        
        Map<String,id> taskMap = new Map<String,id>();
        set<id> setIds= new set<id>();
        List<Task> taskList = new List<Task>();
        
        for(User userRec:[SELECT id, Profile.Name from User where Profile.Name ='Standard User']){
            
            taskMap.put(userRec.Profile.Name,userRec.id);
        }
        if(taskMap.isEmpty()){
            system.debug('User dose not exist');
        }
        
        for(Account accRec:accountList){
            if(taskMap.containsKey('Standard User')){
                
                Task taskRec = new Task();
                taskRec.WhatId = accRec.id;
            	taskRec.Priority ='Medium';
            	taskRec.Subject ='Follow up task by : '+system.today();
                taskRec.OwnerId = taskMap.get('Standard User');
            	taskList.add(taskRec);
                
            }
        }
        insert taskList;
    }
    
    public static void insertTaskOnContactCreation(List<Contact> contactList){
        List<Task> taskList=new List<Task>();
        for(Contact conRec:contactList){
            Task taskRec = new Task();
            taskRec.WhoId = conRec.id;
            taskRec.Priority ='Medium';
            taskRec.Subject ='Follow up task by'+system.today();
            taskList.add(taskRec);
        }
        insert taskList;
            
        
    }
    
    public static void insertTaskOnOpportunityCreation(List<Opportunity> oppList){
        List<Task> taskList=new List<Task>();
        Date maxdate = date.today()+91;
        Map<String,id> oppMap = new Map<String,id>();
        for(User u: [Select id,Name from User where Name='Rachna Negi']){
            oppMap.put(u.Name,u.id);
        }
        for(Opportunity oppRec:oppList){
            if(oppRec.CloseDate < maxdate){
            Task taskRec = new Task();
            taskRec.WhatId = oppRec.id;
            taskRec.Priority ='Medium';
            taskRec.Subject ='Follow up task by: '+system.today()+30;
            taskRec.OwnerId=oppMap.get('Rachna Negi');
            taskList.add(taskRec);
            }
        }
        insert taskList;
            
        
    }

}