public class dispalyLead {
    public static list<lead> displaylead( integer x)
    {
        list<lead> ls=[select firstname,lastname,company from lead limit :x];
        return ls;
    }


}