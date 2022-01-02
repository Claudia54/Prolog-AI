import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;

public class Main{
    public static void main (String[] args){
        Nodo a = new Nodo("Gualtar", "Familia Real", 10, "Esposende");
        Nodo b = new Nodo("Gualtar", "Nova America", 20, "Esposende");
        Nodo c = new Nodo("Gualtar", "Torta", 5, "Esposende");
        Nodo d = new Nodo("Familia Real", "Nova America", 3, "Esposende");
        Nodo e = new Nodo("Familia Real", "Torta", 1,"Esposende");
        Nodo f = new Nodo("Nova America", "Torta", 2,"Esposende");
        Nodo g = new Nodo("Gualtar", "Vasco da Gama", 25,"Bagunte");
        Nodo h = new Nodo("Gualtar", "Da Torre", 30,"Bagunte");
        Nodo i = new Nodo("Vasco da Gama", "Da Torre", 4,"Bagunte");
        Nodo j = new Nodo("Gualtar", "Afonso de Jeronimo", 15, "Prado");
    
        LinkedList list = new LinkedList<>();
        list.add(a);
        list.add(b);
        list.add(c);
        list.add(d);
        list.add(e);
        list.add(f);
        list.add(g);
        list.add(h);
        list.add(i);
        list.add(j);

        Grafo g1 = new Grafo(list);
        //Set<String> n= new HashSet<String>();
            
        Queries q = new Queries(g1);
        
        g1.breathFirstTransversal("Gualtar");


        //a.breathFirstTransversal(g1,"Gualtar");
        //System.out.println();
    }
    
    }

