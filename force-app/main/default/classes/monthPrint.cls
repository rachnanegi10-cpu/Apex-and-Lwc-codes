public class monthPrint {

    public static void printStar_Pattern() {
        Integer total_Row = 5; 

       
        for (Integer i = 5; i <total_Row; i++) {
            String row1 = ''; 

            
            for (Integer j = 0; j < i; j++) {
                row1 += '*'; 
                
            }
            System.debug(row1); 
            System.debug(row1);
        }
    }
    
    public static void printStar_Patterninreverese(){
    
    integer total_row = 5;
    
        for(integer i = total_row; i>0; i--){
            
            string row2 ='';
            
            for (Integer j = 5; j > i; j--) {
                row2 += '*'; 
            }
            System.debug(row2);
            
        }
        
        }
}