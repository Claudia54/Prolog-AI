import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;

public class Aresta{
    private Nodo origem;
    private Nodo destino;
    private Integer quilometros;
    private String freguesia;
    public double f = Double.MAX_VALUE;
    public double g = Double.MAX_VALUE;
   



public Aresta(Nodo string,Nodo string2, Integer quilometros,String freguesia) {
        this.origem = string;
        this.destino = string2;
        this.quilometros = quilometros;
        this.freguesia=freguesia;
        
        //this.encomenda=encomenda;
    }

    public Aresta(Aresta aresta){
        this.origem = aresta.getOrigem();
        this.destino = aresta.getDestino();
        this.quilometros = aresta.getQuilometros();
        this.freguesia= aresta.getFreguesia();
        //this.encomenda = nodo.getEncomenda();
    }


    public Nodo getOrigem() {
        return origem;
    }

    public void setOrigem(Nodo origem) {
        this.origem = origem;
    }

    public Nodo getDestino() {
        return destino;
    }

    public void setDestino(Nodo destino) {
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