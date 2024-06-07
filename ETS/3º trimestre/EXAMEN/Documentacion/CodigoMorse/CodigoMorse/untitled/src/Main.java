import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {

    public static void main(String args[]) {

        Morse ms = new Morse();

        if (ms.readMorseCode()) {
            Scanner sc = new Scanner(System.in);

            System.out.println("VAMOS A CODIFICAR UN TEXTO A CÓDIGO MORSE");
            System.out.println("** Por favor introduzca el texto a codificar: ");
            System.out.printf("**>");
            String textToMorse = sc.nextLine();

            if (ms.toMorse(textToMorse)) {
                System.out.println("Traducción finalizada");
            };

            // La frase es: estamos programando con java
            String linea = ". ... - .- -- --- ...  .--. .-. --- --. .-. .- -- .- -. -.. ---  -.-. --- -.  .--- .- ...- .-";

            if (ms.toHumanLanguage(linea)) {
                System.out.println("Traducción finalizada");
            };

        }else {
            System.out.println("Ha habido algún problema con la ejecución de la aplicación.");
        }
    }

}
