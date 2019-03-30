/* SELF ASSESSMENT 
   1. Did I use appropriate CONSTANTS instead of numbers within the code?  
       Mark out of 5: 4
   2. Did I use easy-to-understand, meaningful CONSTANT names? 
       Mark out of 5: 4
   3. Did I format the CONSTANT names properly (in UPPERCASE)? 
       Mark out of 5: 4
   4. Did I use easy-to-understand meaningful variable names? 
       Mark out of 10: 9
   5. Did I format the variable names properly (in lowerCamelCase)? 
       Mark out of 10: 9
   6. Did I indent the code appropriately? 
       Mark out of 10: 9
   7. Did I use an appropriate for loop to test all possibilities?  There should be only one. 
       Mark out of 20:  19
   8. Did I correctly check if people alive today were or could be alive in a year that is the square of their age in that year. 
       Mark out of 30:  29
   9. How well did I complete this self-assessment? 
       Mark out of 5: 4
   Total Mark out of 100 (Add all the previous marks): 
       Mark out of 100:91
*/

public class SquareAges {
	public static final int MINI_BORN_YEAR = 1894;
	public static final int MAX_LIVING_YEAR = 2134;
	public static final int CURRENT_YEAR = 2017;
	public static final int MAX_LIVING_AGE = 123;

	public static void main(String[] args) {
		int bornYear = 0;
		for (int currentLivingAge = 0; currentLivingAge <= MAX_LIVING_AGE; currentLivingAge++) {
			int ageSquare = currentLivingAge * currentLivingAge;
			bornYear = ageSquare - currentLivingAge;
			if (ageSquare <= MAX_LIVING_YEAR && MINI_BORN_YEAR <= ageSquare && bornYear <= CURRENT_YEAR
					&& bornYear >= MINI_BORN_YEAR) {
				System.out.println("A man who was borned in " + bornYear + ".In " + ageSquare
						+ ",this year is the square of his age " + currentLivingAge + ".");
			}
		}

	}

}
