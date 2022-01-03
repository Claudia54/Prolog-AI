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



    public Queries (Grafo grafo){
        this.grafo = grafo;
    }
/*
Método que vai buscar os vertices adjacentes a um dado ponto
*/ 

public Queries(Grafo grafo, HashMap<String,List<Encomenda>> encomenda) {

        this.grafo = grafo;
        this.encomenda=encomenda;
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


    public  List<Integer> q2BFS (String root,String freguesia){
        Set<String> visited = new LinkedHashSet<String>();
        Queue<String>queue =new LinkedList<String>();
        List<Integer> total = new ArrayList<Integer>();
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
                    total = q2_aux2total(list);
                    
    
                }
            }
            }
        }
        for (int vis : total){
            System.out.println(" "+vis+" ");
        }
    
       return total;
        }

        public List<Integer> query2DFS (String origem,String freguesia){
            Set<java.lang.String> caminho = new LinkedHashSet<>();
            Stack<java.lang.String> stack = new Stack<>();
            List<Integer> total = new ArrayList<Integer>();
            stack.push(origem);
            while (!stack.isEmpty()) {
                java.lang.String vertice = stack.pop();
                if (!caminho.contains(vertice)) {
                    caminho.add(vertice);
                    for (Nodo nodo : grafo.getAdjVertices(origem)) {
                        if(nodo.getFreguesia().equals(freguesia)) {
                            List<Encomenda> list = q2_aux(freguesia);
                            total = q2_aux2total(list);
                            stack.push(nodo.getDestino());
                        }
                    }
                }
            }
            for (Integer vis : total){
                System.out.println(" "+vis+" ");
            }
    
            return total;
        }




    public int q4BFS(String root, String freguesia){
        Set<String> visited = new LinkedHashSet<String>();
        Queue<String>queue =new LinkedList<String>();
        int acumul=0;
        queue.add(root);
          while(!queue.isEmpty()){
                String vertex =queue.poll();
                for(Nodo v: grafo.getAdjVertices(vertex)){
                    if(!visited.contains(v.getOrigem()) && !visited.contains(v.getDestino())){
                        if ( v.getFreguesia().equals(freguesia)){
                                System.out.println(v.getQuilometros());
                                System.out.println(v);
                                acumul+=v.getQuilometros();
                                visited.add(v.getOrigem());
                                queue.add(v.getDestino());
                            }
                            }
                         }

                     }
            return acumul;
        }

        

    public Integer query4DFS (String origem,String destino){
        Set<java.lang.String> caminho = new LinkedHashSet<>();
        Stack<java.lang.String> stack = new Stack<>();
        List<Integer> total = new ArrayList<Integer>();
        int acumul=0;
        stack.push(origem);
        Nodo des = grafo.getNodoFinal(destino);
            while (!stack.isEmpty()) {
                java.lang.String vertice = stack.pop();
                if (!caminho.contains(vertice)) {
                    caminho.add(vertice);
                    for (Nodo nodo : grafo.getAdjVertices(origem)) {
                        if(nodo.getFreguesia().equals(des.getFreguesia())) {
                            System.out.println(nodo);
                            System.out.println(nodo.getQuilometros());
                            acumul+=nodo.getQuilometros();

                        }
                    }
                }
            }
            for (Integer vis : total){
                System.out.println(" "+vis+" ");
            }
            return acumul;
    }
    





}
        









        
    
        

    




       

    









