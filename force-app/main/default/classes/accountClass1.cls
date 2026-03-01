public class accountClass1 {
    
    public List<wrapClass> wraplist{get;set;}
    public List<Account> acselected{get;set;}
    public List<wrapClass> getAccounts1(){
        if(wraplist==null){
            wraplist=new list<wrapClass>();
            for(Account a:[select id,name,type,Active__c from account limit 10]){
                wraplist.add(new wrapClass(a));
            }
        }
        return wraplist;
        
    }
    
    public void action1(){
        acselected = new List<Account>();
        for(wrapClass c:getAccounts1()){
            if(c.selected==true){
                acselected.add(c.ac);
            }
        }
    }

}