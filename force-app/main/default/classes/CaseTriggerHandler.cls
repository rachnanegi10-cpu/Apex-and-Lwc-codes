public class CaseTriggerHandler {
    
    public static void followUpTask(List<Case> caseList){
        
      List<Task> taskList = new List<task>();
        for(Case caseRec:caseList){
            if(caseRec.Id !=null ){
                Task taskRec = new Task();
                taskRec.WhatId = caseRec.Id;
                taskRec.Description = 'Follow up task on Case update';
                taskList.add(taskRec);
            }
        }
        if(!taskList.isEmpty()){
        	Insert taskList;
    	}
    }
    
    Public static void sendEmail(List<case> caseList){
        List<String> email = new List<String>();
        for(Case caseRec: caseList){
            if(caseRec.Status=='Escalated'){
                email.add(caseRec.ContactEmail);
            }
        }
        
        Messaging.singleemailmessage emailMessage = new Messaging.SingleemailMessage();
        emailMessage.setSubject('Re: Case Escalated');
        emailMessage.setToAddresses(email);
        emailMessage.setPlaintextbody('Case is escalated');
        
        Messaging.sendEmail(new messaging.singleemailmessage[]{emailMessage});
    }

}