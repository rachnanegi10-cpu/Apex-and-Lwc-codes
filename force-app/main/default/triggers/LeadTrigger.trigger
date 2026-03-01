trigger LeadTrigger on Lead (before insert,before update,before delete) {
    
   /* if(Trigger.isBefore && Trigger.isInsert){
        AccountTriggerHandler.setLeadStatus(Trigger.New);
    }*/
    
    /*if(Trigger.isBefore && Trigger.isDelete){
        LeadTriggerHandler.handleDeleteActivity(Trigger.old);
    }
    
    if(Trigger.isBefore && Trigger.isInsert){
        LeadTriggerHandler.handleLeadDuplicacy(Trigger.new);
    }*/
    
   /* if(Trigger.isAfter && Trigger.isInsert){
        LeadTriggerHandler.handleLeadDuplicacy(Trigger.New);
    }
    
    if(Trigger.isBefore && (Trigger.isInsert||Trigger.isUpdate)){
        LeadTriggerHandler.leadUpdate(Trigger.New);
    }*/
    
    

}