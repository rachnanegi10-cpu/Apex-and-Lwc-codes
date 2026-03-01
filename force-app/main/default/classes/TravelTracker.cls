public class TravelTracker {
    
    public static Map<Integer,List<String>> placesVisitedDirectory = new Map<Integer,List<String>>();
    public static List<String> myWishList;
    public static integer i;
    
    
    public static Map<Integer,List<String>> captureLocation(String countryName, Integer yearOfVisit){
       
        if(placesVisitedDirectory.containsKey(yearOfVisit)){
            
            List<String> countriesVisited = placesVisitedDirectory.get(yearOfVisit);
            countriesVisited.add(countryName);
            placesVisitedDirectory.put(yearOfVisit,countriesVisited);
        }
        else{
            placesVisitedDirectory.put(yearOfVisit,new List<String> {countryName});
        }
        
        return placesVisitedDirectory;
        
    }
    
    public static List<string> wishListTracker(string countryIWishToVisit){
        
        if(myWishList==null){
            myWishList = new List<string>{countryIWishToVisit};
        }
        else{
            myWishList.add(countryIWishToVisit);
        }
        
        return myWishList;
    }
    
    public static List<String> showCountriesVisited(Integer yearOfVisit){
        
        return placesVisitedDirectory.get(yearOfVisit);
    }
    
    public static Void retriveCountryCount(){
       Map<string,Integer> newMap = new Map<String,Integer>();
       
        for(List<String> relatedString:placesVisitedDirectory.values()){
            
            for(string places:relatedString ){
                
                if(newMap.containsKey(places)){
                
             			newMap.put(places,newMap.get(places)+1);
            }
                else{
                    newMap.put(places,1);
                }
             
            
        }
             
     // return (placesVisitedDirectory.get(yearOfVisit)).size();
        
    }
        for(string s: newMap.keyset()){
            
            Integer count = newMap.get(s);
   			system.debug(' '+s+' : '+count); 
        }

}
}