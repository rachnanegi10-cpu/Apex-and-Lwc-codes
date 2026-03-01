public class wire3 {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
        return[select id,name,(select name,phone from contacts) from Account where id in(select AccountId from contact)];
    }
}