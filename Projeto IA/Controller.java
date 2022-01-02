import java.io.FileNotFoundException;
import java.io.InvalidClassException;
import java.util.Scanner;

public class Controller {
    public void initMenuInicial(){
        Scanner scanner = new Scanner(System.in);
        boolean quit = false;
        try {

            View jan = new View();
            Nodo nodo;  //DUVIDAS
            Grafo grafo; //DUVIDAS
            while (!quit) {
                jan.printMenu();
                try {
                    int selecao = scanner.nextInt();
                    if (selecao == 1) {
                        jan.printPesquisas();
                        try {
                            int opcao = scanner.nextInt();
                            if (opcao == 1) {

                            } else if (opcao == 2) {
                                jan.printIndiqueFreg();
                                String freguesia = null;
                                Queries queries = new Queries(); //DUVIDAS
                                String writer = scanner.nextLine();
                                while (freguesia == null) {
                                    String freguesiaNome = scanner.nextLine();
                                    if (nodo.getFreguesia().equals(freguesiaNome)) { //DUVIDAS
                                        freguesia = freguesiaNome;
                                        queries.query1DFS("Gualtar", freguesia);
                                    } else {
                                        jan.printIndiqueFregInv();
                                    }
                                }
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
                    } else if (selecao == 5) {
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
