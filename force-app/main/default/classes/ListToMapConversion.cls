public class ListToMapConversion {
    
    public static void listToMapConversion(){
        
        List<Account> acc = [SELECT Id,Name,Type FROM ACCOUNT Limit 10];
        map<Id,Account> accountMap = new map<Id,Account>();
        
        for(Account acc1: acc){
            accountMap.put(acc1.id,acc1);
        }
        
        system.debug('Map values:'+accountMap);
        
    }
    
    /* Update all contacts whose account name is a% and status is active 
     * Method Name:contactUpdateWithMap 
     * Parameters : No
     * Return Type: Void
     */
    
    public static void contactUpdateWithMap(){
        
        List<Contact> contacttList = [SELECT AccountId, FirstName,LastName FROM CONTACT WHERE ACCOUNT.NAME LIKE 'a%' AND ACCOUNT.Active__c ='Yes'];
    	Map<Id,CONTACT> contactMap = new Map<Id,CONTACT>(contacttList);
        
        for(ID key: contactMap.keyset()){
            
            CONTACT con = contactMap.get(key);
            con.Email = 'as@gmail.com';
            contactMap.put(key,con);
        }
        
        update contactMap.values();
        system.debug('Show updated map: '+contactMap);
    }
    
    /* Method that takes list as parameter and select vowels 
     * Method Name:vowelSelector
     * Parameters : List of String
     * Return Type: Void
     */
    
    public static void vowelSelector(List<String> listOfString){
        List<String> listOfVowel = new List<String>{'a','e','i','o','u'};
        MAP<String,List<String>> mapOfList = new MAP<String,List<String>>();
        
        for(String s:listOfVowel){
            mapOfList.put(s,new List<String>());
        }
        
        mapOfList.put('consonants',new List<String>());
        for(String input:listOfString){
            
            String newStr = input.substring(0,1).toLowerCase();
            
            if(mapOfList.containskey(newStr)){
            		mapOfList.get(newStr).add(input);
            }else{
                mapOfList.get('consonants').add(input);
            }
        }
        
        system.debug('The vowel and consonant map: '+mapOfList);
    }

}