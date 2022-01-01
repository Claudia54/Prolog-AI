import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;


public class Grafo {
    //private Integer vertice;
    private HashMap<String,List<Nodo>>listaadjacente;


public Grafo() {
    //this.vertice = vertice;
    ArrayList listaadjacente = new ArrayList<>();
 //initialize adjacency lists for all the vertices
    //for (int i = 0; i <vertice ; i++) {
     //   listaadjacente[i] = new LinkedList<>();
}

public void addEgde(String freguesia , String source, String destination, int weight) {
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
    
public void BFS (String source,String freguesia){
    int i =listaadjacente.get(freguesia).size();
    boolean visited[]= new boolean[i];
    ArrayList<String> queue = new ArrayList<String>();

    visited[source]=true;
    queue.add(source);

}
}
