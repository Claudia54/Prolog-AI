import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;

public class Nodo {
    private String origem;
    private String destino;
    private Integer quilometros;
    private String freguesia;
    public double f = Double.MAX_VALUE;
    public double g = Double.MAX_VALUE;
   



public Nodo(String origem, String destino, Integer quilometros,String freguesia) {
        this.origem = origem;
        this.destino = destino;
        this.quilometros = quilometros;
        this.freguesia=freguesia;
        
        //this.encomenda=encomenda;
    }

    public Nodo( Nodo nodo){
        this.origem = nodo.getOrigem();
        this.destino = nodo.getDestino();
        this.quilometros = nodo.getQuilometros();
        this.freguesia=nodo.getFreguesia();
        //this.encomenda = nodo.getEncomenda();
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
/*
    public Encomenda getEncomenda() {
        return encomenda;
    }

    public void setEncomenda(Encomenda encomenda) {
        this.encomenda= encomenda;
    }

*/
public String getFreguesia() {
    return freguesia;
}

public void setFreguesia(String freguesia) {
    this.freguesia= freguesia;
}

/*
public Set<String> breathFirstTransversal (Grafo graph,String root){
    Set<String> visited = new LinkedHashSet<String>();
    Queue<String>queue =new LinkedList<String>();
    queue.add(root);
    while(!queue.isEmpty()){
        String vertex =queue.poll();
        for(Nodo v: graph.getAdjVertices(vertex)){
            if(!visited.contains(v.getOrigem())){
                visited.add(v.getOrigem());
                queue.add(v.getOrigem());
            }}
    }
    for (String vis : visited){
        System.out.println(" "+vis+" ");
    }

    return visited;
}
*/


@Override
    public String toString() {
        return " \n"+"Nodo{" +
                "origem='" + origem + '\'' +
                ", destino='" + destino + '\'' +
                ", quilometros=" + quilometros +
                ", freguesia='" + freguesia + '\'' +
                '}';
    }
}
/*
public Set<String> dfs(Grafo grafo, String origem){
    Set<String> caminho = new LinkedHashSet<>();
    Stack<String> stack = new Stack<>();

    stack.push(origem);
    while(!stack.isEmpty()){
        String vertice = stack.pop();
        if(!caminho.contains(vertice)){
            caminho.add(vertice);
            for (Nodo nodo : grafo.getAdjVertices(origem)){
                stack.push(nodo.getOrigem());
            }
    }
        return caminho;
}*/