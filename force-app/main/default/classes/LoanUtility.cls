public class LoanUtility {
    
    public static void interest(decimal principal, decimal rate,decimal years){
        
        
        decimal simple_interest = termValidator(principal,rate,years);
        system.debug('Interest for '+years+' years is: '+simple_interest);
       
    }
    
    private static decimal termValidator(decimal principal, decimal rate, decimal years){
        
        decimal simple_interest;
        
        if(years > 0 && years < 100){
            
            system.debug('Term is Valid');
            simple_interest = (principal*rate*years)/100;
        	system.debug('Interest for '+years+' is: '+simple_interest);
        
        } else{
            system.debug('Enter valid term');
        }
        
        return simple_interest;
        
    }

}