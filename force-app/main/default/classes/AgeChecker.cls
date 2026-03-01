public class AgeChecker {
    
    static date current_date = system.today();
    
    public static void age(integer years, integer months,integer day){
       //date dateOfbirth ;
       
        calculateAge(years,months,day);
    }
    
    private static void calculateAge(integer years, integer months,integer day){
        string message = 'Your Age is :'; 
        
        if(years >0 && months >0 && day>0){
        date birth_date = date.newInstance(years,months,day);
        decimal days = birth_date.daysBetween(current_date);
        Integer age = Integer.valueOf(days /365);
        system.debug(+message+age);
        }
        else{
            system.debug('Enter valid date');
        }
    }
    
    

}