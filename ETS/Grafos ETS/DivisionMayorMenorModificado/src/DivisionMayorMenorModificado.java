
// Aplicación que divide el mayor entre el menor.

import java.util.Scanner;

public class DivisionMayorMenorModificado {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int numA, numB, mayor, menor, cociente;
        boolean salir=false;

        do {
            System.out.printf("Por favor un número A: ");
            numA = sc.nextInt();

            System.out.printf("Por favor otro número B: ");
            numB = sc.nextInt();

            if (numA!=0 && numB!=0) salir = true;

        } while (!salir);

        if (numA>=numB){
            mayor = numA;
            menor = numB;
        }
        else {
            mayor = numB;
            menor = numA;
        }

        cociente = mayor/menor;
        System.out.println("La división de " + mayor + " entre " + menor + " es: " + cociente);
    }
}