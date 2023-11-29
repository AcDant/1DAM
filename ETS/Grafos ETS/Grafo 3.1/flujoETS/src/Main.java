
public class Main {
    public static void main(String[] args) {

        boolean logoutOne, logoutTwo;

        logoutOne = false;
        int i = 0;
        int j = 0;

        while (!logoutOne){

            System.out.println("Confecciono equipos.");
            i++;

            if (i==10) {
                System.out.println("Hemos encontrado al nuevo Michael Jordannnn");
                logoutOne = true;
            }
            else {

                logoutTwo = false;
                while (!logoutTwo){
                    if ((j < 10)){
                        System.out.println("Equipo número " + i + " presentamos a ...." + j);
                    }
                    else{
                        System.out.println("Equipo ya presentado, no necesitamos más jugadores");
                        logoutTwo = true;
                    }
                    j++;
                }
            }
        }
        System.out.println("EQUIPO DE BALONCESTO PRESENTADO");
    }
}