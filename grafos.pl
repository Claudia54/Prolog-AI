%:- include('basedados.pl').
:-include('queries.pl').

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
%DFS
maisRapidoDFS(Inicio,Path, Cost):- maisRapidoDFS2(Inicio, [], 0, Path, Cost).

maisRapidoDFS2(gualtar, Visited, Cost, Path, Cost):- reverse([gualtar|Visited], Path). 
maisRapidoDFS2(Node, Visited, Cost, Path, Total):- adjacente(Node, X, Value),
    not(member(X, Visited)), 
    NewCost is Cost + Value,
    maisRapidoDFS2(X, [Node|Visited], NewCost, Path, Total).

solucao(Inicio,Lista) :- findall((Path,Cost),maisRapidoDFS(Inicio, Path, Cost),Lista).
                                    %predsort(compare_by_second2,Lista,L),
                                    %first(L,Res).

fim(Inicio, Path, Cost,Res):-solucao(Inicio,Lista), 
                             predsort(compare_by_second2,Lista,L),
                             first(L,Res).


first([H|T],R):- R=H.

%%%%VOLUME E PESO

%bfs(Orig, Dest, Cam):- bfs2(Dest,[[Orig]],Cam).
%bfs2(Dest,[[Dest|T]|_],Cam):- reverse([Dest|T],Cam). % Caminho aparece pela ordem inversa

%bfs2(Dest,[LA|Outros],Cam) :- LA=[Act|_],
%                              findall([X|LA],
%                              (Dest\==Act,adjacente(Act,X,_),\+member(X,LA),encontra),Novos),
%                              append(Outros,Novos,Todos),
%                              bfs2(Dest,Todos,Cam).

maisRapidoDFS1(Inicio,Path, Cost,PesoeVol,Data):- maisRapidoDFS12(Inicio, [], 0, Path, Cost,0,[]).

maisRapidoDFS12(gualtar, Visited, Cost, Path, Total,PesoeVol,Data):- reverse([gualtar|Visited], Path),reverse(Data).
maisRapidoDFS12(Node, Visited, Cost, Path, Total,PesoeVol,Data):- adjacente(Node, X, Value),
    not(member(X, Visited)), 
    encontraVP(X,PesoVol,Data1),
    PesoeVol1 is PesoeVol+PesoeVol1,
    NewCost is Cost + Value,
    maisRapidoDFS12(X, [Node|Visited], NewCost, Path, Total,PesoeVol1,[Data1|Data]).




encontraVP(X,P,D):-clienteerua(Cliente,rua(X,_)),caminhoV(_,Cliente,encomenda(_,P,_),_,D,_).

velocidadeVeiculo(PesoVol,bicicleta,Velocidade):-Velocidade is 20-(0.7*PesoVol).
velocidadeVeiculo(PesoVol,mota,Velocidade):-Velocidade is 40-(0.5*PesoVol).
velocidadeVeiculo(PesoVol,carro,Velocidade):-Velocidade is 60-(0.1*PesoVol).

getVelocidadeEncomenda(X,PV,List):- findall((Veiculo,Velocidade),(velocidadeVeiculo(PV,Veiculo,Velocidade)),List).

getV2(X,PV,(Data,Listaf)):-encontraVP(X,PV,Data),findall((List),getVelocidadeEncomenda(X,PV,List),Listaf).
/*
escolheVeiculo(Origem,ListaVeiculo):-maisRapidoDFS(Origem,_,Custo),
                                      getVelocidadeEncomenda(Origem,Data,List),
                                      comparaTempos(List,Custo,Data,Veiculo).
*/
comparaTempos([],_,_,_).
comparaTempos([(X,Y)|T],Custo,Tempo,Veiculo):- TempoBic is (Custo/Y),
                                               TempoBic>Tempo -> comparaTempos(T,Custo,Tempo,Veiculo);
                                               Veiculo = X.





%% DFS 
/*
dfs(Orig,Dest,Cam):- dfs2(Orig,Dest,[Orig],Cam). %condicao final: nó actual = destino
dfs2(Dest,Dest,LA,Cam):- reverse(LA,Cam). %caminho actual esta invertido
dfs2(Act,Dest,LA,Cam) :- adjacente(Act,X,_), %testar ligacao entre ponto actual e um qualquer X
                         \+ member(X,LA), % testar nao circularidade p/evitar nós ja visitados
                         %getVelocidadeEncomenda
                         dfs2(X,Dest,[X|LA],Cam). %chamada recursiva*/
