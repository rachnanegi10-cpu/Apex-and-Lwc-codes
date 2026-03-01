public with sharing class wireContactController {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String accId){
        try {
            return [select AccountId,FirstName,LastName 
            from Contact Where AccountId =: accId
            WITH SECURITY_ENFORCED];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}