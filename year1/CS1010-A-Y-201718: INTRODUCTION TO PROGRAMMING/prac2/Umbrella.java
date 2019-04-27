/* SELF ASSESSMENT 
  1. Did I use easy-to-understand meaningful variable names? 
      Mark out of 10: 9
  2. Did I format the variable names properly (in lowerCamelCase)? 
      Mark out of 10: 9
  3. Did I indent the code appropriately? 
      Mark out of 10: 9
  4. Did I read the input correctly from the user using appropriate questions? 
      Mark out of 20: 19
  5. Did I use an appropriate (i.e. not more than necessary) series of if statements? 
      Mark out of 30: 29
  6. Did I output the correct answer for each possibility in an easy to read format? 
      Mark out of 15: 14
  7. How well did I complete this self-assessment? 
      Mark out of 5:   4
  Total Mark out of 100 (Add all the previous marks): 
                       93
*/                     
import java.util.Scanner;
public class Umbrella {
	public static void main(String[] args) {
		String isRaining = "";
		String mightRain = "";
		String yes = "Yes";
		String no = "No";
		Scanner scanner = new Scanner(System.in);
		System.out.println("Is raining outside?Pls answer by Yes/No");
		isRaining = scanner.next();
		if (isRaining.equals(yes)) {
			System.out.println("Pls bring an umbrella.");
		} else {
			System.out
					.println("Does the weather looks " + "like it might rain?");
			mightRain = scanner.next();
			if (mightRain.equals(yes)) {
				System.out.println("Pls bring an umbrella.");
			} else {
				System.out.println("U dont need to bring an umbrella");
			}
		}

	}

}
