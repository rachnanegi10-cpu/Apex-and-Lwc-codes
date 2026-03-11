public with sharing class ERPClass {
   @AuraEnabled(cacheable=true)
    public  static list<Account> GetAcc()
     {
        return[select Id, Name,Type,Industry from Account limit 10];
        
    }

    @AuraEnabled(cacheable=true)
    public  static list<Case> GetCase()
     {
        return[select Status,CaseNumber From Case limit 10];
        
    }

    @AuraEnabled(cacheable=true)
    public  static list<Lead> GetLead()
     {
        return[select Status,Name from Lead limit 10];
        
    }

    @AuraEnabled(cacheable=true)
    public  static list<Contact> GetContact(string accountId)
     {
        return[select Id,FirstName,LastName,Email,AccountId from Contact where AccountId=:accountId limit 10];
        
    }

    @AuraEnabled(cacheable=true)
    public  static list<Opportunity> GetOpp(string accountId)
     {
        return[select Id,AccountId from Opportunity where AccountId=:accountId limit 10];
        
    }

    @AuraEnabled(cacheable=true)
    public  static list<Contract> GetContract()
     {
        return[select Id from Contract limit 10];
        
    }

}