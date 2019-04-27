
/* SELF ASSESSMENT
 1. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)?
        Mark out of 5:  5 
        					Yes
 2. Did I indent the code appropriately?
        Mark out of 5:  5	
        					Yes
 3. Did I write the initialiseHighScores function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 15:  15
       						Yes,actually,i use the return void instead of return method,
       						because sometimes i dont know which stuff i want to return or 
       						just confuse about what i gonna do after getting a returned variable.
       						can u tell me whats the major difference between these two and which one is better or efficient?
       						
 4. Did I write the printHighScores function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 15:  15
       						Yes,it is hard to print right interpunction at the right time.
 5. Did I write the higherThan function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 15:  10
       						Im kinda confused about what do i need to do in this function.
 6. Did I write the insertScore function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 20:  20
       						Yes
 7. Did I write the main function body correctly (first asking for the number of scores to be maintained and then repeatedly asking for scores)?
       Mark out of 20:  20
       						Yes.Trying to avoid any exception is harder than i thought.
 8. How well did I complete this self-assessment?
        Mark out of 5:  4
        					I try to make my code more clear and ez to understand.i kinda fail at it. 
 Total Mark out of 100 (Add all the previous marks):
 							94.
*/
import java.util.Scanner;

public class HighScores {

	public static void main(String[] args) {
		try {
			System.out.println("How many numbbers do u want to entered?");
			Scanner scanner = new Scanner(System.in);
			boolean exit = true;
			int NumbersOfInput = scanner.nextInt();
			int[] intArray = new int[NumbersOfInput];
			initialiseHighScores(intArray);
			while (exit) {
				if (scanner.hasNext("exit")) {
					exit = false;
				} else if (scanner.hasNextInt()) {
					int currentPassingNumber = scanner.nextInt();
					insertScore(intArray, currentPassingNumber);
				} else if (scanner.hasNextDouble()) {
					System.out.println("Dont enter double number pls,and restart the program.");
					exit = false;
				}
			}
		} catch (NullPointerException exception) {
		} catch (java.util.NoSuchElementException exception) {
			System.out.println("Enter Real Numbers pls");
		} catch (NumberFormatException exception) {
			System.out.println("Enter the input the program asked for");
		} catch (ArrayIndexOutOfBoundsException exception) {
			System.out.println("Try to not set intArray with 0 space and still want to add some value in the list");
		} catch (Exception exeception) {
			System.out.println("Something wrong happened and i dont even know why");
		}
	}

	public static void initialiseHighScores(int[] intArray) {
		for (int count = 0; count < intArray.length; count++) {
			intArray[count] = 0;
		}
	}

	public static void insertScore(int[] intArray, int currentPassingNumber) {
		if (intArray != null) {
			int index = 1;
			int temp = 0;
			boolean run = true;
			while (run) {
				if (intArray.length == 1) {
					if (currentPassingNumber > intArray[0]) {
						intArray[0] = currentPassingNumber;
						run = false;
					} else {
						run = false;
					}
					/*
					 * If Only a number can be stored into the list.
					 * 
					 */
				} else if (currentPassingNumber < intArray[index - 1] && currentPassingNumber > intArray[index]) {
					for (int count = index; count < intArray.length; count++) {
						temp = intArray[count];
						intArray[count] = currentPassingNumber;
						currentPassingNumber = temp;
					}
					run = false;
					/*
					 * If the current number is greater than the number in
					 * current index of array and lower than the number in the
					 * previous one. Store the current number in the current
					 * index of space,and move lower number to next index of
					 * space. Discard the lowest number
					 */
				} else if (currentPassingNumber > intArray[index]) {
					higherThan(intArray, currentPassingNumber, index);
					run = false;
					/*
					 * If the current number is greater than the first number is
					 * the list. Store the current number into the first space
					 * of the array. All the number move to next space,compare
					 * with their original one. Discard the lowest number.
					 */
				} else if (currentPassingNumber < intArray[index]) {
					if (index == intArray.length - 1) {
						run = false;
					}
					/*
					 * If the current number is lower than all the numbers is in
					 * the list,finish the loop
					 * 
					 */
				}
				index++;
				if (index == intArray.length) {
					run = false;
				}
			}
			printHighScores(intArray);
		}
	}

	public static void printHighScores(int[] intArray) {
		System.out.print("The high scores are ");

		for (int count = 0; count < intArray.length; count++) {
			if (intArray[count] != 0 && count < intArray.length - 1) {
				if (intArray[count + 1] != 0) {
					System.out.print(intArray[count] + ", ");
				} else if (intArray[count + 1] == 0) {
					System.out.print(intArray[count] + ". ");
				}
				/*
				 * If next number in the list is 0,print "." If not,print ","
				 */
			} else if (intArray[count] != 0 && count == intArray.length - 1) {
				System.out.print(intArray[count] + ". ");
			}
		}
		System.out.println(" ");
	}

	public static void higherThan(int[] intArray, int currentPassingNumber, int index) {
		int temp;
		for (int count = index - 1; count < intArray.length; count++) {
			temp = intArray[count];
			intArray[count] = currentPassingNumber;
			currentPassingNumber = temp;
		}
	}
}