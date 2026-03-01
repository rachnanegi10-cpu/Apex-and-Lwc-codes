public class vowelCalulator {
    
    public static List<string> vowelList = new List<String>{'a','e','i','o','u'};
    
    public static list<integer> countVowelPerString(List<string> myStatements){
        List<Integer> totalVowelCounts = new List<Integer>();
        
        for(string s: myStatements){
            
            if(vowelList.size() == 5){
                
                Integer vowelCount = s.toLowerCase().countMatches(vowelList[0])+
                    				 s.toLowerCase().countMatches(vowelList[1])+
                                     s.toLowerCase().countMatches(vowelList[2])+
                                     s.toLowerCase().countMatches(vowelList[3])+
                                     s.toLowerCase().countMatches(vowelList[4]);
                     totalVowelCounts.add(vowelCount);     
            }
        }
        
        
        return totalVowelCounts;
    }

}