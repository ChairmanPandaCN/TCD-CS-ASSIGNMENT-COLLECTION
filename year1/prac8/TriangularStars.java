/* SELF ASSESSMENT
 1. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)?
        Mark out of 5:    5     Comment:	
        									Yes
 2. Did I indent the code appropriately?
        Mark out of 5:     5    Comment:
        									Yes
 3. Did I write the determineStarNumber or determineTriangleNumber function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 20:    20      Comment:
       										Yes
 4. Did I write the isStarNumber function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 20:    20      Comment:
       										Yes
 5. Did I calculate and/or check triangle numbers correctly?
       Mark out of 15:    15    Comment: 
       									I used 3 different ways in total to calculate the triangleNumber.Two failed,one succeed.
       									The first one is using recursion,it always overflows.
       									The second one is using (n(n-1))/2 ,but it creates large number that system cannot handle.
       									The last one succeed.
 6. Did I loop through all possibilities in the program using system defined constants to determine when to stop?
       Mark out of 10:    10    Comment: 
       									if any value is greater than Integer.Max_Value,the program stops 
 7. Does my program compute and print all the correct triangular star numbers?
       Mark out of 20:    20    Comment:
       									Yes
 8. How well did I complete this self-assessment?
        Mark out of 5:    5    Comment:  
        								Well,Using my solution,no need to recalculate all the starNumber 
        								when the program gets a new triangle number.
 Total Mark out of 100 (Add all the previous marks):
 										100
*/
public class TriangularStars {
	public static void main(String[] args) {
		int starNumber = 0;
		int currentTriangleNumber = 0;
		int previousTriangleNumber = 0;
		int indexOfStar = 1;
		int indexOfTriangle = 1;
		while (starNumber <= Integer.MAX_VALUE && determineStarNumber(
				indexOfStar + 1) > determineStarNumber(indexOfStar)) {
			starNumber = determineStarNumber(indexOfStar);
			if (starNumber < currentTriangleNumber) {
				indexOfStar++;
			} else if (starNumber > currentTriangleNumber) {
				previousTriangleNumber = currentTriangleNumber;
				currentTriangleNumber = determinetriangleNumber(indexOfTriangle,
						previousTriangleNumber);
				indexOfTriangle++;
			} else if (isStarNumber(starNumber, currentTriangleNumber)) {
				indexOfStar++;
				System.out.println("The number " + currentTriangleNumber
						+ " is " + "a TriangularStar number.");
				previousTriangleNumber = currentTriangleNumber;
				currentTriangleNumber = determinetriangleNumber(indexOfTriangle,
						previousTriangleNumber);
				indexOfTriangle++;
			}
		}
		System.out.println("" + indexOfStar + " " + indexOfTriangle);
	}
	public static int determineStarNumber(int nForS) {
		return (((6 * nForS) * (nForS - 1)) + 1);

	}

	public static int determinetriangleNumber(int indexOfTriangle,
			int previousTriangleNumber) {
		return indexOfTriangle + previousTriangleNumber;

	}
	// first solution for calculate
	// return (nForT * (nForT - 1)) / 2;
	// the second one
	// if(nForT>=1) {
	// return nForT+(triangleNumber(nForT-1));
	// }else {
	// return nForT;
	// }
	// }

	public static boolean isStarNumber(int starNumber, int triangleNumber) {
		if (starNumber == triangleNumber)
			return true;
		else
			return false;
	}

}
