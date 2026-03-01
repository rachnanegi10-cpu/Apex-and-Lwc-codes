public class StudentGrade {


		private static decimal calculatePercentage(decimal x, decimal y,decimal z){
			
			integer total_marks = 300;
            decimal marks_obtain = x+y+z;
			decimal percentage = (marks_obtain/total_marks)*100;
            Decimal roundedPercentage = percentage.setScale(2);
			system.debug('Calculated Percentage is: '+roundedPercentage);
			
			return percentage;
		}
		
		public static string marks(decimal x, decimal y,decimal z){
		 	decimal percentage;
            string grade;
			
            if(x > 0 && x < 101 && y > 0 && y < 101 && z > 0 && z < 101){
				percentage = calculatePercentage(x,y,z);
                
                if(percentage > 80 && percentage <=100){
                    grade = 'A';
                } 
                else if(percentage > 60 && percentage <=80){
                    grade ='B';
                } 
                else if(percentage > 33 && percentage <=60){
                    grade = 'C';
                }
                else {
                    grade ='Fail';
                }
            }else{
                system.debug('Marks should be between 0 -100');
            }
		System.debug('Grade: '+grade);
		return grade;
		



	}
}