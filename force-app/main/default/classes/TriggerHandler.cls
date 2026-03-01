public class TriggerHandler {
    
    /*Insert Contact Method whenever an Acoount is inserted
	 *Used: AccountTrigger
	 *Param:List<Account>
	*/
    
    public static void triggerInsertMethodForContact(List<Account> accountList){
        List<Contact> contactList = new List<Contact>();
        
        for(Account accountRec: accountList){
            
            Contact contactRec=new Contact();
            contactRec.AccountId = accountRec.Id;
            contactRec.FirstName='Trigger Account';
            contactRec.LastName =accountRec.Name;
            contactRec.Email=accountRec.Name+'@gmail.com';
            contactList.add(contactRec);
        }
        if(!contactList.isEmpty()){
        database.insert(contactList,false);
        }
    }
    
    /*Insert Opportunity Method whenever an Acoount is inserted
	 *Used: AccountTrigger
	 *Param:List<Account>
	*/
    public static void triggerInsertMethodForOpportunity(List<Account> accountList){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account accountRec: accountList){
            Opportunity oppRec = new Opportunity();
            oppRec.AccountId = accountRec.Id;
            oppRec.Name = accountRec.Name;
            oppRec.StageName ='Prospecting';
            oppRec.CloseDate = system.today()+30;
            oppList.add(oppRec);
        }
        if(!oppList.isEmpty()){
        database.insert(oppList,false);
        }
        
    }
    
    /*Insert Case Method whenever an Acoount is inserted
	 *Used: AccountTrigger
	 *Param:List<Account>
	*/
    public static void triggerInsertMethodForCase(List<Account> accountList){
        List<Case> caseList = new List<Case>();
        for(Account accountRec: accountList){
            Case caseRec=new Case();
            caseRec.AccountId=accountRec.Id;
            caseRec.status = 'New';
            caseRec.Origin ='Email';
            caseList.add(caseRec);
        }
        if(!caseList.isEmpty()){
        database.insert(caseList,false);
        }
    }
    
    /*Insert Opportunity Method whenever an Acoount is inserted
	 *Used: AccountTrigger
	 *Param:List<Account>
	*/
    
    public static void triggerInsertOppClosedWon(List<Account> accountList){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account accountRec: accountList){
            if(accountRec.Industry == 'Apparel'){
            Opportunity oppRec = new opportunity();
            oppRec.AccountId = accountRec.id;
            oppRec.Name = accountRec.Name;
            oppRec.CloseDate = system.today()+20;
            oppRec.StageName ='Closed - Won';
            oppList.add(oppRec);
            }else{
                accountRec.Industry.addError('Industry should be Apparel');
            }
            
        }
        if(!oppList.isEmpty()){
            database.insert(oppList,false);
        }
        
    }
    
    Public static void triggerMethodOppGraceDate(List<Opportunity> oppList){
        for(Opportunity oppRec: oppList){
            if(oppRec.CloseDate == system.today()){
                oppRec.Grace_Date_Of_Contract__c = oppRec.CloseDate+15; 
            }
        }
    }
    

}