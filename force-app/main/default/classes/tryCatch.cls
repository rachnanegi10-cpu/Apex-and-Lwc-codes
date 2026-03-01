public class tryCatch {
    

    public static void tryMethod(){
        
        try{
            List<Contact> con = new List<Contact>{
                new Contact(firstName = 'Rachna',lastname='Negi',email='rachna@gmail.com'),
                    new contact(firstName = 'Tapasya',lastname='Negi',email='tapi@gmail.com'),
                    new contact(firstName = 'Narmada',lastname='Negi',email='narmada@gmail.com')
            };
            
            insert con;
            system.debug('contact inserted');
        }
        
        catch(dmlexception e){
            system.debug('Show me error message '+e.getmessage());
            system.debug('Show me line number '+e.getlinenumber());
        }
    }
    
    public static void tryMethodNew(){
       
        string s;
        try{
            
        
            
            List<Contact> con = new List<Contact>{
                new Contact(firstName = 'Rachna1',lastname='Negi',email='rachna@gmail.com'),
                    new contact(firstName = 'Tapasya1',lastname='Negi',email='tapi@gmail.com'),
                    new contact(firstName = 'Narmada1',lastname='Negi',email='narmada@gmail.com')
            
                    };
                    insert con;
        }
        
        catch(dmlexception e){
            
            system.debug('Show me message error '+e.getmessage());
        }
        
        try{
            s.tolowercase();
        }
        
        catch(nullpointerexception e){
            
            system.debug('show me error message '+e.getmessage());
        }
        
        finally{
            
            s='ANRRT';
            system.debug('show me s: '+s.tolowercase());
        }
    }
}