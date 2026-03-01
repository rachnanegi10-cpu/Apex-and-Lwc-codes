public class plantSelect {
    
    public static String inputPlantName(String plantName){
        
        String plantType ='Not Specified';
        
        List<Plant_Information_MetaData__mdt> plantInfo=[SELECT Id, MasterLabel, Plant_Type__c FROM Plant_Information_MetaData__mdt where MasterLabel = : plantName limit 1];
       
            
        if(plantInfo.size()==1){
                
                return plantInfo[0].Plant_Type__c;
            }
          
        
         return plantType;
    }

}