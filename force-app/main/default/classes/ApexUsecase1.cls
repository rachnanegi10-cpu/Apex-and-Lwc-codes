public with sharing class ApexUsecase1 {
  

        public static void createContactRecord(String firstName, String lastName){

			List<Contact> conList = new List<Contact>();
            
            if(!string.isBlank(lastName)){
            Contact con = new Contact();
            con.FirstName=firstName;
            con.LastName=lastName;
            conList.add(con);
          
            }
            
            if(conList.size()>0){
                
                 insert conList;
                 System.debug('Contact Craeted');
            }
          
        }

    
}