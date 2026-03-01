public with sharing class displayAccount {
    @AuraEnabled(cacheable=true)
    public static List<Account> displayAccount(){
        
        return [SELECT Id, Name ,Industry,Type FROM Account LIMIT 10];
        
    }
}