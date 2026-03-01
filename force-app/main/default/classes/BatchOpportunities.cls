public class BatchOpportunities implements database.batchable<sObject> {
    
    public database.queryLocator start(database.batchablecontext context){
        system.debug('We are in start method');
        String firstString = 'Select Id,Name,StageName From Opportunity ';
        String secondString ='Where stagename =\'Perception Analysis\'';
        String finalString =firstString + secondString;
        return database.getqueryLocator(finalString);
    }
    
    public void execute(Database.BatchableContext context, List<Opportunity> oppList){
        for(Opportunity opp:oppList){
        	system.debug(opp.Name);
        }
    }
    public void finish(database.batchableContext context){
            system.debug('Finish method called');
        }
    

}