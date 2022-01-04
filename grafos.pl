:- include('basedados.pl').

%Gerar os circuitos de entrega, caso existam, que cubram um determinado território
% %não informada --> n sabe o q vem a seguir

adjacente(X,Y,E) :- edge(X,Y,E).
%adjacente(X,Y,E) :- edge(Y,X,E).

bfs(Orig, Dest, Cam):- bfs2(Dest,[[Orig]],Cam).
bfs2(Dest,[[Dest|T]|_],Cam):- reverse([Dest|T],Cam). % Caminho aparece pela ordem inversa

bfs2(Dest,[LA|Outros],Cam) :- LA=[Act|_],
                              findall([X|LA],
                              (Dest\==Act,edge(Act,X,_),\+member(X,LA)),Novos),
                              append(Outros,Novos,Todos),
                              bfs2(Dest,Todos,Cam).

/*ciclo(G,A,[A|P]) :- 
    adjacente(A,B,_),
    caminho(G,B,A,P).*/

dfs(Orig,Dest,Cam):- dfs2(Orig,Dest,[Orig],Cam). %condicao final: nó actual = destino
dfs2(Dest,Dest,LA,Cam):- reverse(LA,Cam). %caminho actual esta invertido
dfs2(Act,Dest,LA,Cam) :- adjacente(Act,X,_), %testar ligacao entre ponto actual e um qualquer X
                         \+ member(X,LA), % testar nao circularidade p/evitar nós ja visitados
                         dfs2(X,Dest,[X|LA],Cam). %chamada recursiva