public class Testdatafactory {
    public static list<lead> createlead(integer num)
    {
        list<lead>ls=new list<lead>();
        for(integer i=1;i<num;i++)
        {
            lead l=new lead();
            l.firstname='lead data '+i;
            l.lastname=' lastname of lead '+i;
            l.company='Almamate '+i;
            l.Email='alma@gmail.com';
            ls.add(l);
                
        }
        insert ls;
        return ls;
    }

}