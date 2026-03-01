public class AssignmentClass {

    public void salesCalculation(Decimal unitPrice,Integer quantitySold){
         

			Decimal totalSales = unitPrice * quantitySold;
        	system.debug('total sales'+totalSales);
    }
    
     public void Expense_Tracker(Integer initialBudget ,Integer groceryExpense,Integer utilityExpense ){
         

			Integer remainingBudget = initialBudget - groceryExpense - utilityExpense;
         	system.debug('reamining budget'+remainingBudget);
    }
    
    public void area_calculator(Decimal length,Decimal width){
         

			Decimal area = length * width;
        	system.debug('area'+area);
    }
    
    public void Track_Monthly_Savings(){
         
		Decimal monthlyIncome = 3000.00;

		Decimal rentExpense = 1200.00;

		Decimal groceriesExpense = 300.00;

		Decimal monthlySavings = monthlyIncome - (rentExpense + groceriesExpense);
        system.debug('monthly saving'+monthlySavings);
    }
    
    public void CalculateDiscountedPrice(){
         
		Decimal originalPrice = 120.00;

        Decimal discountPercentage = 15.0;
        
        Decimal discountedPrice = originalPrice - (originalPrice * (discountPercentage / 100));
        system.debug('Discount Price'+discountedPrice);
    }
    
    public void  FitnessTracker(){
         
		Integer caloriesBurnPerMinute = 10;

		Integer workoutDurationInMinutes = 45;

		Integer totalCaloriesBurned = caloriesBurnPerMinute * workoutDurationInMinutes;
        system.debug('calories burn'+totalCaloriesBurned);
    }
    
    public void   GPACalculator(){
         
		Decimal mathGrade = 3.5;

        Decimal scienceGrade = 4.0;
        
        Decimal englishGrade = 3.0;
        
        Decimal overallGPA = (mathGrade + scienceGrade + englishGrade) / 3;        
        system.debug('GPA is'+overallGPA);
    }
    
    public void  TimeandDistance(){
         
		Decimal distance = 150.0;

        Decimal speed = 60.0;
        
        Decimal timeTaken = distance / speed;
        system.debug('Time Taken'+timeTaken);
    }

 	public void  ProductInventory (){
         
		Integer currentStock = 200;

        Integer dailySalesDemand = 30;
        
        Integer reorderQuantity = dailySalesDemand * 7; // Reorder for one week
        system.debug('record quantity'+reorderQuantity);
    }    
    
}