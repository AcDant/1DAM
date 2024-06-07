import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {

    public static void main(String args[]) {
//        Aquí se instancia la clase con la que se va a leer el fichero y realizar todos los métodos de lectura
        Morse ms = new Morse();

        if (ms.readMorseCode()) {
            Scanner sc = new Scanner(System.in);

            System.out.println("VAMOS A CODIFICAR UN TEXTO A CÓDIGO MORSE");
            System.out.println("** Por favor introduzca el texto a codificar: ");
            System.out.printf("**>");
            String textToMorse = sc.nextLine();
//            Aquí se realiza una prueba de traduccion de lenguaje humano a morse
            if (ms.toMorse(textToMorse)) {
                System.out.println("Traducción finalizada");
            };

            // La frase es: estamos programando con java
            String linea = ". ... - .- -- --- ...  .--. .-. --- --. .-. .- -- .- -. -.. ---  -.-. --- -.  .--- .- ...- .-";
//            Aquí se realiza una prueba de traduccion de lenguaje morse a humano
            if (ms.toHumanLanguage(linea)) {
                System.out.println("Traducción finalizada");
            };
//            En caso de fallo en la lectura, al instanciar la case, te avisa del problema
        }else {
            System.out.println("Ha habido algún problema con la ejecución de la aplicación.");
        }
    }

}
