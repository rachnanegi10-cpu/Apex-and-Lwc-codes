public class sendEmailMessage {
    
    public static void senEmailMessage(String emailId){
        List<String> emailList = new List<String>{emailId};
        if(!string.IsBlank(emailId)){
            
            Messaging.SingleEmailMessage emailMessage = new Messaging.SingleEmailMessage();
            emailMessage.setSubject('Kindly Have a look At apex message');
            emailMessage.setPlainTextBody('Hello Rachna This Side. I am glad to see you. I need to fix the issues related to code.');
            emailMessage.setToAddresses(emailList);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {emailMessage});
        }
    }

}