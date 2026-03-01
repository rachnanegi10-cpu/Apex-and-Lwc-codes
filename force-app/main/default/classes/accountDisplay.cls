public class accountDisplay {
    public List<Account> getAccount1(){
    List<Account> acList = [select id,name,type,industry from Account Limit 10];
    return acList;
    }

}