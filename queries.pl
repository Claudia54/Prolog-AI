% Include Base de Dados 
:- include('basedados.pl').

% Query text -> verifica quantos caminhos tem confirmação 
queryteste(X) :- 
    findall(
        Y,
        (caminho(_,_,_,_,_,_,_,Y),confirmacao(_,_,_,_,_,_,Y)),
        List
    ),
    length(List,X).

% QUERY 1
compare_by_second(<, (A, B), (C, D)) :-
    (   B @> D
    ;   B == D,
        A @> C ).
compare_by_second(=, (A, B), (C, D)) :-
    A == C,
    B == D.
compare_by_second(>, (A, B), (C, D)) :-
    (   B @< D
    ;   B == D,
        A @< C ).

query1_aux(Estafeta,N) :-
    findall(
        Serie,
        (
            confirmacao(Estafeta,_,Veiculo,_,_,_,Serie),
            veiculo(Veiculo,VeiculoV),
            VeiculoV==0
        ),
        Lista
    ),
    length(Lista,N).

query1_tuple([],[]).
query1_tuple([Estafeta|Estafetas],[(X,Y)|T]) :-
    query1_aux(Estafeta,N),
    X = Estafeta,
    Y = N,
    query1_tuple(Estafetas,T).

query1(X) :-
    findall(Estafeta,estafeta(Estafeta),Lista),
    query1_tuple(Lista,ListaV),
    predsort(compare_by_second,ListaV,[(X,_)|_]).

% QUERY 2
% Dado um cliente e uma encomenda identifica o(s) estafeta(s) que realizaram esse percurso 
query2_aux(Cliente,Encomenda,Estafeta) :-
    caminho(Estafeta,Cliente,_,_,Encomenda,_,_,Y),confirmacao(_,_,_,_,_,_,Y),estafeta(Estafeta).
query2(Cliente,Encomenda,Lista) :-
    findall(X,query2_aux(Cliente,Encomenda,X),Lista).


% QUERY 3 
% Dado um estafeta identifica o(s) clientes por ele servidos
query3_aux(Estafeta,Cliente):-confirmacao(Estafeta,Cliente,_,_,_,_,_),estafeta(Estafeta).
query3(Estafeta,Lista):- findall(X,query3_aux(Estafeta,X),Lista).


% QUERY 4 
% Dado um dia identifica o valor faturado pela empresa Green Distributions
query4_aux(Dia,Preco) :-
    caminho(_,_,_,dataehora(_,Dia),_,Preco,_,_). %assumimos que paga qd faz a encomenda
query4(Data,Valor) :-
    findall(Custo,query4_aux(Data,Custo),Lista),
    soma(Lista,Valor).


% QUERY 5
% Compara pela ordem decrescente 
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

% Identifica todas as ruas existentes  
query5_aux2(List) :-
    findall(
        Rua,
        (
            confirmacao(_,Cliente,_,_,_,_,_),
            clienteerua(Cliente,rua(Rua,_))
        ),
        List
    ).

% Procura uma certa rua numa lista de ruas e verfica se se encontra um certo número de vezes 
procura(Rua1,[],(Rua1,0)).
procura(Rua1 ,[Rua1|Ruas],(Rua1,X)) :-
    procura(Rua1,Ruas,(Rua1,X0)), X is X0+1.
procura(Rua1 ,[Rua3|Ruas],(Rua1,X)) :-
    Rua1\=Rua3,procura(Rua1,Ruas,(Rua1,X)).

% Organiza as Ruas procurando a cabeça da lista pelo resto da lista e organizando
query_comp([],[]).
query_comp([Rua|Ruas],[(X,Y)|T]) :-
    procura(Rua,Ruas,P),P=(X,Y), 
    query_comp(Ruas,T).

% Dada uma lista de ruas organiza por ordem decrescente 
query5_aux1(Ruas,A) :-
    query_comp(Ruas,P),
    predsort(compare_by_second2,P,A).

% Apenas a cabeça da lista é a rua mais frequentada
query5(Rua) :-
    query5_aux2(List),
    query5_aux1(List,[(X,_)|_]),
    Rua = X. 


% QUERY 6
% Quantas entregas fez o estafeta
query6_contador(Estafeta,Contador) :-
    findall(Estafeta,confirmacao(Estafeta,_,_,_,_,_,_),List),
    length(List,Contador).

% Somar as avaliaçoes dadas ao estafeta
query6_avalia(Estafeta,Avaliacao) :-
    confirmacao(Estafeta,_,_,_,_,Avaliacao,_).

query6_soma(Estafeta,Total) :-
    findall(Avaliacao,query6_avalia(Estafeta,Avaliacao),Lista),
    soma(Lista,Total).

% Fazer a media 
query6_media(Estafeta,Resultado) :-
    query6_soma(Estafeta,Total),
    query6_contador(Estafeta,Contador),
    Resultado is Total/Contador.


% QUERY 7 
% Converte data para dias
convertDatatodays(data(X,Y,Z),P) :-
    P is (Z*12+Y)*30+X.

% Compara duas datas 
comp(data(X,Y,I),data(Z,G,E),data(K,P,F),O) :-
    convertDatatodays(data(X,Y,I),T),
    convertDatatodays(data(K,P,F),Y0),
    convertDatatodays(data(Z,G,E),Y1),
    Y0=<Y1,
    O=data(K,P,F),
    T=<Y0.

% Dado um certo transporte quantas entregas se realizaram num certo periodo de tempo
aux(Meio,Data1,Data2,X) :-
    confirmacao(_,_,Meio,dataehora1(Dia,_),_,_,_),
    comp(Data1,Data2,Dia,X).

query7(Data1,Data2,Veiculo,C) :-
    findall(X,aux(Veiculo,Data1,Data2,X),List),length(List, C).


% QUERY 8
% Verifca se foi entregue num certo intervalo de tempo
query8_aux(Data1,Data2,X) :-
    confirmacao(_,_,_,dataehora1(Dia,_),_,_,_),
    comp(Data1,Data2,Dia,X).
query8(Data1,Data2,C):-
    findall(X,query8_aux(Data1,Data2,X),List),
    length(List, C).


% QUERY 9
% Identifica quais as entregas que foram entregues e não foram num certo intervalo de
% tempo retirando as que foram ás entregas totais.
query9(Data1,Data2,(X,Y)) :- 
    query8(Data1,Data2,X),
    findall(I,caminho(_,_,_,_,_,_,_,I),List),
    length(List, C), 
    Y is C-X.


% QUERY 10 
% Dado um estafeta e um certo dia identifica o peso total por ele transportado
query10_aux(Estafeta,Dia,Peso) :-
    confirmacao(Estafeta,Cliente,_,dataehora1(Dia,_),_,_,Ns),
    caminho(Estafeta,Cliente,_,_,encomenda(_,Peso,_),_,_,Ns).
query10(Estafeta,Dia,PesoTotal) :-
    findall(Peso,query10_aux(Estafeta,Dia,Peso),Lista),
    soma(Lista,PesoTotal).


% QUERY 11(EXTRA)
% Determinar quantas entregas ocorreram numa dada hora
query11(Hora,X) :- 
    findall(Hora,confirmacao(_,_,_,dataehora1(_,Hora),_,_,_),Lista),
    length(Lista,X).


% QUERY 12(EXTRA)
% Entregas feitas atempadamente 
converteTempoHoras(tempo(M,D,H),X) :-
    X is H+(D*24)+(M*30*24).

comparaTempos(tempo(M1,D1,H1),tempo(M2,D2,H2)) :-
    converteTempoHoras(tempo(M1,D1,H1),X),
    converteTempoHoras(tempo(M2,D2,H2),Y),
    X=<Y.

query12_aux(Serie) :-
    confirmacao(Estafeta,Cliente,Veiculo,_,Tempo,_,Serie),
    caminho(Estafeta,Cliente,Veiculo,_,_,_,TempoS,Serie),
    comparaTempos(Tempo,TempoS).

query12(Lista) :-
    findall(Serie,query12_aux(Serie),Lista).


% QUERY 13(EXTRA)
% Invariante 
:- op(900,xfy,'::' ).

%verifica inserção --> não aceita se já existir numero de série
+caminho(Estafeta, Cliente, Veiculo, DataHora,Encomenda,Preco,Tempo, NS) ::
 (findall((NS), caminho(_,_,_,_,_,_,_,NS),S), length(S, N) , N == 1).

% QUERY 14 (EXTRA)
soma([],0).
soma([H|T],S) :-
    soma(T,G),S is H+G.

% Calcula a ecologia de um estafeta 
ecologicoq1(Estafeta,Ecologia) :-
    confirmacao(Estafeta,_,Veiculo,_,_,_,_),
    veiculo(Veiculo,Ecologia).


% Identifica a ecologia de um determinado estafeta somando a ecologia de todos os transportes que utilizou
ecologia(Estafeta,Numb) :-
     findall(Ecologia,ecologicoq1(Estafeta,Ecologia),Lista),
     soma(Lista,Numb).

% Predicado que verifica se se trata de uma lista com o estafeta e a ecologia total de cada um 
ecologiaf(Lista) :-
    findall(
        (Estafeta,Numb),
        (confirmacao(Estafeta,_,_,_,_,_,_), ecologia(Estafeta,Numb)),
        Lista).

% Organiza a lista de forma crescente
query14_aux(List) :-
    ecologiaf(Lista),
    predsort(compare_by_second2,Lista,List).

% Identifica o estafeta mais ecologico, o que esta na cabeca da lista ( se forem todos ecologicos devolve apenas o priemiro da lista)
query14(X) :-
    query14_aux([(X,_)|_]).





% dado um certo destino verifica  quais são os outros lugares que pode ir 
caminho(Dest,List):-rua(Dest,P),findall(A,rua(A,P),List).




%Gerar os circuitos de entrega, caso existam, que cubram um determinado território
% %não informada --> n sabe o q vem a seguir

adjacente(X,Y,E) :- edge(X,Y,E).
adjacente(X,Y,E) :- edge(Y,X,E).

caminho(G,A,B,P) :- caminho1(G,A,[B],P).
caminho1(_,A,[A|P1],[A|P1]).
caminho1(G,A,[Y|P1],P) :-
    adjacente(X,Y,_,G), nao(membro(X,[Y|P1])), caminho1(G,A,[X,Y|P1],P).



ciclo(G,A,[A|P]) :- 
    adjacente(A,B,_,G),
    caminho(G,B,A,P).



% %depth first search --> profcura em profundidade 
% dfs(Orig,Dest,Cam):- dfs2(Orig,Dest,[Orig],Cam).
% dfs2(Dest,Dest,LA,Cam):- reverse(LA,Cam).
% dfs2(Act,Dest,LA,Cam):- connect(Act,X), %testar ligacao entre ponto actual e um qualquer X
%                         \+ member(X,LA), %testar nao circularidade p/evitar nós ja visitados
% dfs2(X,Dest,[X|LA],Cam). %chamada recursiva

%Identificar quais os circuitos com maior número de entregas (por volume e peso);