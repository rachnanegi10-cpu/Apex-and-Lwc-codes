trigger ContactTrigger on Contact (after insert,before insert,before delete,after delete,before update,after update,after undelete) {
    
    if(Trigger.isInsert && Trigger.isAfter){
        //contactTriggerHandler.insertContactRole(Trigger.new);
    }
    
    if(Trigger.isInsert && Trigger.isAfter){
        contactTriggerHandler.handleContactShare(Trigger.new);
    }
   /* if(Trigger.isAfter && Trigger.isInsert){
        TaskTriggerHandler.insertTaskOnContactCreation(Trigger.new);
    }
    
    /*if(Trigger.isBefore && Trigger.isInsert){
        ContactTriggerHandler.handleContactDuplicacy(Trigger.new);
    }*/
   /* if(Trigger.isAfter){
             if( Trigger.isUpdate || trigger.isInsert || trigger.isdelete ||trigger.isundelete ){
        			contactTriggerHandler.countOfContact(Trigger.new,trigger.old);
    }
        
    }*/
    
    /*if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate) ){
        for(Contact c:Trigger.new){
            if(c.email!=null && c.AccountId!=null){
                EmailMessageTriggerHandler.sendmail(c.email);
            }
        }
    }*/
  
/* if(Trigger.isInsert && Trigger.isBefore){
        AssignmentTriggerHandler.assignment5(Trigger.new);
    }*/
    
    /*if((Trigger.isInsert && Trigger.isBefore) || (Trigger.isAfter && Trigger.isInsert)|| (Trigger.isBefore && Trigger.isUpdate)){
       ContactTriggerHandler.updateOpportunity(Trigger.new);
    }
    
    if(Trigger.isInsert && Trigger.isBefore){
        contactTriggerHandler.phoneValidation(Trigger.new);
        contactTriggerHandler.contactAccountValidation(Trigger.New);
    }*/
    
   /* if(Trigger.isAfter && Trigger.isUpdate){
    		UnsolvedScenarios.code19(Trigger.New);
    }
    
    if(Trigger.isAfter && Trigger.isInsert){
            UnsolvedScenarios.contactAddOrDelete(Trigger.new);
    }
    
    if(Trigger.isAfter && Trigger.isDelete){
        UnsolvedScenarios.contactAddOrDelete(Trigger.old);
    }*/
    
	if(Trigger.isAfter && Trigger.isUpdate){
        contactTriggerHandler.taskcreateonconupdate(Trigger.new);
    }    

}