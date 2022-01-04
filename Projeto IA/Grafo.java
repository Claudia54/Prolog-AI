import java.util.HashSet;
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
    private List<Nodo> lista;
   

    
    public Grafo(List<Nodo> lista) {
        this.lista = lista;
    }
    /*
    public Grafo(Grafo grafo){
        this.lista = grafo.getListaNodos();
    }

    //Método que vai buscar todos os nodos  

    public Nodo getNodo(String freguesia){
        return this.lista.stream()
                .filter(n -> n.getFreguesia().equals(freguesia))
                .findFirst()
                .orElse(null);
    }

    public Nodo getNodoOrigem(String origem){
        return this.lista.stream()
                .filter(n -> n.getOrigem().equals(origem))
                .findFirst()
                .orElse(null);
    }

    public Nodo getNodoFinal(String destino){
        return this.lista.stream()
                .filter(n -> n.getDestino().equals(destino))
                .findFirst()
                .orElse(null);
    }

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


    public Integer tempo (Integer distancia, Integer velocidade){
        return distancia/velocidade;
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

    public Nodo getNodoDestino(String destino){
        return this.lista.stream()
                .filter(n -> n.getDestino().equals(destino))
                .findFirst()
                .orElse(null);
    }
*/


public double calculateHeuristic(Nodo start, Nodo target){
   int i = (int) Math.sqrt((java.lang.Math.pow(start.getX(),2 )-java.lang.Math.pow(target.getX(),2)-
   (java.lang.Math.pow(start.getY(),2 )-java.lang.Math.pow(target.getY(),2))));
    start.setH(i);
    return this.h;
}



//   public Set<String> aEstrela(String inicial, String fim){
//       Set<String> vizinhos = new HashSet<>();
//       Set<String> caminho = new HashSet<>();
//
//       Nodo origem = null;
//       for (Nodo n : lista) {
//           if(n.getOrigem().equals(inicial) && (n.getDestino().equals(fim)){
//               origem = n;
//               origem.f = origem.g + origem.getQuilometros();
//               caminho.add(inicial);
//
//           }
//       }
//   }


//    public Set<String> gulosa(String origem, String destino){
//        Set<String> caminho = new LinkedHashSet<String>();
//        Queue<String> queue = new LinkedList<String>();
//        queue.add(origem);
//        while ((!queue.isEmpty())){
//               for(){ //
//                   if (){ //for diferente
//                         queue.remove();
//                        caminho.add(origem);
//
//                }
//            }
//        }
//        return caminho;
//    }

//    public Set<String> gulosa(String origem, String destino) {
//        Set<String> caminho = new LinkedHashSet<String>();
//        Queue<String> queue = new LinkedList<String>();
//        queue.add(origem);
//        Nodo inicial = getNodoOrigem(origem);
//        for (Nodo n : getAdjVertices(origem)) { //percorrer a lista de nodos
//            if ((inicial.getOrigem().equals(n.getOrigem())) && (!inicial.getDestino().equals(destino))) { //
//                caminho.add(origem);
//                queue.add(origem);
//                inicial = ; //avançar para o proximo
//            }else{
//                queue.remove(inicial);
//            }
//        }
//        return caminho;
//    }
}

