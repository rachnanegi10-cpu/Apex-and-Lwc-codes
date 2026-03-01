trigger AccountTrigger on Account (before insert, after insert,before Update,after Update,before delete,after undelete) {
    
    /*if(Trigger.isBefore && Trigger.isInsert){
        AccountTriggerHandler.checkType(Trigger.new);
    }
    
    if(Trigger.isBefore && Trigger.isInsert){
        AccountTriggerHandler.checkIndustry(Trigger.new);
    }
    
   
    if(Trigger.isBefore && (Trigger.isUpdate || Trigger.isInsert)){
        AccountTriggerHandler.setAccountActive(Trigger.new);
    }
    
    if(Trigger.isBefore && Trigger.isInsert){
        AccountTriggerHandler.setAccountType(Trigger.New);
    }*/
    
    /* Contact Insert
	*/
    /*if(Trigger.isAfter && Trigger.isInsert){
        TriggerHandler.triggerInsertMethodForContact(Trigger.new);
    }
    
    /* Opportunity Insert
	*/
    /*if(Trigger.isAfter && Trigger.isInsert){
        //TriggerHandler.triggerInsertMethodForOpportunity(Trigger.new);
        TriggerHandler.triggerInsertOppClosedWon(Trigger.new);
    }
    /* Case Insert
	*/
    if(Trigger.isAfter && Trigger.isUpdate){
        TriggerHandler.triggerInsertMethodForCase(Trigger.new);
    }
    
    
    /* Success and Fail Insert
	*/
    
    /*if(AccountTriggerHandler.isTriggerRunning){
        return;
    }
    AccountTriggerHandler.isTriggerRunning =true;*/
    if(Trigger.isBefore && Trigger.isInsert){
        accountClassDatadase.acInsert(Trigger.new);
        //system.debug('Trigger.old: 'Trigger.old);
    }
    
   
    /*if(Trigger.isAfter && Trigger.isInsert){
        taskTriggerHandler.insertTask(Trigger.new);
    }*/
    
    /*if(Trigger.isAfter && Trigger.isInsert){
        taskTriggerHandler.insertTaskWhenActive(Trigger.new);
    }
    
    /*if(Trigger.isAfter && Trigger.isInsert){
        taskTriggerHandler.insertTaskForOtherProfile(Trigger.New);
    }*/
    /*if(Trigger.isBefore && Trigger.isInsert){
        AccountTriggerHandler.handleAccountDuplicacy(Trigger.new);
    }*/
    /*if(Trigger.isAfter && Trigger.isInsert || Trigger.isUpdate){
        AccountTriggerHandler.annualRevenueCheck(Trigger.New);
    }
    
    if(Trigger.isAfter && Trigger.isInsert || Trigger.isUpdate){
        AccountTriggerHandler.setContactDes(Trigger.NewMap);
    }*/
    
    /*if(Trigger.isAfter && Trigger.isInsert || Trigger.isUpdate){
        AccountTriggerHandler.annualRevenueCheckRating(Trigger.New);
    }*/
    /*if(Trigger.isAfter && Trigger.isInsert || Trigger.isUpdate){
    		AccountTriggerHandler.setContactDes(Trigger.Newmap);
    }*/
    
    if(Trigger.isBefore && Trigger.isUpdate ){
    		AccountTriggerHandler.setOldPhone(Trigger.New);
    }
    
    if(Trigger.isBefore && Trigger.isDelete ){
    		//AccountTriggerHandler.deleteEvent(Trigger.old);
        	//AccountTriggerHandler.deleteEventActive(Trigger.old);
        	//AccountTriggerHandler.deleteAccOppo(Trigger.old);
        	//AccountTriggerHandler.deleteAccContact(Trigger.old);
    }
    
     if(Trigger.isBefore && Trigger.isInsert ){
    		accountClassDatadase.acInsert(Trigger.New);
    }
    
    if(Trigger.isAfter && Trigger.isInsert ){
    		UnsolvedScenarios.code7(Trigger.New);
    }
    
   /*if(Trigger.isAfter && Trigger.isInsert ){
    		UnsolvedScenarios.code8(Trigger.New);
    }*/
    
    /*if(Trigger.isAfter && Trigger.isInsert ){
    		UnsolvedScenarios.code9(Trigger.New);
    }
    if(Trigger.isBefore && Trigger.isUpdate ){
    		UnsolvedScenarios.code10(Trigger.New);
    }*/
    
    /*if(Trigger.isBefore && Trigger.isUpdate ){
    		AccountTriggerHandler.code11(Trigger.New);
    }
    
    if(Trigger.isBefore && Trigger.isDelete ){
    		AccountTriggerHandler.code12(Trigger.old);
    }*/
    
    /*if(Trigger.isAfter && Trigger.isInsert || Trigger.isUpdate ){
    		AccountTriggerHandler.code13(Trigger.Newmap);
    }*/
    
    if(Trigger.isAfter && Trigger.isUpdate){
    		AccountTriggerHandler.code14(Trigger.Newmap);
    }
    
    /*if(Trigger.isAfter && Trigger.isUpdate ){
    		AccountTriggerHandler.code17(Trigger.Newmap);
    }*/
    
    /*if(Trigger.isAfter && Trigger.isUpdate ){
    		UnsolvedScenarios.code18(Trigger.New);
    }*/
    
    if(Trigger.isBefore && Trigger.isInsert ){
    		UnsolvedScenarios.code21(Trigger.New);
    }
    
    /*if(Trigger.isBefore && Trigger.isDelete ){
    		AccountTriggerHandler.dataProtection(Trigger.old);
    }*/
    
    if(Trigger.isAfter && Trigger.isUndelete){
    		AccountTriggerHandler.afterUndelete(Trigger.New);
    }
    
  }