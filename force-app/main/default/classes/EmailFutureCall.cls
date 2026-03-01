public class EmailFutureCall {

    
    @future(callout=true)
    public static void sendEmail(){
        
        List<String> emailId = new List<String>{'rachnanegi.10@gmail.com'};
        Messaging.singleemailmessage emailM = new Messaging.singleemailmessage();
        emailM.setSubject('Future Call');
        emailM.setplaintextbody('This is future call email');
        emailM.setToAddresses(emailId);
        
        Messaging.sendemail(new messaging.singleemailmessage[]{emailM});
    }

}