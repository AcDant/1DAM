public class CodigoMorseItem {

    private String morse;
    private String codigo;

    public CodigoMorseItem(String codigo, String morse) {
        this.codigo = codigo;
        this.morse = morse;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getMorse() {
        return morse;
    }

    public void setMorse(String morse) {
        this.morse = morse;
    }

    @Override
    public String toString() {
        return "CodigoMorseItem{" +
                "codigo='" + codigo + '\'' +
                ", valor='" + morse + '\'' +
                '}';
    }
}
