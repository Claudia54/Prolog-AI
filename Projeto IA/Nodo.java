public class Nodo {
    private String nodo;
    private int x;
    private int y;
    private int h;// distancia de um local final

public Nodo(String nodo,int x, int y,int h) {
    this.nodo = nodo;
    this.x=x;
    this.y=y;
    this.h=h;
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
public void setH(int h) {
    this.h = h;
}


}

