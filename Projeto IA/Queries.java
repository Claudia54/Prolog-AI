import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;

public class Queries {
    private Grafo grafo;


/*
Método que vai buscar os vertices adjacentes a um dado ponto
*/ 


/*
Método que percorre o grafo BFT -->
 */
public Set<String> breathFirstTransversal (Grafo graph,String root){
    Set<String> visited = new LinkedHashSet<String>();
    Queue<String>queue =new LinkedList<String>();
    queue.add(root);
    while(!queue.isEmpty()){
        String vertex =queue.poll();
    }
    for(Nodo v: grafo.getAdjVertices(root)){
            if(!visited.contains(v.getOrigem())){
                visited.add(v.getOrigem());
            }
    }
    return visited;
}


}


