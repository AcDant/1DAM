public class CodigoMorseItem {

    private String morse;
    private String codigo;

    /**
     * constructor
     * @author Daniel
     * @param codigo crea codigo
     * @param morse el string de morse
     * @since 21
     */
    public CodigoMorseItem(String codigo, String morse) {
        this.codigo = codigo;
        this.morse = morse;
    }

    /**
     * getter codigo
     * @author Daniel
     * @return codigo
     */
    public String getCodigo() {
        return codigo;
    }

    /**
     * setter codigo
     * @author Daniel
     * @param codigo de la clase
     */
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    /**
     * getter de morse
     * @author Daniel
     * @return
     */
    public String getMorse() {
        return morse;
    }

    /**
     * setter de morse
     * @author Daniel
     * @param morse el string en morse
     */
    public void setMorse(String morse) {
        this.morse = morse;
    }

    /**
     * metodo toString
     * @author Daniel
     * @return retorna el objeto de forma legible
     */
    @Override
    public String toString() {
        return "CodigoMorseItem{" +
                "codigo='" + codigo + '\'' +
                ", valor='" + morse + '\'' +
                '}';
    }
}
