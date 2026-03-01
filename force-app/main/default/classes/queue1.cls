public class queue1 implements queueable{
    
    public static void execute(QueueableContext context){
        List<Lead> leadList = new List<Lead>();
        for(Integer i=1; i<4; i++){
            Lead leadRec = new Lead();
            leadRec.LastName = 'xyz'+i;
            leadRec.Company ='Almamate'+i;
            leadRec.Email='alamamate@gmail.com';
            leadList.add(leadRec);
        }
        insert leadList;
    }

}