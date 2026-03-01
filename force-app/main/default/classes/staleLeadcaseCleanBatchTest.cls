@isTest
public class staleLeadcaseCleanBatchTest {

    public static testmethod void testbatch(){
        
        test.startTest();
        Id jobid = database.executebatch(new staleLeadCaseCleanBatch());
        id newId = jobId;
        system.assertEquals(jobid,newId);
        test.stopTest();
    }
}