public class ContractTriggerHandler {
    public static void contractActivation(List<Contract> conList){
        List<String> idContract = new List<String>();
        for(Contract conRec:conList){
            if(conRec.AccountId != null && conRec.Status=='Activated'){
                idContract.add(conRec.AccountId);
            }
        }
        
        List<Account> accList = [Select email__c,id from Account where Id in:idContract ];
        
        for(Account acc:accList){
            List<String> email = new List<String>{acc.Email__c};
            Messaging.singleemailmessage emailMess = new messaging.singleemailmessage();
            emailMess.setSubject('Re: Contract Activation');
            emailMess.setplaintextbody('Contract has been activated');
            emailMess.setToAddresses(email);
            messaging.sendEmail(new messaging.singleemailmessage[]{emailMess});
        }
    }
    
    

}