import java.io.FileNotFoundException;
import java.io.InvalidClassException;
import java.util.Scanner;

public class Controller {
    Grafo grafo;

    public Controller(Grafo grafo){
        this.grafo = grafo;
    }

    public void initMenuInicial(){
        Scanner scanner = new Scanner(System.in);
        boolean quit = false;
        try {

            View jan = new View();
            while (!quit) {
                jan.printMenu();
                try {
                    int selecao = scanner.nextInt();
                    if (selecao == 1) {
                        jan.printPesquisas();
                        try {
                            int opcao = scanner.nextInt();
                            if (opcao == 1) {
                                jan.printIndiqueFreg();
                                Queries queries1 = new Queries(grafo);
                                boolean search = true;
                                while (search) {
                                    String freguesiaNome = scanner.nextLine();
                                    Nodo nodo = this.grafo.getNodo(freguesiaNome);
                                    if(nodo == null)  jan.printIndiqueFregInv();
                                    else {
                                        queries1.query1DFS("Gualtar", freguesiaNome);
                                        search = false;
                                    }
                                }
                            }else if (opcao == 2) {
                                jan.printIndiqueFreg();
                                String freguesia2 = null;
                                Queries queries2 = new Queries(grafo); //DUVIDAS
                                String writer2 = scanner.nextLine();
                                while (freguesia2 == null) {
                                    String freguesiaNome = scanner.nextLine();
                                    if (nodo.getFreguesia().equals(freguesiaNome)) { //DUVIDAS
                                        freguesia2 = freguesiaNome;
                                        queries2.query1DFS("Gualtar", freguesia2);
                                    } else {
                                        jan.printIndiqueFregInv();
                                    }
                                }
                            } else if (opcao == 3) {
                                jan.printIndiqueFreg();
                                String freguesia3 = null;
                                Queries queries3 = new Queries(); //DUVIDAS
                                String writer3 = scanner.nextLine();
                                while (freguesia3 == null) {
                                    String freguesiaNome = scanner.nextLine();
                                    if (nodo.getFreguesia().equals(freguesiaNome)) { //DUVIDAS
                                        freguesia3 = freguesiaNome;
                                        queries3.query1DFS("Gualtar", freguesia3);
                                    } else {
                                        jan.printIndiqueFregInv();
                                    }
                                }

                            } else if (opcao == 4) {
                                jan.printIndiqueFreg();
                                String freguesia4 = null;
                                Queries queries4 = new Queries(); //DUVIDAS
                                String writer4 = scanner.nextLine();
                                while (freguesia4 == null) {
                                    String freguesiaNome = scanner.nextLine();
                                    if (nodo.getFreguesia().equals(freguesiaNome)) { //DUVIDAS
                                        freguesia4 = freguesiaNome;
                                        queries4.query1DFS("Gualtar", freguesia4);
                                    } else {
                                        jan.printIndiqueFregInv();
                                    }
                                }

                            } else if (opcao == 0) {
                                quit = true;
                            } else {
                                jan.printOptInv();
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    } else if (selecao == 2) {
                        jan.printPesquisas();
                        try {
                            int opcao = scanner.nextInt();
                            if (opcao == 1) {

                            } else if (opcao == 2) {

                            } else if (opcao == 3) {

                            } else if (opcao == 4) {

                            } else if (opcao == 0) {
                                quit = true;
                            } else {
                                jan.printOptInv();
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    } else if (selecao == 3) {
                        jan.printPesquisas();
                        try {
                            int opcao = scanner.nextInt();
                            if (opcao == 1) {

                            } else if (opcao == 2) {

                            } else if (opcao == 3) {

                            } else if (opcao == 4) {

                            } else if (opcao == 0) {
                                quit = true;
                            } else {
                                jan.printOptInv();
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    } else if (selecao == 4) {
                        jan.printPesquisas();
                        try {
                            int opcao = scanner.nextInt();
                            if (opcao == 1) {
                                jan.printIndiqueDest();

                            } else if (opcao == 2) {
                                jan.printIndiqueDest();

                            } else if (opcao == 3) {
                                jan.printIndiqueDest();

                            } else if (opcao == 4) {
                                jan.printIndiqueDest();

                            } else if (opcao == 0) {
                                quit = true;
                            } else {
                                jan.printOptInv();
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    } else if (selecao == 5) {
                        jan.printPesquisas();
                        try {
                            int opcao = scanner.nextInt();
                            if (opcao == 1) {
                                jan.printIndiqueDest();

                            } else if (opcao == 2) {
                                jan.printIndiqueDest();

                            } else if (opcao == 3) {
                                jan.printIndiqueDest();

                            } else if (opcao == 4) {
                                jan.printIndiqueDest();

                            } else if (opcao == 0) {
                                quit = true;
                            } else {
                                jan.printOptInv();
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    } else if (selecao == 0) {
                        quit = true;
                    } else {
                        jan.printOptInv();
                    }
                } catch (NumberFormatException e) {
                    jan.printIntroNum();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
