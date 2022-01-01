:- include('basedados.pl').

%Gerar os circuitos de entrega, caso existam, que cubram um determinado território
% %não informada --> n sabe o q vem a seguir

adjacente(X,Y,E, grafo(_,Es)) :- member(edge(X,Y,E),Es).
adjacente(X,Y,E, grafo(_,Es)) :- member(edge(Y,X,E),Es).

caminho(G,A,B,P) :- caminho1(G,A,[B],P).
caminho1(_,A,[A|P1],[A|P1]).
caminho1(G,A,[Y|P1],P) :-
    adjacente(X,Y,_,G), nao(membro(X,[Y|P1])), caminho1(G,A,[X,Y|P1],P).



ciclo(G,A,[A|P]) :- 
    adjacente(A,B,_,G),
    caminho(G,B,A,P).
