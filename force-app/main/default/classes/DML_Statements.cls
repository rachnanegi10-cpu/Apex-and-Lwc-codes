public class DML_Statements {

    public static void upsertCommand(){
        
        Account acc = new Account(Name = 'Rachna');
        insert acc;
        
        List<Account> acc1= [select id,Industry,Rating from account where name='Rachna'];
        for(Account ac : acc1){
            ac.Name = 'Negi';
            ac.Rating='Hot';
            ac.Industry='Billing';
        }
        
        upsert acc1;
    }
    
    public static void deleteCommand(){
        
		//List<case> cas= [select id from case where CaseNumber='00001026 '];
        //delete cas;
        
        List<Account> acc= [select id,name from Account ];
        
        for(account a1:acc){
            a1.name='Negi';
        }
        delete acc;
    }
}