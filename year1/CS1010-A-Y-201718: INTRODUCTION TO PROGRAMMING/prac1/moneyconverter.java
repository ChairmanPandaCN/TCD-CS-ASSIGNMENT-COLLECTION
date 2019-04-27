/**
 * 2017/10/6/
 * 14333615
 */
package moneycoverter;

/*  SELF ASSESSMENT
1. Did I use appropriate CONSTANTS instead of numbers within the code?
    Mark out of 10:   10
2. Did I use easy-to-understand, meaningful CONSTANT names?
    Mark out of 5:    5
 3. Did I format the CONSTANT names properly (in UPPERCASE)?
    Mark out of 5:    5
4. Did I use easy-to-understand meaningful variable names?
    Mark out of 10:   10
5. Did I format the variable names properly (in lowerCamelCase)?
    Mark out of 10:   10
6. Did I indent the code appropriately?
    Mark out of 10:   9                                                             --Is it necessary to close the scanner?
7. Did I read the input correctly from the user using (an) appropriate question(s)?
    Mark out of 10:   10
8. Did I compute the answer correctly for all cases?
    Mark out of 20:   20
9. Did I output the correct answer in the correct format (as shown in the examples)?
    Mark out of 10:   10
10. How well did I complete this self-assessment?
    Mark out of 10:   10
Total Mark out of 100 (Add all the previous marks):
                      99
*/

import java.util.Scanner;

public class moneyconverter {
	public static final int OLD_PENNY_TO_NEW_PENNY = 67;
	public static final int OLD_SHILLING_TO_OLD_PENNY = 12;
	public static final int OLD_POUND_TO_OLD_SHILLING = 20;
	public static final int NEW_POUND_TO_NEW_PENNY = 100;
	/*
	 * Relationship between different units.
	 */

	public static void converting(int oldPound, int oldShilling, int oldPenny) {
		int ValueBaseOnNewPenny = 0;
		double ValueBaseOnNewPound = 0;
		ValueBaseOnNewPenny = ((((oldPound * OLD_POUND_TO_OLD_SHILLING
				+ oldShilling) * OLD_SHILLING_TO_OLD_PENNY) + oldPenny)
				* OLD_PENNY_TO_NEW_PENNY);
		ValueBaseOnNewPound = (double) ValueBaseOnNewPenny
				/ NEW_POUND_TO_NEW_PENNY;
		System.out.println(oldPound + " old pound, " + oldShilling
				+ " old shilling and " + oldPenny + " old pence =£" 
				+ String.format( "%.2f", ValueBaseOnNewPound ));
	}
	/*
	 * Convert collected inputs to modern pounds and pence by calculating.
	 */

	public static void main(String[] args) {
		int oldPenny = 0;
		int oldShilling = 0;
		int oldPound = 0;
		while (true) {

			try {
				Scanner scanner = new Scanner(System.in);
				System.out.println(
						"Pls enter the amount of old pounds to be converted");
				oldPound = scanner.nextInt();
				System.out.println(
						"Pls enter the amount of old shillings to be converted");
				oldShilling = scanner.nextInt();
				System.out.println(
						"Pls enter the amount of old pence to be converted");
				oldPenny = scanner.nextInt();

				if (oldPound >= 0 & oldShilling >= 0 & oldPenny >= 0) {                   
					scanner.close();
					break;
				} else {
					System.out.println(
							"Pls enter positive integer instead of negative integer.\n");
				}

			} catch (Exception e) {
				System.out.println(
						"Pls enter positive integer instead of letters.\n");
			}
		}
		converting(oldPound, oldShilling, oldPenny);
	}
	/*	Collect data from user.If inputs don't match the question request,it will automatically ask user to input again for correct information.
	 * 	
	 */
}
