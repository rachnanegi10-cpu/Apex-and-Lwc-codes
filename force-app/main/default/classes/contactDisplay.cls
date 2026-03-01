public class contactDisplay {
    
    public List<Contact> conList{get;set;}
    public contactDisplay(accountDisplay acp){
        conList=[select firstname,lastname from contact limit 10];
    }

}