public class Nodo {
    public String nodo;
    public Double x;
    public Double y;

public Nodo(String nodo,Double x, Double y) {
    this.nodo = nodo;
    this.x=x;
    this.y=y;
    }

public Nodo(Nodo n){
    this.nodo=n.getNodo();
    this.x=n.getX();
    this.y=n.getY();
}

public String getNodo() {
    return this.nodo;
}

public void setX(Double x) {
    this.x = x;
}
public Double getX() {
    return this.x;
}

public void setx(Double x) {
    this.x = x;
}

public Double getY() {
    return this.y;
}

public void setY(Double y) {
    this.y = y;
}
}

