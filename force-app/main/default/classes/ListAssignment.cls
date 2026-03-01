public class ListAssignment {
    
    public static void addItem(){
        List<Integer> lst = new List<Integer>();
        lst.add(10);
        lst.add(20);
        lst.add(30);
        lst.add(40);
        lst.add(50);
        
        system.debug('List '+lst);
    }
    
    public static void appendLists(){
        List<Integer> lst = new List<Integer>{5, 15, 25};
        List<Integer> lst1 = new List<Integer>{35, 45};
            lst.addAll(lst1);
        
        system.debug('Combination of the lists: '+lst);
    }
    
    public static void removeElement(){
        List<Integer> lst = new List<Integer>{5, 15, 25};
        lst.remove(0);
        
        system.debug('remove lists: '+lst);
    }
    
    public static void clearList(){
        List<Integer> lst = new List<Integer>{100, 200, 300};
        lst.clear();
        
        system.debug('Clear lists: '+lst);
    }
    
     public static void cloneList(){
        List<String> lst = new List<String>{'Alpha', 'Beta', 'Gamma'};
        List<String> delta =lst.clone();
        system.debug('Clone lists: '+delta);
    }
    
    public static void addAllList(){
        List<String> lst = new List<String>{'Red', 'Blue'};
        List<String> delta =new List<String>{'Green', 'Yellow'};
        lst.addAll(delta);
        system.debug('Add All lists: '+lst);
    }
    
    public static void removeValueList(){
        List<String> lst = new List<String>{'Dog', 'Cat', 'Bird'};
        lst.remove(1);
        system.debug('remove string lists: '+lst);
    }
    
    public static void sobjectList(){
        List<Account> lst = new List<Account>();
        lst.add(new Account(Name = 'Acme Corp'));
        lst.add(new Account(Name = 'Global Tech'));
        lst.add(new Account(Name = 'Fast Solution'));
        insert lst;
        system.debug('Account List: '+lst);
        
        lst.remove(1);
        
        update lst;
        system.debug('Account List after remove: '+lst);
    }
    
    public static void sobjectContactList(){
        List<Contact> lst = new List<Contact>();
        lst.add(new Contact(LastName = 'John Doe'));
        lst.add(new Contact(LastName = 'Jane Smith'));
        insert lst;
        system.debug('Contact List: '+lst);
        lst.clear();
        system.debug('Contact List after clear: '+lst);
    }
    
    public static void sobjectOpportunityList(){
        try{
        List<Opportunity> lst = new List<Opportunity>();
        lst.add(new Opportunity(Name = 'Big Deal',Amount=2500,StageName='Prospecting',CloseDate=system.today()));
        lst.add(new Opportunity(Name = 'Small Deal',Amount=5000,StageName='Prospecting',CloseDate=system.today()));
        insert lst;
        system.debug('Opportunity List: '+lst);
        List<Opportunity> lst2 = new List<Opportunity>();
        lst2 = lst.clone();
        system.debug('Opportunity List : '+lst2);
        lst2.add(new Opportunity(Name = 'Medium Deal',Amount=3000,StageName='Prospecting',CloseDate=system.today(),AccountId='001dM00003KhFehQAF'));
        insert lst2[2];
            system.debug('Modified Opportunity List : '+lst2);
        }
        catch(DMLEXCEPTION e){
            System.debug('Error: '+e.getmessage());
            System.debug('Error: '+e.getlinenumber());
        }
        
        
    }



}