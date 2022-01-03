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
                                Queries queries = new Queries(grafo);
                                boolean search = true;
                                while (search) {
                                    String freguesiaNome = scanner.nextLine();

                                    Nodo nodo = this.grafo.getNodo(freguesiaNome);
                                    if(nodo == null)  jan.printIndiqueFregInv();
                                    else {
                                        queries.q1BFS("Gualtar", freguesiaNome);
                                        search = false;
                                    }
                                }
                            }else if (opcao == 2) {
                                jan.printIndiqueFreg();
                                Queries queries = new Queries(grafo);
                                boolean search = true;
                                while (search) {
                                    String freguesiaNome = scanner.nextLine();
                                    Nodo nodo = this.grafo.getNodo(freguesiaNome);
                                    if (nodo == null) jan.printIndiqueFregInv();
                                    else {
                                        queries.query1DFS("Gualtar", freguesiaNome);
                                        search = false;
                                    }
                                }
                            } else if (opcao == 3) {
                                jan.printIndiqueFreg();
                                Queries queries = new Queries(grafo);
                                boolean search = true;
                                while (search) {
                                    String freguesiaNome = scanner.nextLine();
                                    Nodo nodo = this.grafo.getNodo(freguesiaNome);
                                    if (nodo == null) jan.printIndiqueFregInv();
                                    else {
                                        queries.query1DFS("Gualtar", freguesiaNome);
                                        search = false;
                                    }
                                }

                            } else if (opcao == 4) {
                                jan.printIndiqueFreg();
                                Queries queries = new Queries(grafo);
                                boolean search = true;
                                while (search) {
                                    String freguesiaNome = scanner.nextLine();
                                    Nodo nodo = this.grafo.getNodo(freguesiaNome);
                                    if (nodo == null) jan.printIndiqueFregInv();
                                    else {
                                        queries.query1DFS("Gualtar", freguesiaNome);
                                        search = false;
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
