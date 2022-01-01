public class Nodo {
    private String origem;
    private String destino;
    private Integer quilometros;



public Nodo(String origem, String destino, Integer quilometros) {
        this.origem = origem;
        this.destino = destino;
        this.quilometros = quilometros;
    }

    public Nodo( Nodo nodo){
        this.origem = nodo.getOrigem();
        this.destino = nodo.getDestino();
        this.quilometros = nodo.getQuilometros();
    }

    public String getOrigem() {
        return origem;
    }

    public void setOrigem(String origem) {
        this.origem = origem;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public Integer getQuilometros() {
        return quilometros;
    }

    public void setQuilometros(Integer quilometros) {
        this.quilometros = quilometros;
    }
}
