/* SELF ASSESSMENT 
   1. Did I use appropriate CONSTANTS instead of numbers within the code? 
       Mark out of 5:5
       Comment: 
   2. Did I use easy-to-understand, meaningful CONSTANT names formatted correctly in UPPERCASE? 
       Mark out of 5:5
       Comment: 
   3. Did I use easy-to-understand meaningful variable names? 
       Mark out of 10:10
       Comment:  
   4. Did I format the variable names properly (in lowerCamelCase)? 
       Mark out of 5:5
       Comment:  
   5. Did I indent the code appropriately? 
       Mark out of 10:10
       Comment:  
   6. Did I use an appropriate loop to allow the user to enter their guesses until they win or lose? 
       Mark out of 20: 20
       Comment:  
   7. Did I check the input to ensure that invalid input was handled appropriately? 
       Mark out of 10: 10
       Comment:  
   8. Did I generate the cards properly using random number generation (assuming all cards are equally likely each time)? 
       Mark out of 10: 10
       Comment:  
   9. Did I output the cards correctly as 2, 3, 4, ... 9, 10, Jack, Queen, King? 
       Mark out of 10: 10
       Comment:  
   10. Did I report whether the user won or lost the game before the program finished? 
       Mark out of 10:10
       Comment:  
   11. How well did I complete this self-assessment? 
       Mark out of 5:5
       Comment:  
   Total Mark out of 100 (Add all the previous marks): 100
*/
import java.util.Scanner;
import java.util.Random;

public class HiLoCardGame {
	public static String TWO = "2";
	public static String THREE = "3";
	public static String FOUR = "4";
	public static String FIVE = "5";
	public static String SIX = "6";
	public static String SEVEN = "7";
	public static String EIGHT = "8";
	public static String NINE = "9";
	public static String TEN = "10";
	public static String JACK = "JACK";
	public static String QUEEN = "Queen";
	public static String KING = "King";
	public static String ACE = "Ace";
	public static String HIGHER = "higher";
	public static String LOWER = "lower";
	public static String EQUAL = "equal";
	public static String GIVE_UP = "gg";
	public static int NUMBER_OF_GUESSES_TO_WIN = 4;
	public static void main(String[] args) {
		System.out.println(
				"You have to guess that the next card will be Higher (higher), Lower (lower) or Equal(equal)"
						+ "to the current card.(Just type the word within the brackets)");
		System.out.println("If u want to quit the game,just type(gg).");
		System.out.println("BTW,all inputs that dont fit the question allowed can be considered as invalid input.");
		System.out.println("If u enter any invalid inputs,it will clear all the result u have gotten");
		int count = 0;
		Random random = new Random();
		int currentNumber = random.nextInt(13) + 2;
		while (count < NUMBER_OF_GUESSES_TO_WIN) {
			int nextNumber = random.nextInt(13) + 2;
			// System.out.println("Current Card is " + currentNumber);
			printCardName(currentNumber, TWO, THREE, FOUR, FIVE, SIX, SEVEN,
					EIGHT, NINE, TEN, JACK, QUEEN, KING, ACE);
			if(count<4) {
			System.out.print(
					"Do you think the next card will be higher, lower or equal?");
			}
			Scanner scanner = new Scanner(System.in);
			String input = scanner.next();
			if (input.equals(HIGHER) && nextNumber > currentNumber) {
				count++;
				outputSentence(count);
			} else if (input.equals(LOWER) && nextNumber < currentNumber) {
				count++;
				outputSentence(count);
			} else if (input.equals(EQUAL) && nextNumber == currentNumber) {
				count++;
				outputSentence(count);
			} else if (input.equals(GIVE_UP)) {
				System.out.println("U lost.hhh");
				break;
			} else {
				count = 0;
				outputSentence(count);
			}
			currentNumber = nextNumber;
		}

	}
	public static void printCardName(int currentNumber, String TWO,
			String THREE, String FOUR, String FIVE, String SIX, String SEVEN,
			String EIGHT, String NINE, String TEN, String JACK, String QUEEN,
			String KING, String ACE) {
		if (currentNumber == 2) {
			System.out.println("Current Card is " + TWO);
		} else if (currentNumber == 3) {
			System.out.println("Current Card is " + THREE);
		} else if (currentNumber == 4) {
			System.out.println("Current Card is " + FOUR);
		} else if (currentNumber == 5) {
			System.out.println("Current Card is " + FIVE);
		} else if (currentNumber == 6) {
			System.out.println("Current Card is " + SIX);
		} else if (currentNumber == 7) {
			System.out.println("Current Card is " + SEVEN);
		} else if (currentNumber == 8) {
			System.out.println("Current Card is " + EIGHT);
		} else if (currentNumber == 9) {
			System.out.println("Current Card is " + NINE);
		} else if (currentNumber == 10) {
			System.out.println("Current Card is " + TEN);
		} else if (currentNumber == 11) {
			System.out.println("Current Card is " + JACK);
		} else if (currentNumber == 12) {
			System.out.println("Current Card is " + QUEEN);
		} else if (currentNumber == 13) {
			System.out.println("Current Card is " + KING);
		} else if (currentNumber == 14) {
			System.out.println("Current Card is " + ACE);
		}
	}
	public static void outputSentence(int count) {
		if (count == 0) {
			System.out.println("Nice Try!You still need to guess successfully "
					+ (NUMBER_OF_GUESSES_TO_WIN - count)
					+ " times in a row in order to win");
		} else if (0 < count && count < 4) {
			System.out.println("Nice Job!You still need to guess successfully "
					+ (NUMBER_OF_GUESSES_TO_WIN - count)
					+ " times in a row in order to win");
		} else if (count == 4) {
			System.out.println("GJ,You win the game");

		}

	}
}
