import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.io.*;
import java.util.ArrayList;
import java.lang.reflect.Type;

public class Morse {
    private ArrayList<CodigoMorseItem> codigoMorse;
    private final String fileName = "C:\\tmp\\morse.json";
    private final File fileMorse = new File(fileName);

    /**
     * construcotr de morse
     * @author Daniel
     * since 21
     */
    public Morse(){
        this.codigoMorse = new ArrayList<>();
    }

    /**
     * Metodo que lee el fichero
     * @author Daniel
     * @return  devuelve true si hay datos en el
     */
    public boolean readMorseCode(){
        try (BufferedReader reader = new BufferedReader(new FileReader(fileMorse))){
            Gson gson = new Gson();

            // Definir el tipo de datos utilizando TypeToken
            Type codigoMorseType = new TypeToken<ArrayList<CodigoMorseItem>>(){}.getType();

            // Leer el JSON y convertirlo en un ArrayList de CodigoMorseItem
            this.codigoMorse = gson.fromJson(reader, codigoMorseType);

        } catch (IOException e) {
            System.out.println(e.getMessage());
        }

        return this.codigoMorse != null; // true cuando hay datos.
    }

    /**
     * Identifica que tipo de caracter morse se pasa por parametros
     * @author Daniel
     * @param v caracter al que se le va a comprobar a que caracter morse pertenece
     * @return devuelve caracter morse
     */
    private String getMorse(char v){
        for(CodigoMorseItem item:codigoMorse){
            if (item.getCodigo().equals(Character.toString(v))){
                return item.getMorse();
            }
        }
        return null;
    }

    /**
     * Trduce de morse a letras
     * @author Daniel
     * @param value string a pasar de lenguaje normal a morse
     * @return devuelve letra
     */
    private String translateMorse(String value){
        StringBuilder result = new StringBuilder();
        for (char letter: value.toCharArray()) {
            result.append(getMorse(letter));
            result.append(" ");
        }
        return result.toString().trim();
    }

    /**
     *  Pasa una cadena a morse
     * @author Daniel
     * @param value cadena a pasar a morse
     * @return siempre retorna true
     */
    public boolean toMorse(String value){
        // Cortamos la frase por espacios en blanco
        String[] wordsToMorse = value.toLowerCase().split(" ");
        StringBuilder valueMorse = new StringBuilder();

        for(String word:wordsToMorse){
            valueMorse.append(translateMorse(word));
            valueMorse.append("  ");
        }

        System.out.println("Traducción a Morse...");
        System.out.println(valueMorse.toString().trim());
        return true;
    }

    /**
     * saca la letra de lenguaje normal de una morse
     * @author Daniel
     * @param v caracter morse
     * @return caracter morse traducido
     */
    private String getHumanLetter(String v){
        for(CodigoMorseItem item:codigoMorse){
            if (item.getMorse().equals(v)){
                return item.getCodigo();
            }
        }
        return null;
    }

    /** traduce de lenguaje normal a morse
     * @author Daniel
     * @param word string a traducir a morse
     * @return devuelve una cadena de texto sin espacios
     */
    private String translateHuman(String word){
        StringBuilder wordHuman = new StringBuilder();
        for (String letter: word.split(" ")) {
            wordHuman.append(getHumanLetter(letter));
        }
        return wordHuman.toString().trim();
    }

    /**
     * traduce a humano
     * @author Daniel
     * @param value strina a traducir a humano
     * @return siempre retorna true
     */
    public boolean toHumanLanguage(String value){
        StringBuilder valueHuman = new StringBuilder();
        String[] morseToHuman = value.toLowerCase().split("  "); // Dos espacios en blanco separan palabras.

        for(String word:morseToHuman){
            valueHuman.append(translateHuman(word));
            valueHuman.append(" ");
        }
        System.out.println("Lenguaje humano...");
        System.out.println(valueHuman.toString().trim());
        return true;
    }
}
