%:- include('basedados.pl').
:-include('queries.pl').


%Gerar os circuitos de entrega, caso existam, que cubram um determinado território
% ------------------------------------PESQUISA NÃO INFORMADA

adjacente(X,Y,E) :- edge(X,Y,E).
adjacente(X,Y,E) :- edge(Y,X,E).

%--------BEST FIRST SEARCH
bfs(Orig, Dest, Cam):- bfs2(Dest,[[Orig]],Cam).
bfs2(Dest,[[Dest|T]|_],Cam):- reverse([Dest|T],Cam). % Caminho aparece pela ordem inversa

bfs2(Dest,[LA|Outros],Cam) :- LA=[Act|_],
                              findall([X|LA],
                              (Dest\==Act,adjacente(Act,X,_),\+member(X,LA)),Novos),
                              append(Outros,Novos,Todos),
                              bfs2(Dest,Todos,Cam).


%---------DEPTH FIRST SEARCH
dfs(Orig,Dest,Cam):- dfs2(Orig,Dest,[Orig],Cam). %condicao final: nó actual = destino
dfs2(Dest,Dest,LA,Cam):- reverse(LA,Cam). %caminho actual esta invertido
dfs2(Act,Dest,LA,Cam) :- adjacente(Act,X,_), %testar ligacao entre ponto actual e um qualquer X
                         \+ member(X,LA), % testar nao circularidade p/evitar nós ja visitados
                         dfs2(X,Dest,[X|LA],Cam). %chamada recursiva



listaDeAdjacentes(X, Lista):- findall(Y, adjacente(X, Y, _), Lista).



%----------BUSCA ITERATIVA EM PROFUNDIDADE

equivale([],[]).      
equivale([H|T],[X|G]):- H=X , equivale(T,G).

iterativa(Orig,Dest,Cam,Max):- dfs2(Orig,Dest,[Orig],Cam1), 
                         length(Cam1,Length),
                        (Length =< Max),equivale(Cam1,Cam).

                         
%------------------------------------------PESQUISA INFORMADA 
%----------GULOSA
gulosa(Nodo, Caminho/Custo) :-
	nodo(Nodo, Estima),
	agulosa([[Nodo]/0/Estima], InvCaminho/Custo/_),
	reverse(InvCaminho, Caminho).

agulosa(Caminhos, Caminho) :-
	melhor_g(Caminhos, Caminho),
	Caminho = [Nodo|_]/_/_,
	pontorecolha(Nodo).

agulosa(Caminhos, SolucaoCaminho) :-
	melhor_g(Caminhos, MelhorCaminho),
	select(MelhorCaminho, Caminhos, OutrosCaminhos),
	expande_gulosa(MelhorCaminho, ExpCaminhos),
	append(OutrosCaminhos, ExpCaminhos, NovoCaminhos),
    agulosa(NovoCaminhos, SolucaoCaminho).		

melhor_g([Caminho], Caminho) :- !.

melhor_g([Caminho1/Custo1/Est1,_/_/Est2|Caminhos], MelhorCaminho) :-
	Est1 =< Est2, !,
	melhor_g([Caminho1/Custo1/Est1|Caminhos], MelhorCaminho).
	
melhor_g([_|Caminhos], MelhorCaminho) :- 
	melhor_g(Caminhos, MelhorCaminho).

expande_gulosa(Caminho, ExpCaminhos) :-
	findall(NovoCaminho, adjacente2(Caminho,NovoCaminho), ExpCaminhos).	

tempo_agulosa(In,Path,R):-call_time(gulosa(In,Path),R).
                       


%%-------------ESTRELA
resolve_aestrela(Nodo, Caminho/Custo) :-
	nodo(Nodo, Estima),
	aestrela([[Nodo]/0/Estima], InvCaminho/Custo/_),
	reverse(InvCaminho, Caminho).

aestrela(Caminhos, Caminho) :-
	obtem_melhor(Caminhos, Caminho),
	Caminho = [Nodo|_]/_/_,
	pontorecolha(Nodo).

aestrela(Caminhos, SolucaoCaminho) :-
	obtem_melhor(Caminhos, MelhorCaminho),
	select(MelhorCaminho, Caminhos, OutrosCaminhos),
	expande_aestrela(MelhorCaminho, ExpCaminhos),
	append(OutrosCaminhos, ExpCaminhos, NovoCaminhos),
    aestrela(NovoCaminhos, SolucaoCaminho).	

obtem_melhor([Caminho], Caminho) :- !.
obtem_melhor([Caminho1/Custo1/Est1,_/Custo2/Est2|Caminhos], MelhorCaminho) :-
	Custo1 + Est1 =< Custo2 + Est2, !,
	obtem_melhor([Caminho1/Custo1/Est1|Caminhos], MelhorCaminho). 
obtem_melhor([_|Caminhos], MelhorCaminho) :- 
	           obtem_melhor(Caminhos, MelhorCaminho).


adjacente2([Nodo|Caminho]/Custo/_, [ProxNodo,Nodo|Caminho]/NovoCusto/Est) :-
    adjacente(Nodo,ProxNodo,PassoCusto),
    \+member(ProxNodo, Caminho),
    NovoCusto is Custo + PassoCusto,
    nodo(ProxNodo, Est).


expande_aestrela(Caminho, ExpCaminhos) :-
	findall(NovoCaminho, adjacente2(Caminho,NovoCaminho), ExpCaminhos).

tempo_aestrela(In,Path,R):-call_time((resolve_aestrela(In,Path)),R).
                     
                       







%---------------------------------------------CAMINHO MAIS RÁPIDO 
%---------DFS
maisRapidoDFS(Inicio,Path, Cost):- maisRapidoDFS2(Inicio, [], 0, Path, Cost).

maisRapidoDFS2(gualtar, Visited, Cost, Path, Cost):- reverse([gualtar|Visited], Path). 
maisRapidoDFS2(Node, Visited, Cost, Path, Total):- adjacente(Node, X, Value),
    not(member(X, Visited)), 
    NewCost is Cost + Value,
    maisRapidoDFS2(X, [Node|Visited], NewCost, Path, Total).

solucao(Inicio,Lista) :- findall((Path,Cost),maisRapidoDFS(Inicio, Path, Cost),Lista).
                                   

fim(Inicio,Res):-solucao(Inicio,Path), 
                             predsort(compare_by_second2,Path,L),
                             first(L,Res).

first([H|_],R):- R=H.


tempodfs(In,Path,Cost,R):-call_time((maisRapidoDFS(In,Path,Cost)),R).
                         

%-------------BFS


maisRapidoBFS(Inicio,Fim,Caminho,C):- maisRapidoBFS2(Fim,[[Inicio/0]],Caminho,C).

maisRapidoBFS2(Fim,[[Fim/C|T]|_],Lista,C):-removeCusto([Fim/C|T],Lista1),reverse(Lista1,Lista).
maisRapidoBFS2(Fim,[LA|Outros],Caminho,C):-
                        LA=[Act/CustoUltimo|_],
                        findall([X/Custo|LA],((Act \= Fim),adjacente(Act,X,CustoNovo),
                        \+(member(X/Custo,LA)),Custo is CustoUltimo + CustoNovo),N),
                        append(Outros,N,Final),
                        maisRapidoBFS2(Fim,Final,Caminho,C).

removeCusto([],[]).
removeCusto([L/_|T],[L|T2]):-removeCusto(T,T2).


solucaoB(Inicio,Lista) :- findall((Path,Cost),maisRapidoBFS(Inicio,gualtar, Path, Cost),Lista).
                                   

fimB(Inicio,Res):-solucaoB(Inicio,Path), 
                             predsort(compare_by_second2,Path,L),
                             first(L,Res).
                           

tempobfs(In,Fim,Path,R):-call_time((maisRapidoBFS(In,Fim,Path,_)),R).
                        

%-------------ITERATIVA
maisRapidoIterativa(Inicio,Cam, Cost,Max):- maisRapidoIterativa2(Inicio, [], 0,Cam1, Cost),
                                             length(Cam1,Length),
                                            (Length =< Max),equivale(Cam1,Cam).

maisRapidoIterativa2(gualtar, Visited, Cost, Path, Cost):- reverse([gualtar|Visited], Path). 
maisRapidoIterativa2(Node, Visited, Cost, Path, Total):- adjacente(Node, X, Value),
    not(member(X, Visited)), 
    NewCost is Cost + Value,
    maisRapidoIterativa2(X, [Node|Visited], NewCost, Path, Total).

solucaoI(Inicio,Lista,Max) :- findall((Path,Cost),maisRapidoIterativa(Inicio,Path,Cost,Max),Lista).
                                   

fimI(Inicio,Res,Max):-solucaoI(Inicio,Path,Max), 
                             predsort(compare_by_second2,Path,L),
                             first(L,Res).

tempoIterativa(In,Path,R):-call_time((maisRapidoIterativa(In,Path,_,6)),R).%valor exemplo dado 
                        



%---------------ESTRELA 

maisRapido_aEstrela(Nodo,Maispequeno) :- findall(Caminho/Custo,resolve_aestrela(Nodo,Caminho/Custo),List),first(List,Maispequeno).


%---------------GULOSA

maisRapido_aGulosa(Nodo,Maispequeno) :- findall(Caminho/Custo,gulosa(Nodo,Caminho/Custo),List),first(List,Maispequeno).







% ----------------------------------------------MAIOR VOLUME E PESO DFS 
%encontra somando o peso e volume
encontraV(X,P1):-clienteerua(Cliente,rua(X,_)),caminhoV(Cliente,encomenda(_,P,V),_,_),P1 is P+V.

%Encontra somando o peso e volume de todas as encomendas
encontraPesoVNovo([H|T],P) :-encontraPesoV([H|T],0,P).

encontraPesoV(_,P,P).
encontraPesoV([H|T],P,Total):-encontraV(H,P2),P1 is P+P2, encontraPesoV(T,P1,Total).

%De um dado percurso encontra os peso+volume transportados em cada circuito
auxencontra2([H|T],R):-findall((PesoVol,[H|T]),encontraPesoVNovo([H|T],PesoVol),List),reverse(List,PathR),first(PathR,R).

%---------DFS

volume_PesoDFS(Origem,Peso):-dfs(Origem,gualtar,Path),
                             auxencontra2(Path,Peso).


%---------BFS
volume_PesoBFS(Origem,Peso):-bfs(Origem,gualtar,Path),
                             auxencontra2(Path,Peso).

%---------Iterativa 

volume_PesoIterativa(Origem,Peso,Max):-iterativa(Origem,gualtar,Path,Max),
                                 auxencontra2(Path,Peso).



%---------ESTRELA
volume_Peso_aStar(Origem,Peso):-resolve_aestrela(Origem,Path/_),
                             auxencontra2(Path,Peso).

%--------GULOSA
volume_Peso_agulosa(Origem,Peso):-gulosa(Origem,Path/_),
                                  auxencontra2(Path,Peso).







%FUNÇÕES AUXILIARES PARA TEMPO
%Encontra o peso de cada encomenda e a data a que o cliente que mora na rua X quer a encomenda
encontraVP(X,P,D):-clienteerua(Cliente,rua(X,_)),caminhoV(Cliente,encomenda(_,P,_),D,_).

%Encontra somando o peso  de todas as encomendas
encontraPesoDataNovo([H|T],[(H,D)|F],P) :-encontraPesoData([H|T],[(H,D)|F],0,P).

encontraPesoData([H|_],[(H,_)|_],P,P).
encontraPesoData([H|T],[(H,D)|F],P,Total):-encontraVP(H,P2,D),P1 is P+P2, encontraPesoData(T,F,P1,Total).

auxencontra([H|T],R):-findall((P,Path),encontraPesoDataNovo([H|T],Path,P),List),reverse(List,PathR),first(PathR,R).



takefirst([_|T],T).

%funçao que percorre a lista até gualtar pois quando encontra gualtar é o destino
runLista([(R,T)|K],FinalLista):-percorreLista([(R,T)|K],[],FinalLista).
percorreLista([(gualtar,_)|_],Nodo,FinalLista):-reverse(Nodo,FinalLista).
percorreLista([(R,T)|K],Nodo,FinalLista):-R\=gualtar,percorreLista(K,[(R,T)|Nodo],FinalLista).

% função que encontra a menor data a q um cliente quer a sua encomenda num dado circuito 
encontraMenorData(Lista,Time):-runLista(Lista,Lista1),predsort(compare_by_second2,Lista1,ListaN),first(ListaN,Time).

% função que devolve a velocidade de um veiculo consoante o peso da encomenda
velocidadeVeiculo(PesoVol,bicicleta,Velocidade):-Velocidade is 20-(0.7*PesoVol).
velocidadeVeiculo(PesoVol,mota,Velocidade):-Velocidade is 40-(0.5*PesoVol).
velocidadeVeiculo(PesoVol,carro,Velocidade):-Velocidade is 60-(0.1*PesoVol).

% dado um peso devolve a velocidade para cada transporte
getVelocidadeEncomenda(PV,List):- findall((Veiculo,Velocidade),(velocidadeVeiculo(PV,Veiculo,Velocidade)),List).

%função que dado uma lista com transporte e a velocidade relativa de cada um consoante o peso q transporta calcula o tempo 
% que demorará a dcorrer o percurso todo com o transporte e compara esse tempo com o tempo que o cliente quer a encomenda
comparaTempos([],_,_,_).
comparaTempos([(_,Y)|T],Custo,Tempo,Veiculo,TempoTrans):- G is (Custo/Y),
                                                          G >Tempo, comparaTempos(T,Custo,Tempo,Veiculo, TempoTrans).
comparaTempos([(X,Y)|_],Custo,Tempo,Veiculo,TempoTrans) :- TempoTrans is (Custo/Y), TempoTrans =< Tempo, Veiculo = X, TempoTrans = TempoTrans.





%----------------------------------TEMPO, PRODUTIVIDADE E MELHOR VEICULO
%DFS
%dado uma origem (fim em gualtar) indica os possiveis circuitos , o melhor veiculo a ser usado o tempo que demora e o custo.
escolheVeiculoeTempoDFS(Origem,Path,Veiculo,Time,Custo):-maisRapidoDFS(Origem,Path,Custo),
                                    auxencontra(Path,(Peso,Caminho)), 
                                    encontraMenorData(Caminho,(_,MaiorT)), 
                                    getVelocidadeEncomenda(Peso,ListVelVeic),
                                    comparaTempos(ListVelVeic,Custo,MaiorT,Veiculo,Time).



%BFS 
%dado uma origem indica os possiveis circuitos , o melhor veiculo a ser usado o tempo que demora e o custo.
escolheVeiculoeTempoBFS(Origem,Path,Veiculo,Time,Custo):-maisRapidoBFS(Origem,gualtar,Path,Custo),
                                    auxencontra(Path,(Peso,Caminho)), 
                                    encontraMenorData(Caminho,(_,MaiorT)), 
                                    getVelocidadeEncomenda(Peso,ListVelVeic),
                                    comparaTempos(ListVelVeic,Custo,MaiorT,Veiculo,Time).

%ITERATIVA 
%dado uma origem indica os possiveis circuitos , o melhor veiculo a ser usado o tempo que demora e o custo.
escolheVeiculoeTempoIterativa(Origem,Max,Path,Veiculo,Time,Custo):-maisRapidoIterativa(Origem,Path,Custo,Max),
                                                       auxencontra(Path,(Peso,Caminho)), 
                                                       encontraMenorData(Caminho,(_,MaiorT)), 
                                                       getVelocidadeEncomenda(Peso,ListVelVeic),
                                                       comparaTempos(ListVelVeic,Custo,MaiorT,Veiculo,Time).
                              
 %TEMPO GULOSA  
 %dado uma origem indica os possiveis circuitos , o melhor veiculo a ser usado o tempo que demora e o custo.
 escolheVeiculoeTempo_gulosa(Origem,Path,Veiculo,Time,Custo):-gulosa(Origem,Path/Custo),
                                                             auxencontra(Path,(Peso,Caminho)), 
                                                             encontraMenorData(Caminho,(_,MaiorT)), 
                                                             getVelocidadeEncomenda(Peso,ListVelVeic),
                                                             comparaTempos(ListVelVeic,Custo,MaiorT,Veiculo,Time).

%TEMPO ESTRELA  
%dado uma origem indica os possiveis circuitos , o melhor veiculo a ser usado o tempo que demora e o custo.
escolheVeiculoeTempo_estrela(Origem,Path,Veiculo,Time,Custo):-resolve_aestrela(Origem,Path/Custo),
                                                            auxencontra(Path,(Peso,Caminho)), 
                                                            encontraMenorData(Caminho,(_,MaiorT)), 
                                                            getVelocidadeEncomenda(Peso,ListVelVeic),
                                                            comparaTempos(ListVelVeic,Custo,MaiorT,Veiculo,Time).
                            





