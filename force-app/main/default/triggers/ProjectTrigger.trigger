trigger ProjectTrigger on Project__c (before insert) {
    
    if(Trigger.isBefore && Trigger.isInsert){
        ProjectTriggerHandler.handleProject(Trigger.New);
    }

}