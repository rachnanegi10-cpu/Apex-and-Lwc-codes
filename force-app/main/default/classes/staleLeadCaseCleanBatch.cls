public class staleLeadCaseCleanBatch implements database.batchable<sobject>{
    
    public database.querylocator start(database.batchablecontext bc){
        string query = 'select id from lead where LastModifiedDate < LAST_N_DAYS:90 ';
        return database.getquerylocator(query);
    }
    
    public void execute(database.batchablecontext bc, List<Lead> scope){
        
        if(!scope.isEmpty()){
            delete scope;
        }
    }
    
    public void finish(database.batchablecontext bc){
        List<Lead> l = [select id,isDeleted from Lead where isDeleted=true];
        system.debug('Deleted Leads: '+l);
    }
    

}