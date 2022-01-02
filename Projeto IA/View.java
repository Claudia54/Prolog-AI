public class View {
    public View(){

    }

    public static final String ANSI_RESET = "\u001B[0m";
    public static final String ANSI_RED = "\u001B[31m";
    public static final String ANSI_GREEN = "\u001B[32m";
    public static final String ANSI_CYAN = "\u001B[36m";

    public void printMenu(){
        System.out.println(ANSI_CYAN+"¸„٭⊹✡•~⍣°”ˆ˜¨ \uD835\uDE42\uD835\uDE4D\uD835\uDE40\uD835\uDE40\uD835\uDE49 \uD835\uDE3F\uD835\uDE44\uD835\uDE4E\uD835\uDE4F\uD835\uDE4D\uD835\uDE44\uD835\uDE3D\uD835\uDE50\uD835\uDE4F\uD835\uDE44\uD835\uDE4A\uD835\uDE49 ¨˜ˆ”°⍣~•✡⊹٭„¸"+ANSI_RESET);
        System.out.println("");
        System.out.println("Seleciona a query que query que quer fazer");
        System.out.println("       (1) -  Gerar os circuitos de entrega que cubram um determinado território    ");
        System.out.println("       (2) -  Identificar os circuitos com maior número de entregas (por volume e peso)    ");
        System.out.println("       (3) -  Comparar circuitos de entrega tendo em conta os indicadores de produtividade    ");
        System.out.println("       (4) -  Escolher o circuito mais rápido    ");
        System.out.println("       (5) -  Escolher o circuito mais ecológico    ");
        System.out.println(ANSI_RED+"       (0) - Sair     "+ANSI_RESET);
    }

    public void printOptInv(){
        System.out.println("Opção inválida");
    }

    public void printPesquisas(){
        System.out.println("Seleciona o tipo de pesquisa que quer realizar");
        System.out.println("        (1) - BFS     ");
        System.out.println("        (2) - DFS     ");
        System.out.println("        (3) - Gulosa     ");
        System.out.println("        (4) - A*     ");
        System.out.println(ANSI_RED+"        (0) - Sair     "+ANSI_RESET);
    }

    public void printPesquisaInv(){
        System.out.println("Pesquisa inválida");
    }

    public void printIntroNum(){
        System.out.println("Introduza um número");
    }

    public void printIndiqueFreg(){
        System.out.println("Introduza uma freguesia: \n");
    }

    public void printIndiqueFregInv(){
        System.out.println("Freguesia Inválida");
    }

    public void printIndiqueDest(){
        System.out.println("Indique o destino da encomenda: \n");
    }

    public void printIndiqueDestInv(){
        System.out.println("Destino Inválido");
    }

    public void printErro() {
        System.out.println("Erro!");
    }
}

