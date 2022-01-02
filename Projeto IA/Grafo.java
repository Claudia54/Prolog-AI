import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Set;

public class Grafo {
    //private Integer vertice;
    private List<Nodo>lista;

    
    public Grafo(List<Nodo> lista) {
        this.lista = lista;
    }
    public Grafo(Grafo grafo){
        this.lista = grafo.getListaNodos();
    }

    /*Método que vai buscar todos os nodos  */

    public List<Nodo> getListaNodos() {
        LinkedList list = new LinkedList<>();
        for(Nodo n : lista){
            list.add(n);
        }
        return list;
    }


    public void setLista(List<Nodo> listaadjacente) {
        this.lista= listaadjacente;
    }

    

    public Set<Nodo> getAdjVertices(String origem){
        Set<Nodo> n = new HashSet<>();
        for(Nodo nodo : lista){
            if(nodo.getOrigem().equals(origem)){
                n.add(nodo);
            }
        }
        return n;
    }




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

    @Override
    public String toString() {
        return "Grafo{" +
                "lista de Nodos=" + lista +
                '}';
    }

   /* public void addEgde(String freguesia , String source, String destination, int weight) {
        Nodo edge = new Nodo(source, destination, weight);
        if (listaadjacente.containsKey(freguesia)){
            listaadjacente.get(freguesia).add(edge);
        }
        else{
            ArrayList n = new ArrayList();
            n.add(edge);
            listaadjacente.put(freguesia,n);
        }
    }
*/

}

