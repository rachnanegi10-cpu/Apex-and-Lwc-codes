public class SetAssignment {
    
    public static void setOfIntegers(){
        set<Integer> setInteger = new set<Integer>{1,2,3,4,5};
        system.debug('Set of integer: '+setInteger);
    }

    public static void setOfAddAll(){
        set<Integer> setInteger = new set<Integer>{10,20,30};
        system.debug('Set of integer: '+setInteger);
        set<Integer> setNew = new Set<Integer>{30,40,50};
        setInteger.addAll(setNew);
        system.debug('Add All Set: '+setInteger);
    }
    
    public static void setOfRemove(){
        set<Integer> setInteger = new set<Integer>{100,200,300,400};
        system.debug('Set of integer: '+setInteger);
        setInteger.remove(300);
        system.debug('Set after removing 300: '+setInteger);
        
    }
    
    public static void setOfClear(){
        set<Integer> setInteger = new set<Integer>{11,22,33,44};
        system.debug('Set of integer: '+setInteger);
        setInteger.clear();
        system.debug('Set after Clear: '+setInteger);
        
    }
    
    public static void setOfClone(){
        set<String> setString = new set<String>{'Apple','Banana','Cherry'};
        system.debug('Set of integer: '+setString);
        set<String> setNew = new Set<String>{'Date'};
        setNew = setString.clone();
        system.debug('Set after Clone: '+setNew);
        
    }
    
    public static void setOfStringAddAll(){
        set<String> setString = new set<String>{'Red','Green'};
        system.debug('Set of integer: '+setString);
        set<String> setNew = new Set<String>{'Blue','Yellow'};
        setNew.addAll(setString);
        system.debug('Set after Add All: '+setNew);
        
    }
    
    public static void setOfStringRemovel(){
        set<String> setString = new set<String>{'Dog','Cat','Fish'};
        system.debug('Set of integer: '+setString);
        setString.remove('Cat');
        system.debug('Set after remove: '+setString);
        
    }
    
    public static void setOfSObjects(){
        set<Account> setAccount = new set<Account>{new Account(Name = 'Google'),new Account(Name ='Microsoft'), new Account(Name='Salesforce')};
        system.debug('Set of Account: '+setAccount);
        
        List<Account> acc = [Select id ,Name from Account where Name =: 'Microsoft'];
        
        if(acc.size()>0){
            
            for(Integer i =0; i>=acc.size()-1; i++){
              setAccount.remove(acc[i]);  
            }
          system.debug('Set of Account after remove: '+setAccount);  
            
            
        }
    }
        
        public static void setContact(){
        set<Contact> setContact = new set<Contact>{new Contact(LastName = 'Alice Brown'),new Contact(LastName ='Bob White')};
        system.debug('Set of Account: '+setContact);
        
        List<Contact> con = [Select id ,LastName from Contact where LastName =:'Alice Brown' And LastName = 'Bob White'] ;
        
        if(con.size()>0){
            setContact.clear();  
            if(setContact.isEmpty()){
            
          		system.debug('Set of Account: '+setContact);  
            
            }
        }
      }
        public static void sobjectOpportunitySet(){
        try{
        SET<Opportunity> lst = new Set<Opportunity>();
        lst.add(new Opportunity(Name = 'Deal A',Amount=2500,StageName='Prospecting',CloseDate=system.today()));
        lst.add(new Opportunity(Name = 'Deal B',Amount=5000,StageName='Prospecting',CloseDate=system.today()));
        
        system.debug('Opportunity List: '+lst);
        Set<Opportunity> lst2 = new Set<Opportunity>();
        lst2 = lst.clone();
        system.debug('Opportunity List : '+lst2);
        lst2.add(new Opportunity(Name = 'Deal C',Amount=3000,StageName='Prospecting',CloseDate=system.today(),AccountId='001dM00003KhFehQAF'));
       
            system.debug('Modified Opportunity List : '+lst2);
        }
        catch(DMLEXCEPTION e){
            System.debug('Error: '+e.getmessage());
            System.debug('Error: '+e.getlinenumber());
        }
        
        
    }

        
        
    
    
 }