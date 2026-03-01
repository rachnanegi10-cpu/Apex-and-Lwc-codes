public class CertificationTracker {

    public static Map<String,Date> myCertificationData = new Map<string,date>();
    
    public static void addNewCertification(string certificateName, Date IsssueDate){
        myCertificationData.put(certificateName, IsssueDate);
        
    }  
    
    public static Integer returnCertCount(){
        return myCertificationData.size();
    }
    
    public static set<string> returnCertValues(){
        return myCertificationData.keyset();
    }
    
    public static List<Date> returnCertDate(){
        return myCertificationData.values();
    }
}