import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;
import java.util.Stack;

public class Queries {
    private Grafo grafo;


/*
Método que vai buscar os vertices adjacentes a um dado ponto
*/ 


public Queries(Grafo grafo) {
        this.grafo = grafo;
    }


/*
Método que percorre o grafo BFT -->
 */
public Set<String> breathFirstTransversal (String root){
    Set<String> visited = new LinkedHashSet<String>();
    Queue<String>queue =new LinkedList<String>();
    queue.add(root);
    while(!queue.isEmpty()){
        String vertex =queue.poll();
        for(Nodo v: grafo.getAdjVertices(vertex)){
            if(!visited.contains(v.getOrigem())){
                visited.add(v.getOrigem());
                queue.add(v.getOrigem());

            }
        }
    }
    for (String vis : visited){
        System.out.println(" "+vis+" ");
    }

    return visited;
    }

    public Set<String> dft(String origem) {
        Set<String> caminho = new LinkedHashSet<>();
        Stack<String> stack = new Stack<>();

        stack.push(origem);
        while (!stack.isEmpty()) {
            String vertice = stack.pop();
            if (!caminho.contains(vertice)) {
                caminho.add(vertice);
                for (Nodo nodo : grafo.getAdjVertices(origem)) {
                    stack.push(nodo.getOrigem());
                }
            }
        }
        return caminho;
    }


}



