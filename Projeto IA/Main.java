import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

public class Main{
    public static void main (String[] args){
        Nodo a = new Nodo("Gualtar", "Familia Real", 10, "Esposende");
        Nodo a1 = new Nodo("Familia Real","Gualtar", 10, "Esposende");
        Nodo d = new Nodo("Familia Real", "Nova America", 3, "Esposende");
        Nodo b1 = new Nodo( "Nova America", "Gualtar",20, "Esposende");
        Nodo c = new Nodo("Gualtar", "Torta", 5, "Esposende");
        Nodo c1 = new Nodo( "Torta", "Gualtar",5, "Esposende");
        Nodo b = new Nodo("Gualtar", "Nova America", 20, "Esposende");
        Nodo d1 = new Nodo( "Nova America", "Familia Real",3, "Esposende");
        Nodo e = new Nodo("Familia Real", "Torta", 1,"Esposende");
        Nodo e1 = new Nodo( "Torta", "Familia Real", 1,"Esposende");
        Nodo f = new Nodo("Nova America", "Torta", 2,"Esposende");
        Nodo f1 = new Nodo( "Torta", "Nova America", 2,"Esposende");
        Nodo g = new Nodo("Gualtar", "Vasco da Gama", 25,"Bagunte");
        Nodo g1 = new Nodo( "Vasco da Gama", "Gualtar", 25,"Bagunte");
        Nodo h = new Nodo("Gualtar", "Da Torre", 30,"Bagunte");
        Nodo h1 = new Nodo( "Da Torre", "Gualtar",30,"Bagunte");
        Nodo i = new Nodo("Vasco da Gama", "Da Torre", 4,"Bagunte");
        Nodo i1 = new Nodo( "Da Torre", "Vasco da Gama",4,"Bagunte");
        Nodo j = new Nodo("Afonso de Jeronimo", "Gualtar", 15, "Prado");
        Nodo j1 = new Nodo("Gualtar", "Afonso de Jeronimo", 15, "Prado");
/*
       Encomenda enc1 = new Encomenda("200" , 20, 5, "bicicleta", LocalDateTime.of(202,10,4,18,30),LocalDateTime.of(2020,10,5,17,20),"Roger","Torta");
        Encomenda enc2 = new Encomenda("2001", 2800, 12, "carro",LocalDateTime.of(2020,10,4,18,30),LocalDateTime.of(2020,10,5,17,20),"Ilidio","Da Torre");
       Encomenda enc3 = new Encomenda("2002", 20, 5,"mota",LocalDateTime.of(2021,11,24,17,20),LocalDateTime.of(2021,12,3,19,00),"Sheila","Torta");
      Encomenda enc4 = new Encomenda("2003",75,1,"carro",LocalDateTime.of(2021,12,2,11,15),LocalDateTime.of(2021,12,3,19,20),"Filipe","Familia Real");
       Encomenda enc5 = new Encomenda("2004", 5,1,"mota",LocalDateTime.of(2020,10,4,11,50),LocalDateTime.of(2020,10,4,11,50),"Carlos","Da Torre");

   


        //        Encomenda enc6 = new Encomenda("2005");
//        Encomenda enc7 = new Encomenda("2006");
//        Encomenda enc8 = new Encomenda("2007");
//        Encomenda enc9 = new Encomenda("2008");
//        Encomenda enc10 = new Encomenda("2010");
//        Encomenda enc11 = new Encomenda("2011");
//        Encomenda enc12 = new Encomenda("2012");
*/
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
        list.add(a1);
        list.add(b1);
        list.add(c1);
        list.add(d1);
        list.add(e1);
        list.add(f1);
        list.add(g1);
        list.add(h1);
        list.add(i1);
        list.add(j1);

           Grafo grafo = new Grafo(list);
//        //Set<String> n= new HashSet<String>();

       HashMap<String,List<Encomenda>> encomendas  = new HashMap<String,List<Encomenda>>();
       List<Encomenda> listEnc1= new ArrayList<Encomenda>();
/*        listEnc1.add(enc1);
        listEnc1.add(enc3);
        listEnc1.add(enc4);
        encomendas.put("Esposende",listEnc1);
        List<Encomenda> listEnc2= new ArrayList<Encomenda>();
        listEnc2.add(enc2);
        listEnc2.add(enc5);
        encomendas.put("Bagunte",listEnc2);
        //encomendas.get("Esposende").add(enc3);
*/
           Queries q = new Queries(grafo,encomendas);
          int num= q.q4BFS("Gualtar","Esposende");
           q.q1BFS("Gualtar", "Esposende");
           System.out.println(num);
//        q.query1DFS("Gualtar","Esposende");
//        q.q1BFS("Gualtar", "Esposende");


        //a.breathFirstTransversal(g1,"Gualtar");
        //System.out.println();
       // Controller controller = new Controller(grafo);
       // controller.initMenuInicial();
    }
    
    }

