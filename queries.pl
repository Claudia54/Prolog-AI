
%Includes 
:-include('basedados.pl').

%Query text -> verifica quantos caminhos tem confirmação 
queryteste(X):- findall(Y,(caminho(_,_,_,_,_,_,_,Y),confirmacao(_,_,_,_,_,_,Y)),List),length(List,X).


%QUERY 1 
% soma os elementos de uma lista 
soma([],0).
soma([H|T],S):-soma(T,G),S is H+G.

% compara o segundo elemento dos tuplos -> organiza de forma crescente 
compare_by_second(<, (A, B), (C, D)) :-
    (   B @< D
    ;   B == D,
        A @< C ).
compare_by_second(=, (A, B), (C, D)) :-
    A == C,
    B == D.
compare_by_second(>, (A, B), (C, D)) :-
    (   B @> D
    ;   B == D,
        A @> C ).

%calcula a ecologia de um estafeta 
ecologicoq1(Estafeta,Ecologia) :- confirmacao(Estafeta,_,Veiculo,_,_,_,_),
                                        veiculo(Veiculo,Ecologia).


% identifica a ecologia de um determinado estafeta somando a ecologia de todos os transportes que utilizou
ecologia(Estafeta,Numb):- findall(Ecologia,ecologicoq1(Estafeta,Ecologia),Lista),soma(Lista,Numb).

%Predicado que verifica se se trata de uma lista com o estafeta e a ecologia total de cada um 
ecologiaf(Lista):-findall((Estafeta,Numb),(confirmacao(Estafeta,_,_,_,_,_,_),ecologia(Estafeta,Numb)),Lista).

%organiza a lista de forma crescente
query1_aux(List):-ecologiaf(Lista),predsort(compare_by_second,Lista,List).

% Identifica o estafeta mais ecologico, o que esta na cabeca da lista ( se forem todos ecologicos devolve apenas o priemiro da lista)
query1(X):-query1_aux([(X,_)|_]).



%QUERY 2
% Dado um cliente e uma encomenda identifica o(s) estafeta(s) que realizaram esse percurso 
query2_aux(Cliente,Encomenda,Estafeta):-caminho(Estafeta,Cliente,_,_,Encomenda,_,_,Y),confirmacao(_,_,_,_,_,_,Y),estafeta(Estafeta).
query2(Cliente,Encomenda,Lista):-findall(X,query2_aux(Cliente,Encomenda,X),Lista).


%QUERY 3 
%Dado um estafeta identifica o(s) clientes por ele servidos
query3_aux(Estafeta,Cliente):-confirmacao(Estafeta,Cliente,_,_,_,_,_),estafeta(Estafeta).
query3(Estafeta,Lista):- findall(X,query3_aux(Estafeta,X),Lista).


%Query 4 
%Dado um dia identifica o valor faturado pela empresa Green Distributions
query4_aux(Dia,Preco):- caminho(_,_,_,dataehora(_,Dia),_,Preco,_,_). %assumimos que paga qd faz a encomenda
query4(Data,Valor):- findall(Custo,query4_aux(Data,Custo),Lista), soma(Lista,Valor).


%Query 5
%compara pela ordem decrescente 
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

%Identifica todas as ruas existentes  
query5_aux2(List):- findall(Rua,(confirmacao(_,Cliente,_,_,_,_,_),clienteerua(Cliente,rua(Rua,_))),List).



% procura uma certa rua numa lista de ruas e verfica se se encontra um certo número de vezes 
procura(Rua1,[],(Rua1,0)).
procura(Rua1 ,[Rua1|Ruas],(Rua1,X)) :- procura(Rua1,Ruas,(Rua1,X0)), X is X0+1.
procura(Rua1 ,[Rua3|Ruas],(Rua1,X)) :- Rua1\=Rua3,procura(Rua1,Ruas,(Rua1,X)).

%Organiza as Ruas procurando a cabeça da lista pelo resto da lista e organizando
query_comp([],[]).
query_comp([Rua|Ruas],[(X,Y)|T]):-procura(Rua,Ruas,P),P=(X,Y), query_comp(Ruas,T).


%dada uma lista de ruas organiza por ordem decrescente 
query5_aux1(Ruas,A) :- query_comp(Ruas,P),predsort(compare_by_second2,P,A),write(A).

%Apenas a cabeça da lista é a rua mais frequentada
query5(Rua):-query5_aux2(List),query5_aux1(List,[(X,_)|_]),Rua =X. 



%Query 6
% quantas entregas fez o estafeta
query6_contador(Estafeta,Contador) :-findall((Estafeta),confirmacao(Estafeta,_,_,_,_,_,_),List),length(List,Contador).

%somar as avaliaçoes dadas ao estafeta
query6_avalia(Estafeta,Avaliacao) :- confirmacao(Estafeta,_,_,_,_,Avaliacao,_).

query6_soma(Estafeta,Total) :- findall(Avaliacao,query6_avalia(Estafeta,Avaliacao), Lista), soma(Lista,Total).

%fazer a media 
query6_media(Estafeta, Resultado) :- query6_soma(Estafeta,Total),query6_contador(Estafeta,Contador), Resultado is Total/Contador.

%query 7 

% comp(data(K,Y,Z),data(_,_,_),data(K,Y,Z),O):-O= data(K,Y,Z).
% comp(data(_,_,_),data(U,Y,Z),data(U,Y,Z),O):-O=data(U,Y,Z).
% comp(data(U,Y,Z),data(K,Y,Z),data(X,Y,Z),O):-(X<K),X>U,O= data(X,Y,Z). % mesmo ano e mes mas dias dif 
% comp(data(_,V,Z),data(_,L,Z),data(X,I,Z),O) :-(I<L),I>V, O=data(X,I,Z). % mesmo ano meses dif 
% comp(data(_,V,P),data(_,_,Z),data(X,I,P),O) :-Z\=P ,I>V ,O=data(X,I,P).% mesmo ano que o minimo
% comp(data(_,_,P),data(_,J,Z),data(X,I,Z),O) :-Z\=P,J>I ->O=data(X,I,Z).% mesmo ano q o max
% comp(data(_,_,I),data(_,_,E),data(R,Y,Z),O) :- Z>I ,Z<E, O=data(R,Y,Z). %anos dif 

% converte data para dias
convertDatatodays(data(X,Y,Z),P):- P is (Z*12+Y)*30+X.

%compara duas datas 
comp(data(X,Y,I),data(Z,G,E),data(K,P,F),O):- convertDatatodays(data(X,Y,I),T),convertDatatodays(data(K,P,F),Y0), T=<Y0,
                                              convertDatatodays(data(Z,G,E),Y1), Y0=<Y1, O=data(K,P,F). 

% Ddado um certo transporte quantas entregas se realizaram num certo periodo de tempo
aux(Meio,Data1,Data2,X):-confirmacao(_,_,Meio,dataehora1(Dia,_),_,_,_),comp(Data1,Data2,Dia,X).

query7(Data1,Data2,Veiculo,C):-findall(X,aux(Veiculo,Data1,Data2,X),List),length(List, C).

                                           

%query 8
%verifca se foi entregue num certo intervalo de tempo
query8_aux(Data1,Data2,X):-confirmacao(_,_,_,dataehora1(Dia,_),_,_,_),comp(Data1,Data2,Dia,X).
query8(Data1,Data2,C):-findall(X,query8_aux(Data1,Data2,X),List),length(List, C).


%Query 9
%identifica quais as entregas que foram entregues e não foram num certo intervalo de tempo retirando as que foram ás entregas totais.
query9(Data1,Data2,(X,Y)):- query8(Data1,Data2,X),findall(I,caminho(_,_,_,_,_,_,_,I),List),length(List, C), Y is C-X.


%Query 10 
%Dado um estafeta e um certo dia identifica o peso total por ele transportado
query10_aux(Estafeta,Dia,Peso):- confirmacao(Estafeta,Cliente,_,dataehora1(Dia,_),_,_,Ns),caminho(Estafeta,Cliente,_,_,encomenda(_,Peso,_),_,_,Ns).
query10(Estafeta,Dia,PesoTotal):-findall(Peso,query10_aux(Estafeta,Dia,Peso),Lista),soma(Lista,PesoTotal).

        
%determinar quantas entregas ocorreram numa dada hora
query12(Hora,X):- findall(Hora,confirmacao(_,_,_,dataehora1(_,Hora),_,_,_),Lista),length(Lista,X).

%Invariante estrutural
:- op( 900,xfy,'::' ).

validaVeiculo(Veiculo):-veiculo(Veiculo,_).
validaData(dataehora(hora(U,C),data(X,Y,_))):-X=<31,X>0,Y>0,Y=<12,U=<23,U>=0,C=<59,C>=0.
validaencomenda(encomenda(X,Y,Z)).
validaSerie(NS):-findall(NS,caminho(_,_,_,_,_,_,_,NS),List),length(List,0).
validatempo(tempo(X,Y,Z)).

+caminho(Estafeta,Cliente,Veiculo,DataHora,Encomenda,Preco,Tempo,NS)::(
    atom(Estafeta),
    atom(Cliente),
    validaveiculo(Veiculo),
    validaData(Data,Hora),
    validaencomenda(Encomenda),
    integer(Preco),
    validatempo(Tempo),
    validaSerie(NS)).



%Entregas feitas a tempo 
%converte tempo para horas 
converteTempoHoras(tempo(M,D,H),X):-X is H+(D*24)+(M*30*24).
%compara o tempo
compTempos(tempo(M1,D1,H1),tempo(M2,D2,H2)):-converteTempoHoras(tempo(M1,D1,H1),X),
                                   converteTempoHoras(tempo(M2,D2,H2),Y),X=<Y.


query13_aux(Serie):- confirmacao(Estafeta,Cliente,Veiculo,_,Tempo,_,Serie),
                        caminho(Estafeta,Cliente,Veiculo,_,_,_,TempoS,Serie),compTempos(Tempo,TempoS).


query13(Lista):-findall(Serie,query13_aux(Serie),Lista).








