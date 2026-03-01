public class UnsolvedMilestone {
    
    private static string Pan_Number(string pan){
        
        system.debug('Pan Number: '+pan);
        return pan;
        
    }
    
    public static void pan(){
        Pan_Number('cbhpr2353b');
    }
    
    public static void salary(decimal bas_sal, decimal trav_all, decimal comm){
        decimal total_sal = bas_sal +trav_all*comm;
        system.debug('total salary: '+total_sal);
        
    }
    
    public static void end_date(){
      	date d = date.today();
        date end_date = d.addDays(5);
        system.debug('end date: '+end_date);
    }
   
    public static void product_price_cal(string str, decimal discount, double gst, integer m){
        discount = m/100;
        decimal product_price = gst-discount+m ;
        system.debug('product price: '+product_price +str);
        
    }
    
    public static string customerName(string fName, string lName){
        string fullName = fName + ' ' +lName;
        system.debug('Customer full name is :' +fullName);
        return fullName;
    }
    
}