public class EmailMessageTriggerHandler {
    
    public static void sendmail(String emailId, string sub,string body){
        List<String> emailList = new List<String>{emailId};
        
        messaging.singleemailmessage emailMess = new messaging.singleemailmessage();
        emailMess.setToAddresses(emailList);
        emailMess.setPlainTextBody(body);
        emailMess.setSubject(sub);
        messaging.sendemail(new messaging.singleemailmessage[] {emailMess});
        
    }

}