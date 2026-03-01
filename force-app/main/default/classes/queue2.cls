public class queue2 implements queueable{
    
    public static void execute(QueueableContext context){
        system.enqueuejob(new queue1());
        List<Lead> leadList = [Select firstname,lastname,company,leadsource from Lead where company like 'a%'];
        for(Lead leadRec:leadList){
            leadRec.leadsource ='Web';
        }
        update leadList;
    }

}