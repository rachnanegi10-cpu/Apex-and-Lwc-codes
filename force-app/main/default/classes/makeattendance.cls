public class makeattendance {
		
    public static integer checkmakesensekeyword(list<string> state){
        
        integer counter =0;
        for(string stateNew : state){
            if(stateNew.containsIgnoreCase('Makes sense')) {
                
                counter++;
                
            } 
        }
        return counter;
    }
}