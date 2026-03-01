public with sharing class fetchdatatable {
 
    @AuraEnabled(cacheable=true)
    public static List<Account> accountData(){

        return [Select Id,Name,Type From Account Limit 5];
        
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> contactData(Id val){

        return [Select AccountId, FirstName,LastName,Email,Id From Contact Where AccountId = :val Limit 5];
    }
}