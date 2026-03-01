public class LiabraryTracker {

    public static List<string> allMyBooks = new List<string>();
    
    public static Map<string,string> borrowerMapping = new Map<string,string>();
    
    public static void addBooksToLiabrary(string bookName){
        allMyBooks.add(bookName);
    }
    
    public static void lendBooksToSomeone(string bookName, String personName){
        
		List<string> remainingBooks = new List<string>();
       
        if(allMyBooks.contains(bookName)){
        borrowerMapping.put(bookName,personName);
        for(string eachBook : allMyBooks){
            if(eachBook != bookName){
        		remainingBooks.add(eachBook);
            }
        }
        
        allMyBooks = remainingBooks;
        }
    }
    
    public static Map<string,string> displayBooksBorrowed(){
		system.debug(borrowerMapping);
		return borrowerMapping;     
    }
    
    public static List<string> myCurrentRepository(){
		system.debug(allMyBooks);
		return allMyBooks;     
    }
}