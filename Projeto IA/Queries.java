import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Set;
import java.util.Stack;

public class Queries {
    private Grafo grafo;
    private HashMap<String,List<Encomenda>> encomenda;


/*
Método que vai buscar os vertices adjacentes a um dado ponto
*/ 

public Queries(Grafo grafo) {
        this.grafo = grafo;
    }

/*
Método que percorre o grafo BFT -->
 */



public Set<String> q1BFS(String root, String freguesia){
    Set<String> visited = new LinkedHashSet<String>();
    Queue<String>queue =new LinkedList<String>();
    queue.add(root);
    visited.add(root);
    while(!queue.isEmpty()){
        String vertex =queue.poll();
        for(Nodo v: grafo.getAdjVertices(vertex)){
            if ( v.getFreguesia().equals(freguesia)){
            if(!visited.contains(v.getDestino())){
                visited.add(v.getDestino());
                queue.add(v.getDestino());

            }
        }
        }
    }
    for (String vis : visited){
        System.out.println(" "+vis+" ");
    }

    return visited;
    }

    public Set<String> query1DFS (String origem,String freguesia){
        Set<java.lang.String> caminho = new LinkedHashSet<>();
        Stack<java.lang.String> stack = new Stack<>();

        stack.push(origem);
        while (!stack.isEmpty()) {
            java.lang.String vertice = stack.pop();
            if (!caminho.contains(vertice)) {
                caminho.add(vertice);
                for (Nodo nodo : grafo.getAdjVertices(origem)) {
                    if(nodo.getFreguesia().equals(freguesia)) {
                        stack.push(nodo.getDestino());
                    }
                }
            }
        }
        for (java.lang.String vis : caminho){
            System.out.println(" "+vis+" ");
        }

        return caminho;
    }

    public List<Encomenda> q2_aux (String freguesia){
        return encomenda.get(freguesia);  
    }

    public List<Integer> q2_aux2total(List<Encomenda> list){
        List total= new ArrayList<Integer>();
        int i = list.size();
        int soma_peso =0;
        int soma_volume=0;
        for(Encomenda enc : list){
            soma_peso= soma_peso+enc.getPeso();
            soma_volume=soma_volume+enc.getVolume();


        }
        total.add(i);
        total.add(soma_peso);
        total.add(soma_volume);

        return total;
    }


    public void q2BFS (String freguesia){
        String root = "Gualtar";
        Set<String> visited = new LinkedHashSet<String>();
        Queue<String>queue =new LinkedList<String>();
        queue.add(root);
        visited.add(root);
        while(!queue.isEmpty()){
            String vertex =queue.poll();
            for(Nodo v: grafo.getAdjVertices(vertex)){
                if ( v.getFreguesia().equals(freguesia)){
                if(!visited.contains(v.getDestino())){
                    visited.add(v.getDestino());
                    queue.add(v.getDestino());
                    List<Encomenda> list = q2_aux(freguesia);
                    List<Integer> total = q2_aux2total(list);
                    
    
                }
            }
            }
        }
        for (String vis : visited){
            System.out.println(" "+vis+" ");
        }
    
        

    }




       

    }









