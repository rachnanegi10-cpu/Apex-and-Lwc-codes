public class acronymFullForm {
    
    public static String checkacronym(String acronym){
        // We are using custom setting in this 
        // custom settings are stored in cache
        List<Acronym_Master__c> acroRec = [SELECT Id, Name, Full_Version__c FROM Acronym_Master__c WHERE Name =: acronym limit 1];
        
        if(acroRec.size() == 1){
            return acroRec[0].Full_Version__c;
        }
        return 'Not Specified';
    }

}