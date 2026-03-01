trigger CaseTrigger on Case (before insert,after update) {
    

    if(Trigger.isAfter && Trigger.isUpdate){
        CaseTriggerHandler.followUpTask(Trigger.New);
    }
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        CaseTriggerHandler.sendEmail(Trigger.New);
    }
    
}