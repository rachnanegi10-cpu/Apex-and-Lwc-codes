public class ProjectTriggerHandler {
    
    public static void handleProject(List<Project__c> projectList){
        for(Project__c proRec:projectList){
            if(proRec.End_date__c!=null && proRec.Start_Date__c!=null){
                if(proRec.Start_Date__c < date.parse('01/03/2025'))
                    proRec.Contract_days__c = proRec.Start_Date__c.daysBetween(proRec.End_date__c);
            }
        }
    }

}