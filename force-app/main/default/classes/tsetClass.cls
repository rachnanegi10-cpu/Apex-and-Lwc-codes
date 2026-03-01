@isTest
public class tsetClass {
    
    @isTest
    public static void testLeadData(){
        
        List<Lead> l = new List<Lead>();
        l=Testdatafactory.createlead(5);
            
        
        system.assertEquals(l.size(),dispalyLead.displaylead(5).size());
    }

}