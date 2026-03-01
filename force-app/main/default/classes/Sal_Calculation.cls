public class Sal_Calculation {
    
    public static void sal_cal(string commallocatted, integer salary, integer da,integer incentive){
        
        if(commallocatted == 'yes'){
            system.debug('Yes commission is allocated ,calculate salary according to that');
            
             sal_calcomm(salary,da,incentive);

        	}
        else{
            system.debug('No commision allocated');
            sal_calnocomm(salary,da,incentive);

        }
    }
        
        private static void sal_calnocomm(integer salary, integer da, integer incentive){
            
            if(salary<0 && da<0 && incentive<0){
                system.debug('Not allowed to do the calculation because salary, DA and incetives values must greater than 0');
            }
            
            else{
                integer total_salary = salary + da + incentive;
                system.debug('total salary calculated without commission is :'+total_salary);
            }
        }
        
        private static void sal_calcomm(integer salary, integer da, integer incentive){
            integer comm = 23;
            if(salary <0 || da<0 || incentive < 0){
              system.debug('Not allow to do any calculations no is negative');
        }
        else
        {
        integer total_salary=salary+da+incentive+comm;
        system.debug('total salary calculated without commission is: '+total_salary);
            
        }
  
     }
    private static boolean check_empstatus(boolean vflag){
        if(vflag){
            system.debug('employee is permanent');
        }
        else{
            system.debug('employee is on cantract basis');
            
        }
        return vflag;
    }
    

}