public class EvaluationCode {
    
  
	
	public static void printStarPattern(){
		
		string s ='';
		integer i=1;
		
		do{
		
		if(i<=10){
				system.debug(+s+'*');
			}else if(i>10 && i<=99){
				
				system.debug('*'+s+'*');
			}
			else{
				
				system.debug('*'+s+'*'+s+'*');
			}
			
			i++;
		}while(i<=100);
	}
}