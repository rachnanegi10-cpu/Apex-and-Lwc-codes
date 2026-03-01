public with sharing class displayClass {
   
    @AuraEnabled(cacheable=true)
    public static List<Account> displayAccount(){
        return [Select Id,Name,Industry,Type From Account limit 10];
    }
}