:- include('basedados.pl').

%Gerar os circuitos de entrega, caso existam, que cubram um determinado território
% %não informada --> n sabe o q vem a seguir

adjacente(X,Y,E) :- edge(X,Y,E).
adjacente(X,Y,E) :- edge(Y,X,E).

bfs(Orig, Dest, Cam):- bfs2(Dest,[[Orig]],Cam).
bfs2(Dest,[[Dest|T]|_],Cam):- reverse([Dest|T],Cam). % Caminho aparece pela ordem inversa

bfs2(Dest,[LA|Outros],Cam) :- LA=[Act|_],
                              findall([X|LA],
                              (Dest\==Act,adjacente(Act,X,_),\+member(X,LA)),Novos),
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



listaDeAdjacentes(X, Lista):- findall(Y, adjacente(X, Y, _), Lista).

% Retorna o node com menor custo aproximado ao destino
menorCustoGreedy([H|ListaAdj], X):- nodo(H, CustoAprox), menorCustoAux(ListaAdj, CustoAprox, H, X). 

menorCustoAux([], CustoAprox, X, X).
menorCustoAux([H|T], CustoAprox, NodeCloser, X):- nodo(H, Y), Y>= CustoAprox, menorCustoAux(T, CustoAprox, NodeCloser, X).
menorCustoAux([H|T], CustoAprox, NodeCloser, X):- nodo(H, Y), Y< CustoAprox, menorCustoAux(T, Y, H, X).

% Algoritmo Greedy Search (Gulosa)
greedySearch(Inicio, Path, Cost):- greedySearchAux(Inicio, [], 0, Path, Cost).

greedySearchAux(gualtar, Visited, Cost, Path, Cost):- reverse([gualtar|Visited], Path).
greedySearchAux(Node, Visited, Cost, Path, Total):- listaDeAdjacentes(Node, ListAdj),
	menorCustoGreedy(ListAdj, NextNode),
	not(member(NextNode, Visited)),
	adjacente(Node, NextNode, Value),
	NewCost is Cost + Value,
	greedySearchAux(NextNode, [Node|Visited], NewCost, Path, Total).

%% A estrela
resolve_aestrela(Nodo, Caminho/Custo) :-
	nodo(Nodo, Estima),
	aestrela([[Nodo]/0/Estima], InvCaminho/Custo/_),
	inverso(InvCaminho, Caminho).

aestrela(Caminhos, Caminho) :-
	obtem_melhor(Caminhos, Caminho),
	Caminho = [Nodo|_]/_/_,
	pontorecolha(Nodo).

aestrela(Caminhos, SolucaoCaminho) :-
	obtem_melhor(Caminhos, MelhorCaminho),
	select(MelhorCaminho, Caminhos, OutrosCaminhos),
	listaDeAdjacentes(MelhorCaminho, ExpCaminhos),
	append(OutrosCaminhos, ExpCaminhos, NovoCaminhos),
    aestrela(NovoCaminhos, SolucaoCaminho).	

obtem_melhor([Caminho], Caminho) :- !.
obtem_melhor([Caminho1/Custo1/Est1,_/Custo2/Est2|Caminhos], MelhorCaminho) :-
	Custo1 + Est1 =< Custo2 + Est2, !,
	obtem_melhor([Caminho1/Custo1/Est1|Caminhos], MelhorCaminho). 
obtem_melhor([_|Caminhos], MelhorCaminho) :- 
	           obtem_melhor(Caminhos, MelhorCaminho).



%QUERY 4
%DPS
maisRapidoDFS(Inicio, Path, Cost):- maisRapidoDFS2(Inicio, [], 0, Path, Cost).

maisRapidoDFS2(gualtar, Visited, Cost, Path, Cost):- reverse([gualtar|Visited], Path). 
maisRapidoDFS2(Node, Visited, Cost, Path, Total):- adjacente(Node, X, Value),
    not(member(X, Visited)), 
    NewCost is Cost + Value,
    maisRapidoDFS2(X, [Node|Visited], NewCost, Path, Total).

solucao(Inicio, Path, Cost,Res) :- findall((Path,Cost),maisRapidoDFS(Inicio, Path, Cost),Lista),
                                    predsort(compare_by_second2,Lista,L),
                                    first(L,Res).

                
compare_by_second2(<, (A, B), (C, D)) :-
    (   B @< D
    ;   B == D,
        A @< C ).
compare_by_second2(=, (A, B), (C, D)) :-
    A == C,
    B == D.
compare_by_second2(>, (A, B), (C, D)) :-
    (   B @> D
    ;   B == D,
        A @> C ).


first([H|T],R):- R=H.

%%%%

