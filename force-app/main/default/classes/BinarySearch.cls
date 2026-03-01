public class BinarySearch {
    
    public static Integer binarySerchMethod(List<Integer> searchList,Integer searchElement){
        Integer leftNode = 0;
        Integer rightNode = searchList.size()-1;
        while(leftNode<=rightNode){
        	Integer rootNode = leftNode+(rightNode-leftNode)/2;
            if(searchList[rootNode] == searchElement){
                return rootNode;
            }else if(searchList[rootNode]<searchElement){
                leftNode = rootNode+1;
                
            }else{
                rightNode=rootNode-1;
            }
        
        }
        return -1;
    }

}