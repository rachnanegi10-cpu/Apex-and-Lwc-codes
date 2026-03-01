public class databaseClass {
    
    public static void databaseInsert(){
        
        List<Lead> ld = new list<lead>{new lead(lastname ='Negi',company ='Almamate',email='rnegi@gmail.com'),
            							new lead(lastname ='Rawat',company ='Almamate',email='rnegi@gmail.com'),
            							new lead(lastname ='Rawat2',company ='Almamate',email='rnegi@gmail.com')};
                                            
        database.saveresult[] res = database.insert(ld,false);
        
        for(database.saveresult r:res){
            
            if(r.issuccess()){
                
                system.debug('Lead inserted successfully: '+r.getid());
            }
            else{
                
                database.error[] error = r.geterrors();
                
                for(database.error er:error){
                    system.debug('Error in handling data: '+er.getmessage());
                    system.debug('Error in handling data: '+er.getstatuscode());
                }
            }
        }
        
    }
    
    public static void databaseDelete(){
        
        List<lead> ld = [select lastname, company from lead where lastname like 'r%'];
        
        database.deleteresult[] del = database.delete(ld,false);
        
        for(database.deleteresult de: del){
            if(de.issuccess()){
        		system.debug('The deleted leads are: '+de.getid());
            }
            
            else{
                
                database.error[] error = de.geterrors();
                
                for(database.error er: error){
                    
                    system.debug('The error in handling data:'+er.getstatuscode());
                    system.debug('The error in handling data:'+er.getmessage());
                }

            }
        }
    }
    
    public static void databaseUpdate(){
        
        list<Lead> ld = [select id,firstname,lastname,email,company from Lead  limit 10];
        
        for(Lead lds: ld){
            
            lds.email = 'rachna@gmail.com';
            lds.company = 'INSTIC';
        }
        
        database.saveresult[] result = database.update(ld,false);
        
        for(database.saveresult res: result){
            
            if(res.issuccess()){
                
                system.debug('The update is successfull: '+res.getid());
                
            }
            else{
                
                database.error[] error = res.geterrors();
                
                for(database.error e : error){
                    
                    system.debug('The data is not updated: Message: '+e.getmessage()+' Error Code :'+e.getstatuscode());
                }
            }
        }
    }
    
    public static void databaseUndelete(){
        
        list<Lead> leads = [select id from Lead where isdeleted=true All Rows];
        database.undeleteresult[] undel = database.undelete(leads,false);
            
        for(database.undeleteresult del: undel){
            
            if(del.issuccess()){
                system.debug('data is undeleted successfully '+del.getid());
            }
            else{
                
                database.error[] error = del.geterrors();
                
                for(database.error er: error){
                    
                    system.debug('Error Message: '+er.getmessage());
                }
            }
            
        }
        
    }
    
    

}