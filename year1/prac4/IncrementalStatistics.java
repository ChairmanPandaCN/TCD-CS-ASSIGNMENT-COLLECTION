import java.util.Scanner;

public class IncrementalStatistics {

	public static void main(String[] args) {
/* 
 * Case 1:
 * initializing scanner inside the while loop.
 * It can handle invalid inputs without rerunning the program.
 * It may cause the waste of memory because scanner will be initialized unlimited times
 * 	
 */
		System.out.println(
				"This program computes the average and variance of all numbers entered.");
		boolean exit = true;
		int count = 0;
		double currentNumber = 0;
		double average = 0;
		double variance = 0;
		double totalNumber = 0;
		while (exit) {
			Scanner scanner = new Scanner(System.in);
			System.out.println("Enter a number (or type 'exit')");
			if (scanner.hasNextDouble()) {
				currentNumber = scanner.nextDouble();
				if (currentNumber < 0) {
					System.out.println(
							"Pls enter unnegative numbers.Input a new number");
				} else {
					count++;
					double previousAverage = average;
					average = previousAverage
							+ (currentNumber - previousAverage) / count;
					variance = ((variance * (count - 1))
							+ (currentNumber - previousAverage)
									* (currentNumber - average))
							/ count;

					System.out.println("So far the average is " + average
							+ " and the variance is " + variance);
				}
			} else if (scanner.hasNext("exit")) {
				exit = false;
			} else if (!scanner.hasNext("exit")) {
				System.out.println(
						"Because of letters u entered,the programm is crashed.Pls rerun it");
			}
		}
/*
 * Case 2:
 * initializing scanner outside the while loop.
 * It only initializes the scanner once.
 * It costs less memory waste than case 1 does.
 * But,user needs to rerun the program when invalid inputs are entered. 		
 */
		// System.out.println(
		// "This program computes the average and variance of all numbers
		// entered.");
		// Scanner scanner = new Scanner(System.in);
		// boolean exit = true;
		// int count = 0;
		// double currentNumber = 0;
		// double average = 0;
		// double variance = 0;
		// double totalNumber = 0;
		// while (exit) {
		// System.out.println("Enter a number (or type 'exit')");
		// if (scanner.hasNextDouble()) {
		// currentNumber = scanner.nextDouble();
		// if(currentNumber<0)
		// {
		// System.out.println("Pls enter unnegative numbers.Rerun the
		// Program.");
		// break;
		// }
		// count++;
		// double previousAverage = average;
		// average = previousAverage+(currentNumber-previousAverage)/count;
		// variance = ((variance * (count - 1))
		// + (currentNumber - previousAverage)
		// * (currentNumber - average))
		// / count;
		// System.out.println("So far the average is " + average
		// + " and the variance is " + variance);
		// }else if (scanner.hasNext("exit")) {
		// exit = false;
		// }else if (!scanner.hasNext("exit"))
		// {
		// System.out.println("Because of letters u entered,the programm is
		// crashed.Pls rerun it");
		// break;
		// }
		// }
		//
	}

}
