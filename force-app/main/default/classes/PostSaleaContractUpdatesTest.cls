@isTest
public class PostSaleaContractUpdatesTest {
    
    public static testMethod void testJob(){
        List<Id> con = new List<Id>{'800dM00002nfTSGQA2'};
        test.starttest();
        id jobId = system.enqueuejob(new PostSaleaContractUpdates(con,'Activated'));
        id newJobId= jobId;
        system.assertequals(newJobId,jobId);
        test.stoptest();
        
    }

}