import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.Set;
import java.util.Stack;

//import Nodo.java;

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

    @Override
    public String toString() {
        return "Grafo{" +
                "lista de Nodos=" + lista +
                '}'+" ";
    }


    public Set<String> breathFirstTransversal (String root){
        Set<String> visited = new LinkedHashSet<String>();
        Queue<String>queue =new LinkedList<String>();
        queue.add(root);
        while(!queue.isEmpty()){
            String vertex =queue.poll();
            for(Nodo v: getAdjVertices(vertex)){
                if(!visited.contains(v.getDestino())){
                    visited.add(v.getDestino());
                    queue.add(v.getDestino());
    
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
                for (Nodo nodo : getAdjVertices(origem)) {
                    stack.push(nodo.getDestino());
                }
            }
        }
        for (String vis : caminho){
            System.out.println(" "+vis+" ");
        }
    
    
        return caminho;
    }



  /* public Nodo aStar(String  start, String target, int casa){
        PriorityQueue<String> closedList = new PriorityQueue<>();
        PriorityQueue<Nodo> openList = new PriorityQueue<>();
        //Nodo n = new Nodo(start,"",0,"");
        int contar=0;
        for(Nodo e : getAdjVertices(start)){
         e.f = e.g + e.getQuilometros();
         openList.add(e);
    
        while(!openList.isEmpty()){
            Nodo n = openList.peek();
            if(n.equals(target) && contar==casa){
                return n;
            }
    
            for(Nodo edge :getAdjVertices(start)){
                double totalWeight = n.g + edge.getQuilometros();
    
                if(!openList.contains(edge) && !closedList.contains(edge)){
                    edge.setOrigem(n);
                    edge.g = totalWeight;
                    edge.f = edge.g + edge.getQuilometros();
                    openList.add(m);
                } else {
                    if(totalWeight < m.g){
                        m.parent = n;
                        m.g = totalWeight;
                        m.f = m.g + m.calculateHeuristic(target);
    
                        if(closedList.contains(m)){
                            closedList.remove(m);
                            openList.add(m);
                        }
                    }
                }
            }
    
            openList.remove(n);
            closedList.add(n);
        }
        return null;
}
    
*/

    


}

