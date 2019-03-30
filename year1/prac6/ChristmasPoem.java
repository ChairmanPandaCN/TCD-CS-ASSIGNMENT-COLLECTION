
/* SELF ASSESSMENT 
   1. Did I use appropriate CONSTANTS instead of numbers within the code? 
       Mark out of 5: 5 Yes
   2. Did I use easy-to-understand, meaningful CONSTANT names formatted correctly in UPPERCASE? 
       Mark out of 5: 5 Yes
   3. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)? 
       Mark out of 10: 10 Yes
   4. Did I indent the code appropriately? 
       Mark out of 10: 10 Yes
   5. Did I use an appropriate loop (or loops) to produce the different verses? 
       Mark out of 20:  20 Yes
   6. Did I use a switch to build up the verses? 
       Mark out of 25:  25 Yes
   7. Did I avoid duplication of code and of the lines which make up the verses (each line should be referred to in the code only once (or twice))? 
       Mark out of 10:  10 Yes
   8. Does the program produce the correct output? 
       Mark out of 10:  10 Yes
   9. How well did I complete this self-assessment? 
       Mark out of 5: 5 Yes
   Total Mark out of 100 (Add all the previous marks): 100
*/
public class ChristmasPoem {
	public static String FIRST_DAY_GIFT = "a Partridge in a Pear Tree.";
	public static String SECOND_DAY_GIFT = "2 Turtle Doves\n";
	public static String THIRD_DAY_GIFT = "3 French Hens\n";
	public static String FORTH_DAY_GIFT = "4 Calling Birds\n";
	public static String FIFTH_DAY_GIFT = "5 Golden Rings\n";
	public static String SIXTH_DAY_GIFT = "6 Geese a Laying\n";
	public static String SEVENTH_DAY_GIFT = "7 Swans a Swimming\n";
	public static String EIGHTH_DAY_GIFT = "8 Maids a Milking\n";
	public static String NINTH_DAY_GIFT = "9 Ladies Dancing\n";
	public static String TENTH_DAY_GIFT = "10 Lords a Leaping\n";
	public static String ELEVENTH_DAY_GIFT = "11 Pipers Piping\n";
	public static String TWELFTH_DAY_GIFT = "12 Drummers Drumming\n";

	public static void main(String[] args) {
		int verses = 12;
		String day = "";
		String lyrics = "";
		String gift = "";
        System.out.print("Twelve Days of Christmas :");
		for (int time = 1; time <= verses; time++) {
			switch (time) {
				case 1 :
					day = "first";
					gift = FIRST_DAY_GIFT;
					break;
				case 2 :
					day = "second";
					gift = "and " + FIRST_DAY_GIFT;
					gift = SECOND_DAY_GIFT + gift;
					break;
				case 3 :
					day = "third";
					gift = THIRD_DAY_GIFT + gift;
					break;
				case 4 :
					day = "forth";
					gift = FORTH_DAY_GIFT + gift;
					break;
				case 5 :
					day = "fifth";
					gift = FIFTH_DAY_GIFT + gift;
					break;
				case 6 :
					day = "sixth";
					gift = SIXTH_DAY_GIFT + gift;
					break;
				case 7 :
					day = "seventh";
					gift = SEVENTH_DAY_GIFT + gift;
					break;
				case 8 :
					day = "eighth";
					gift = EIGHTH_DAY_GIFT + gift;
					break;
				case 9 :
					day = "ninth";
					gift = NINTH_DAY_GIFT + gift;
					break;
				case 10 :
					day = "tenth";
					gift = TENTH_DAY_GIFT + gift;
					break;
				case 11 :
					day = "eleventh";
					gift = ELEVENTH_DAY_GIFT + gift;
					break;
				default :
					day = "twelfth";
					gift = TWELFTH_DAY_GIFT + gift;
			}
			lyrics += "\nOn the " + day
					+ " day of Christmas \nMy true love sent to me: \n" + gift;
		}
		System.out.println(lyrics);
	}

}