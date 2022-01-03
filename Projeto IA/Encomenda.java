import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;

public class Encomenda {
    private String id ;
    private Integer volume;
    private Integer peso;
    private String veiculo;
    private LocalDateTime data;
    private LocalDateTime dataencomenda;
    private String estafeta;
    private String destino;

    public Encomenda(String id, Integer volume, Integer peso, String veiculo, LocalDateTime data, LocalDateTime dataencomenda, String estafeta, String destino) {
        this.id = id;
        this.volume = volume;
        this.peso = peso;
        this.veiculo = veiculo;
        this.data = data;
        this.dataencomenda = dataencomenda;
        this.estafeta = estafeta;
        this.destino = destino;
    }

    public Encomenda(Encomenda e){
        this.id = e.getId();
        this.volume = e.getVolume();
        this.peso = e.getPeso();
        this.veiculo = e.getVeiculo();
        this.data = e.getData();
        this.dataencomenda = e.getDataencomenda();
        this.estafeta = e.getEstafeta();
        this.destino= e.getDestino();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getVolume() {
        return volume;
    }

    public void setVolume(Integer volume) {
        this.volume = volume;
    }

    public Integer getPeso() {
        return peso;
    }

    public void setPeso(Integer peso) {
        this.peso = peso;
    }

    public String getVeiculo() {
        return veiculo;
    }

    public void setVeiculo(String veiculo) {
        this.veiculo = veiculo;
    }

    public LocalDateTime getData() {
        return data;
    }

    public void setData(LocalDateTime data) {
        this.data = data;
    }

    public LocalDateTime getDataencomenda() {
        return dataencomenda;
    }

    public void setDataencomenda(LocalDateTime dataencomenda) {
        this.dataencomenda = dataencomenda;
    }

    public String getEstafeta() {
        return estafeta;
    }

    public void setEstafeta(String estafeta) {
        this.estafeta = estafeta;
    }

    public String getDestino() {
        return this.destino;
    }

    public void setNodo(String Destino) {
        this.destino= Destino;
    }

    
            
        


    }










