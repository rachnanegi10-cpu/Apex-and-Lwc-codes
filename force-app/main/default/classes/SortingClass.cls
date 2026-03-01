public class SortingClass {
    
    public static List<Integer> sortingListAscending(List<Integer> listInteger){
        
        for(integer i= listInteger.size()-1; i>=0; i--){
            for(integer j=i-1; j>=0; j--){
                
                if(listInteger[j]<listinteger[i]){
                   // do nothing
                    
                }
                else{
                    integer temp = listInteger[j];
                    listInteger[j]=listInteger[i];
                    listInteger[i]=temp;
                }
            }
        }
        
        return listInteger;
    }
    
    public static List<Integer> sortingListDescending(List<Integer> listInteger){
        
        for(Integer i=listInteger.size()-1; i>=0; i--){
            for(Integer j=i-1; j>=0; j--){
                if(listInteger[j] > listInteger[i]){
                    //do nothing
                }else{
                    
                    integer temp= listInteger[j];
                    listInteger[j] = listInteger[i];
                    listInteger[i] = temp;
                }
            }
        }
        
        return listInteger;
    }

}