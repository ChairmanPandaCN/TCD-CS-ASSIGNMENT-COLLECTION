
/* SELF ASSESSMENT
 1. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)?
        Mark out of 5:  5 
                            think so.
 2. Did I indent the code appropriately?
        Mark out of 5: 5  
                            think so
 3. Did I write the createCipher function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 20:  20 
                            It randomizes the order of letters of alphabet with a whitespace in some degree.
 4. Did I write the encrypt function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 20:  20  
                            It finds each cipher letter assign to the plain letter ,then adds cipher letters to the cipherText string.
 5. Did I write the decrypt function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 20:  20
                            It finds each plain letter assign to the cipher letter,
                            then adds plain letters to the textAfterDecrypting string.
 6. Did I write the main function body correctly (repeatedly obtaining a string and encrypting it and then decrypting the encrypted version)?
       Mark out of 25:  20
                            It doesnt support only whitespace as input.
 7. How well did I complete this self-assessment?
        Mark out of 5:   3  
                            
 Total Mark out of 100 (Add all the previous marks):
                         92
*/ 
import java.util.Scanner;
import java.util.Random;

/**
 * @author sikai lusi@tcd.ie
 * @date 2017/12/25
 * 
 */
public class Cipher {

    public static void main(String[] args) {
        char[] alphabet = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
                'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '};
        char[] subsitutionCipher = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
                'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '};
        ceateCiphter(subsitutionCipher);
        String plainText = "";
        String cipherText = "";
        String textAfterDecrypting = "";
        Boolean inputMatchRequirement = true;
        Boolean keepEntering = true;
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter a plain text:");
        while (keepEntering) {
            if (scanner.hasNextInt()) {
                System.out.println("Pls dont input regular numbers.");
            } else if (scanner.hasNextDouble()) {
                System.out.println("Pls dont input fraction numbers");
            }else if(scanner.hasNext("exit")) {
                break;
            } else if (scanner.hasNextLine()) {
                plainText = scanner.nextLine();
                char[] plainTextCharacterArray = plainText.toLowerCase().toCharArray();
                for (int index = 0; index < plainTextCharacterArray.length; index++) {
                    if (!(Character.isLetter(plainTextCharacterArray[index])
                            || Character.isWhitespace(plainTextCharacterArray[index]))) {
                        inputMatchRequirement = false;
                        System.out.println("Pls only input letters and whitespace.");
                        break;
                    }
                }
                if (inputMatchRequirement) {
                    cipherText = encrypt(alphabet, subsitutionCipher, plainTextCharacterArray);
                    System.out.println("This is the text after encrypting : " + cipherText);
                    char[] cipherTextCharacterArray = cipherText.toCharArray();
                    textAfterDecrypting =
                            decrypt(alphabet, subsitutionCipher, cipherTextCharacterArray);
                    System.out.println(
                            "This is the oridinary text after decrypting : " + textAfterDecrypting);
                }
            }
        }
    }

    public static void ceateCiphter(char[] subsitutionCipher) {
        if (subsitutionCipher != null) {
            Random generator = new Random();
            for (int index = 0; index < subsitutionCipher.length; index++) {
                int otherIndex = generator.nextInt(subsitutionCipher.length);
                char temp = subsitutionCipher[index];
                subsitutionCipher[index] = subsitutionCipher[otherIndex];
                subsitutionCipher[otherIndex] = temp;
            }
        }
    }

    public static String encrypt(char[] alphabet, char[] subsitutionCipher,
            char[] plainTextCharacterArray) {
        String text = "";
        for (int index = 0; index < plainTextCharacterArray.length; index++) {
            for (int count = 0; count < alphabet.length; count++) {
                if (plainTextCharacterArray[index] == alphabet[count]) {
                    text += subsitutionCipher[count];
                }
            }
        }
        return text;
    }

    public static String decrypt(char[] alphabet, char[] subsitutionCipher,
            char[] cipherTextCharacterArray) {
        String text = "";
        for (int index = 0; index < cipherTextCharacterArray.length; index++) {
            for (int count = 0; count < subsitutionCipher.length; count++) {
                if (cipherTextCharacterArray[index] == subsitutionCipher[count]) {
                    text += alphabet[count];
                }
            }
        }
        return text;
    }
}
