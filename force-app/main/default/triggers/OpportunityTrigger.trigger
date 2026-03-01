trigger OpportunityTrigger on Opportunity (before insert,after insert,before update,after update) {
    
    /*if(Trigger.isInsert && Trigger.isBefore){
        TriggerHandler.triggerMethodOppGraceDate(Trigger.new);
    }*/
    
    /*if(Trigger.isInsert && Trigger.isAfter){
        TaskTriggerHandler.insertTaskOnOpportunityCreation(Trigger.new);
    }*/
    
   if(Trigger.isInsert && Trigger.isAfter){
        OpportunityTriggerHandler.insertOppoLineItem(Trigger.new);
    }
    
 /*      if(Trigger.isInsert && Trigger.isAfter){
       AggregationClass.aggrigationMethod(Trigger.new);
    }*/
    
          /*(Trigger.isInsert && Trigger.isAfter){
       			OpportunityTriggerHandler.aggregationOpportintity(Trigger.new);
    }*/
    
    /*if(Trigger.isBefore && Trigger.isUpdate){
		OpportunityTriggerHandler.oppAmountUpdateNotAllowed(Trigger.new);
		
	} */
/*if(Trigger.isBefore && Trigger.isUpdate){
		OpportunityTriggerHandler.handleOppRestriction(Trigger.new);
		
	}*/
    
    if(Trigger.isAfter && Trigger.isUpdate){
		OpportunityTriggerHandler.followUpTask(Trigger.new);
		
	}

}