public class PostSaleaContractUpdates implements Queueable {
    public list<Id> contractId;
    public String newStatus;
    
    public PostSaleaContractUpdates(list<Id> contractId,String newStatus){
        this.contractId = contractId;
        this.newStatus = newStatus;
    }
    
    public void execute(QueueableContext context){
        List<Contract> contractList = [SELECT Id,Status,Description FROM Contract WHERE Id in:contractId ];
        
        for(Contract rec:contractList){
            rec.status=this.newStatus;
            rec.Description='Contract Updated';
        }
        
        if(!contractList.isEmpty()){
            update contractList;
            system.debug('Contract Updated'+contractList.size());
        }
        
        EmailFutureCall.sendEmail();
    }
    

}