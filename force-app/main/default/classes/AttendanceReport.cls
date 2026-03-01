public class AttendanceReport {
    
    public static Integer checkNewlearning(Map<String,boolean> weekLog){
      	integer numberOfDaysilearnt = 0;
        for(string weekDay: weekLog.keyset()){
           boolean currentStatus= weekLog.get(weekDay);
            if(currentStatus){
                numberOfDaysilearnt++;
            }
        }
        
        return numberOfDaysilearnt;
    }

}