import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.io.*;
import java.util.ArrayList;
import java.lang.reflect.Type;

public class Morse {
    private ArrayList<CodigoMorseItem> codigoMorse;
    private final String fileName = "C:\\tmp\\morse.json";
    private final File fileMorse = new File(fileName);

    public Morse(){
        this.codigoMorse = new ArrayList<>();
    }

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

    private String getMorse(char v){
        for(CodigoMorseItem item:codigoMorse){
            if (item.getCodigo().equals(Character.toString(v))){
                return item.getMorse();
            }
        }
        return null;
    }
    private String translateMorse(String value){
        StringBuilder result = new StringBuilder();
        for (char letter: value.toCharArray()) {
            result.append(getMorse(letter));
            result.append(" ");
        }
        return result.toString().trim();
    }
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

    private String getHumanLetter(String v){
        for(CodigoMorseItem item:codigoMorse){
            if (item.getMorse().equals(v)){
                return item.getCodigo();
            }
        }
        return null;
    }

    private String translateHuman(String word){
        StringBuilder wordHuman = new StringBuilder();
        for (String letter: word.split(" ")) {
            wordHuman.append(getHumanLetter(letter));
        }
        return wordHuman.toString().trim();
    }

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
