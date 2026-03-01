public class handlePassword {
    public static string correctPassword ='Rachna@123';
    public static integer attemptCounter = 1;
    
    
    public static void attempDifferentPassword(){
        string finalAnswer;
        finalAnswer=handlePasswordCorrect('Rachn123'); 
        system.debug(finalAnswer);
        finalAnswer=handlePasswordCorrect('Rachn1234'); 
        system.debug(finalAnswer);
        finalAnswer=handlePasswordCorrect('Rachn1235'); 
        system.debug(finalAnswer);
        finalAnswer=handlePasswordCorrect('Rachn1235'); 
        system.debug(finalAnswer);
    }
    
    public static string handlePasswordCorrect(string password){
        if(password != correctPassword){
            
            if(attemptCounter > 3){
             return 'Maximum attempt reached now';   
            }
            attemptCounter++;
            return 'Failiur';
        }else{
            return 'Success';
        }
    }

}