public class BonusCalculator {
    
    public static void final_salary(string grade, decimal baseSalary){
        
        decimal finalSalary = baseSalary + bonus_calculate(grade,baseSalary);
        system.debug('Final salary with bonus '+bonus_calculate(grade,baseSalary)+' is :'+finalSalary);
    }
    
    private static decimal bonus_calculate(string grade, decimal baseSalary){
        decimal bonus ;
        if(baseSalary > 0){
            switch on(grade){
                when 'A'{
                    bonus = (baseSalary*50)/100;
                }
                
                when 'B'{
                    bonus = (baseSalary*30)/100;
                }
                
                when 'C'{
                    bonus = (baseSalary*20)/100;
                }
            }
        } else{
            system.debug('Enter valid salary');
        }
        return bonus;
    }
    

}