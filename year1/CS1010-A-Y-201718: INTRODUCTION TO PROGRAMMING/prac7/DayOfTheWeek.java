/* SELF ASSESSMENT
1. Did I use appropriate, easy-to-understand, meaningful CONSTANT names formatted correctly in UPPERCASE?
       Mark out of 5: 5 Yes
2. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)?
       Mark out of 5: 5 Yes
3. Did I indent the code appropriately?
       Mark out of 5: 5 Yes
4. Did I define the required function correctly (names, parameters & return type) and invoke them correctly?
      Mark out of 20: 20 Yes
5. Did I implement the dayOfTheWeek function correctly and in a manner that can be understood?
      Mark out of 20: 20 Yes,it can output the correct day of the week for 28th february in leep years and one day behind.
6. Did I implement the other functions correctly, giving credit for any code that you take from elsewhere?
      Mark out of 20: 20 Yes,I copy the first three functions from blackboard 
7. Did I obtain (and process) the input from the user in the correct format (dd/mm/yyyy), and deal with any invalid input properly?      
	   Mark out of 10:10 Yes
8. Does the program produce the output in the correct format (e.g. Monday, 25th December 2017)?
      Mark out of 10: 10 Yes
9. How well did I complete this self-assessment?
       Mark out of 5: 5 Well 
Total Mark out of 100 (Add all the previous marks): 100
*/
import java.util.Scanner;
public class DayOfTheWeek {
	public static final int DAYS_IN_APRIL_JUNE_SEPT_NOV = 30;
	public static final int DAYS_IN_FEBRUARY_NORMALLY = 28;
	public static final int DAYS_IN_FEBRUARY_IN_LEAP_YEAR = 29;
	public static final int DAYS_IN_MOST_MONTHS = 31;
	public static final int NUMBER_OF_MONTHS = 12;
	public static void main(String[] args) {
		try {
			Scanner scanner = new Scanner(System.in);
			System.out.println("Enter date (day/month/year):");
			String temp = scanner.nextLine();
			String[] strArr = temp.split("/");
			scanner.close();
			int day = Integer.parseInt(strArr[0]);
			int month = Integer.parseInt(strArr[1]);
			int year = Integer.parseInt(strArr[2]);
			System.out.println(day);
			System.out.println(month);
			System.out.println(year);
			if (validDate(day, month, year)) {
				System.out.println(dayOfTheWeek(day, month, year) + ", " + day
						+ numberEnding(day) + " " + monthName(month) + " "
						+ year);
			} else {
				System.out.println("" + day + "/" + month + "/" + year
						+ " is not a valid date.");
			}
		} catch (NullPointerException exception) {

		} catch (java.util.NoSuchElementException exception) {
			System.out.println("No elements entered");
		} catch (NumberFormatException exception) {
			System.out.println("Enter the input the program asked for");
		} catch (ArrayIndexOutOfBoundsException exception) {
			System.out.println("Dont just enter the delimiter");
		} catch (Exception exeception) {
			System.out.println("Something wrong happened and i dont know why");
		}
	}
	public static boolean validDate(int day, int month, int year) {
		return ((year >= 0) && (month >= 1) && (month <= NUMBER_OF_MONTHS)
				&& (day >= 1) && (day <= daysInMonth(month, year)));
	}
	// Taking from the validDay in Blackboard
	public static int daysInMonth(int month, int year) {
		int numberOfDaysInMonth = DAYS_IN_MOST_MONTHS;
		switch (month) {
			case 2 :
				numberOfDaysInMonth = isLeapYear(year)
						? DAYS_IN_FEBRUARY_IN_LEAP_YEAR
						: DAYS_IN_FEBRUARY_NORMALLY;
				break;
			case 4 :
			case 6 :
			case 9 :
			case 11 :
				numberOfDaysInMonth = DAYS_IN_APRIL_JUNE_SEPT_NOV;
				break;
			default :
				numberOfDaysInMonth = DAYS_IN_MOST_MONTHS;
				break;
		}
		return numberOfDaysInMonth;
	}
	// Taking from the validDay in Blackboard
	public static boolean isLeapYear(int year) {
		return (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0));
	}
	// Taking from the validDay in Blackboard
	public static String numberEnding(int day) {
		String numberEnding = "";
		int numberInOnesPlace = 0;
		if (day < 10) {
			numberInOnesPlace = day;
		} else {
			numberInOnesPlace = day % 10;
		}
		switch (numberInOnesPlace) {
			case 1 :
				numberEnding = "st";
				break;
			case 2 :
				numberEnding = "nd";
				break;
			case 3 :
				numberEnding = "rd";
				break;
			default :
				numberEnding = "th";
				break;
		}
		return numberEnding;
	}
	public static String monthName(int month) {
		String monthName = "";
		switch (month) {
			case 1 :
				monthName = "January";
				break;
			case 2 :
				monthName = "February";
				break;
			case 3 :
				monthName = "March";
				break;
			case 4 :
				monthName = "April";
				break;
			case 5 :
				monthName = "May";
				break;
			case 6 :
				monthName = "June";
				break;
			case 7 :
				monthName = "July";
				break;
			case 8 :
				monthName = "August";
				break;
			case 9 :
				monthName = "September";
				break;
			case 10 :
				monthName = "October";
				break;
			case 11 :
				monthName = "Novemeber";
				break;
			case 12 :
				monthName = "Decemeber";
				break;
		}
		return monthName;
	}
	public static String dayOfTheWeek(int day, int month, int year) {
		if (month <= 2) {
			year--;
		}
		int y = year % 100; // last 2 digits of Year
		int c = year / 100; // first 2 digits of Year
		int w = (int) ((day + Math.floor(2.6 * (((month + 9) % 12) + 1) - 0.2)
				+ y + Math.floor(y / 4) + Math.floor(c / 4) - 2 * c) % 7);
		if(w<0) {
			w+=7;
		}
		System.out.println(w);
		String dayOfTheWeek = "";
		switch (w) {
			case 0 :
				dayOfTheWeek = "Sunday";
				break;
			case 1 :
				dayOfTheWeek = "Monday";
				break;
			case 2 :
				dayOfTheWeek = "Tuesday";
				break;
			case 3 :
				dayOfTheWeek = "Wednesday";
				break;
			case 4 :
				dayOfTheWeek = "Thursday";
				break;
			case 5 :
				dayOfTheWeek = "Friday";
				break;
			case 6 :
				dayOfTheWeek = "Saturday";
				break;
		}
		return dayOfTheWeek;
	}
}
