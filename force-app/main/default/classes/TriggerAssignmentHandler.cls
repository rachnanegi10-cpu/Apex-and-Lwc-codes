public class TriggerAssignmentHandler {
    
    public static void opp(List<Opportunity> oplist){
        
        for(Opportunity o: opList){
            if(o.CloseDate == null){
               o.CloseDate = system.today() + 10;
               o.Amount = o.Amount +(o.Amount*10)/100;
            }
        }
       
    }

}