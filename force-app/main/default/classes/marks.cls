public virtual class marks {
    
   protected  void scoreCard(map<string,integer> myReportCard){
        
        
        Integer maxMarks =0;
        Integer minMarks =0;
        
        for(string subject: myReportCard.keyset()){
            
            if(minMarks == 0){
            				  minMarks =myReportCard.get(subject);
            }
            
            Integer subjectMarks =myReportCard.get(subject);
            
            if(maxMarks < subjectMarks){
                maxMarks = subjectMarks;
            }
            
            if(minMarks > subjectMarks ){
                minMarks = subjectMarks;
            }
          }
        system.debug('Max marks: '+maxMarks);
        system.debug('Min marks: '+minMarks);
      handleMap(myReportCard);
    }

private void handleMap(map<string,integer> mymap){
    
    List<integer> allMyMarks = mymap.values();
    allMyMarks.sort();
    system.debug('Sorted Max Marks: '+allMyMarks[allMyMarks.size()-1]);
    system.debug('Min Marks: '+allMyMarks[0]);
}

}