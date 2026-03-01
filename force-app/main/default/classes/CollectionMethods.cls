public class CollectionMethods {

    public static List<string> listMethod(List<String> ls){
        
        system.debug(ls);
        return ls;
    }
    
     public static List<Lead> listMethod(){
        List<Lead> ls = [select id from lead]; 
        system.debug(ls);
        return ls;
    }
    
    public static void listMethodDuplicacy(){
        List<Lead> ls = [select id from lead]; 
        system.debug(ls);
        //return ls;
    }
    
    public static void checkListDuplicay(list<string> lstStr){
        //list<string> lstStr1 = new list<string>(lstStr);
        list<string> lstStr2 = new list<string>();  
        integer len = lstStr.size();
        
       for(integer i =len-1; i>=0; i--){
            
            for(integer j=i-1; j>=0; j--){
                
                if(lstStr.get(i) == lstStr.get(j)){
                    
                    lstStr.remove(i);
                    break;
                }
            }
        
    	}
        system.debug('Print List: '+lstStr);
    }
   
    public static list<integer> reverseList(list<integer> oldList){
       
        list<integer> newList = new list<integer>();
        for(integer i = oldList.size()-1; i>=0 ; i--){
            newList.add(oldList.get(i));
        } 
        system.debug('Reverse List is: '+newList);
        return newList;
    }
    
    public static list<integer> reverseListWithSwap(list<integer> oldList){
       
        integer x = oldList.size()-1;
        for(integer i =0 ; i<x ; i++){
           
            integer temp = oldList[i];
            oldList[i]=oldList[x];
            oldList[x]=temp;
            x--;
           
        } 
        system.debug('Reverse List is: '+oldList);
        return oldList;
    }
}