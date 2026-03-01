public class VotingAgeCalculator {
    
    public static void checkAge(String dateOfBirth){
        
        Date voterDOB = date.parse(dateOfBirth);
        Date currentDate = system.today();
        
        Integer totalDays = voterDOB.daysBetween(currentDate);
        Decimal ageOfVoter = totalDays/365;
        
        if(ageOfVoter >= 18){
            system.debug('Person is eligible to vote in 2025');
        }else{
        	system.debug('Person is not elible to vote in 2025');
        }
    }
    
    public static void checkDivisibility(Integer n){
        
        if(n != null){
            
            if(math.mod(n,7)==0 && math.mod(n,11)==0){
                
                system.debug('The Number '+n+' is divisible by both 7 and 11');
            }else{
                system.debug('Number is not divisible by 7 and 11');
            }
        }
    }

}