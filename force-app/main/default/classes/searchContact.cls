public with sharing class searchContact {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContact(string accountId){
        return [select Name,AccountId,email,phone From Contact Where AccountId=:accountId];
    }
}