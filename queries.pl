%identificar quais as zonas com maior volume de entregas por parte da green distribution
%rua-freguesia 
rua(vasco_da_Gama, gualtar).
rua(da_Torre, bagunte).
rua(castelo_do_Norte, nogueiro).
rua(afonso_de_Jeronimo, prado).
rua(familia_Real, greenville).
rua(torta, esposende).

%clientes -nome , rua 
clienteerua(ogando,rua(vasco_da_Gama, gualtar)).
clienteerua(paulo,rua(da_Torre,bagunte)).
clienteerua(marlene,rua(castelo_do_Norte,nogueiro)).
clienteerua(susana,rua(afonso_de_Jeronimo,prado)).
clienteerua(jessica,rua(familia_Real, greenville)).
%clienteerua(sandro,rua(familia_Real, esposende)).
clienteerua(sandro,rua(torta, esposende)).

%encomenda ( o que leva ,peso,volume(cm) )
encomenda(roupa,5,20).
encomenda(computador,1,75).
encomenda(roupa,2,15).
encomenda(livros,1,5).
encomenda(livros,3,15).
encomenda(bicicleta,12,2800).%carro 
encomenda(livros,18,100).%mota

estafeta(catia).
estafeta(carlos).
estafeta(sheila).
estafeta(ilidio).
estafeta(filipe).
estafeta(roger).

veiculo(carro,2).
veiculo(bicicleta,0).
veiculo(mota,1).

hora(18,30).
hora(17,20).
hora(11,15).
hora(19,00).
hora(19,20).

data(5,10,2020).
data(4,10,2020).
data(4,11,2020).
data(24,11,2021).
data(3,12,2021).
data(2,12,2021).

%tempo(mes,dia, hora)
tempo(0,1,0).
tempo(0,10,0).
tempo(1,0,0).
tempo(0,8,0).
tempo(0,0,8).
tempo(0,5,0).
tempo(0,0,1).


%hora e dia da encomenda, hora e dia da entrega da encomenda 
dataehora(hora(18,30),data(4,10,2020)).
dataehora(hora(17,20),data(24,11,2021)).
dataehora(hora(11,15),data(2,12,2021)).
dataehora(hora(11,50),data(4,10,2020)).
dataehora(hora(19,20),data(24,11,2021)).%data de entrega ,data de encomenda
dataehora(hora(11,15),data(2,12,2021)).


dataehora1(data(5,10,2020),hora(17,20)).
dataehora1(data(3,12,2021),hora(19,00)).
dataehora1(data(3,12,2021),hora(19,20)).
dataehora1(data(4,11,2020),hora(19,00)).
dataehora1(data(2,12,2021),hora(18,30)).
dataehora1(data(2,12,2021),hora(19,20)).



% (estafeta, cliente,veiculo, data,o q leva,preço, tempo que se quer q demore, numero encomenda )
caminho(roger,sandro,bicicleta,
    dataehora(hora(18,30),data(4,10,2020)),
    encomenda(roupa,5,20),25,tempo(0,1,0),200).

caminho(ilidio,paulo,carro,
    dataehora(hora(18,30),data(4,10,2020)),
    encomenda(bicicleta,12,2800),45,tempo(0,1,0),2001).

caminho(sheila,sandro,mota,
    dataehora(hora(17,20),data(24,11,2021)),
    encomenda(roupa,5,20),3,tempo(0,1,0),2002).

caminho(filipe,jessica,carro,
    dataehora(hora(11,15),data(2,12,2021)),
    encomenda(computador,1,75),30,tempo(0,1,0),2003).

caminho(carlos,paulo,mota,
    dataehora(hora(11,50),data(4,10,2020)),
    encomenda(livros,1,5),2,tempo(1,0,0),2004).

caminho(carlos,susana,bicicleta,
    dataehora(hora(19,20),data(24,11,2021)),
    encomenda(livros,1,5),3,tempo(0,5,0),2005).

caminho(ilidio,ogando,bicicleta,
    dataehora(hora(19,00),data(4,10,2020)),
    encomenda(livros,3,15),2,tempo(1,0,0),2006).

caminho(catia,jessica,mota,
    dataehora(hora(11,15),data(2,12,2021)),
    encomenda(livros,1,5),6,tempo(0,1,0),2007).

caminho(sheila,marlene,mota,
    dataehora(hora(17,20),data(24,11,2021)),
    encomenda(computador,1,75),8,tempo(0,10,0),2008).

caminho(carlos,marlene,bicicleta,
    dataehora(hora(19,00),data(4,10,2020)),
    encomenda(roupa,2,15),2,tempo(1,0,0),2010).

caminho(carlos,marle,bicicleta,
    dataehora(hora(11,15),data(2,12,2021)),
    encomenda(livros,1,5),20,tempo(0,1,0),2011).

caminho(catia,paulo,mota,
    dataehora(hora(11,15),data(2,12,2021)),
    encomenda(livros,18,100),40,tempo(0,0,8),2012).

%verificar se sao clientes ou estafetas


 % confirmaçao -- estafeta,cliente,veiculo, data de entrega,tempo demorado ,ranking 
confirmacao(roger,sandro,mota,
    dataehora1(data(5,10,2020),hora(17,20)),
    tempo(0,1,0),5,200).

confirmacao(ilidio,paulo,carro,
    dataehora1(data(5,10,2020),hora(17,20)),
    tempo(0,1,0),4,2001).

confirmacao(sheila,sandro,mota,
    dataehora1(data(3,12,2021),hora(19,00)),
    tempo(0,10,0),2,2002).

confirmacao(filipe,jessica,carro,
    dataehora1(data(3,12,2021),hora(19,20)),
    tempo(0,1,0),5,2003).

%carlossemconf
confirmacao(carlos,susana,bicicleta,
    dataehora1(data(2,12,2021),hora(18,30)),
    tempo(0,8,0),3,2005).

confirmacao(ilidio,ogando,bicicleta,
    dataehora1(data(4,11,2020),hora(11,50)),
    tempo(1,0,0),5,2006).

confirmacao(catia,jessica,mota,
    dataehora1(data(3,12,2021),hora(19,20)),
    tempo(0,1,0),2,2007).

confirmacao(sheila,marlene,mota,
    dataehora1(data(3,12,2021),hora(19,00)),
    tempo(0,10,0),2,2008).

confirmacao(carlos,marlene,bicicleta,
    dataehora1(data(4,11,2020),hora(11,50)),
    tempo(1,0,0),3,2010).

confirmacao(carlos,marle,bicicleta,
    dataehora1(data(3,12,2021),hora(19,20)),
    tempo(0,1,0),5,2011).

confirmacao(catia,paulo,mota,
    dataehora1(data(2,12,2021),hora(19,20)),
    tempo(0,0,8),5,2012).


% 1- ver se tds os caminhos tem confirmacao 
% 2- qts entregas fez Um estafeta numa hora



%Query text 
queryteste(X):- findall(Y,(caminho(_,_,_,_,_,_,_,Y),confirmacao(_,_,_,_,_,_,Y)),List),length(List,X).


%QUERY 1 

soma([],0).
soma([H|T],S):-soma(T,G),S is H+G.


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


% calcular a ecologia de um estafeta 
ecologicoEstafeta(Estafeta,Ecologia) :- confirmacao(Estafeta,_,Veiculo,_,_,_,_),
                                        veiculo(Veiculo,Ecologia).




ecologia(Estafeta,Numb):- findall(Ecologia,ecologicoEstafeta(Estafeta,Ecologia),Lista),soma(Lista,Numb).

concatena([],[],[]).
concatena([],[X],[X]).
concatena([X|T],[Y|O],[X|U]):- concatena(T,[Y|O],U).

ecologiaf(Lista):-findall((Estafeta,Numb),(confirmacao(Estafeta,_,_,_,_,_,_),ecologia(Estafeta,Numb)),Lista).

query1_aux(List):-ecologiaf(Lista),predsort(compare_by_second,Lista,List).

query1(X):-query1_aux([(X,_)|_]).



%Query 2
%(estafeta, cliente, transporte,data,ranking,o q leva,preço )
query2_aux(Cliente,Encomenda,Estafeta):-caminho(Estafeta,Cliente,_,_,Encomenda,_,_,Y),confirmacao(_,_,_,_,_,_,Y),estafeta(Estafeta).
query2(Cliente,Encomenda,Lista):-findall(X,query2_aux(Cliente,Encomenda,X),Lista).


%Query 3 
%confirmacao(estafeta,cliente,veiculo, data de entrega,tempo demorado ,ranking, n serie)
query3_aux(Estafeta,Cliente):-confirmacao(Estafeta,Cliente,_,_,_,_,_),estafeta(Estafeta).
query3(Estafeta,Lista):- findall(X,query3_aux(Estafeta,X),Lista).


%Query 4 
% caminho(estafeta, cliente, veiculo,data,o q leva,preço, tempo que se quer q demore, n serie)
% confirmacao(estafeta,cliente,veiculo, data de entrega,tempo demorado ,ranking, n serie)


query4_aux(Dia,Preco):- caminho(_,_,_,dataehora(_,Dia),_,Preco,_,_). %assumimos que paga qd faz a encomenda
query4(Data,Valor):- findall(Custo,query4_aux(Data,Custo),Lista), soma(Lista,Valor).


%Query 5
%ordem decrescente 
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

%função que devolve tds as ruas existentes  
query5_aux2(List):- findall(Rua,(confirmacao(_,Cliente,_,_,_,_,_),clienteerua(Cliente,rua(Rua,_))),List).



%funções que comparam as ruas e as organizam as tuplos 
procura(Rua1,[],(Rua1,0)).
procura(Rua1 ,[Rua1|Ruas],(Rua1,X)) :- procura(Rua1,Ruas,(Rua1,X0)), X is X0+1.
procura(Rua1 ,[Rua3|Ruas],(Rua1,X)) :- Rua1\=Rua3,procura(Rua1,Ruas,(Rua1,X)).

query_comp([],[]).
query_comp([Rua|Ruas],[(X,Y)|T]):-procura(Rua,Ruas,P),P=(X,Y), query_comp(Ruas,T).


%dada uma lista de ruas organiza
query5_aux1(Ruas,A) :- query_comp(Ruas,P),predsort(compare_by_second2,P,A),write(A).

query5(Rua):-query5_aux2(List),query5_aux1(List,[(X,_)|_]),Rua =X. 



%Query 6

query6_contador(Estafeta,Contador) :-findall((Estafeta),confirmacao(Estafeta,_,_,_,_,_,_),List),length(List,Contador).

%somar as avaliaçoes dadas ao estafeta
query6_avalia(Estafeta,Avaliacao) :- confirmacao(Estafeta,_,_,_,_,Avaliacao,_).

query6_soma(Estafeta,Total) :- findall(Avaliacao,query6_avalia(Estafeta,Avaliacao), Lista), soma(Lista,Total).

%fazer a media 
query6_media(Estafeta, Resultado) :- query6_soma(Estafeta,Total),query6_contador(Estafeta,Contador), Resultado is Total/Contador.

%query 7 
% encomenda (estafeta, cliente, veiculo,data,o q leva,preço, tempo que se quer q demore, n serie)
% confirmacao(estafeta,cliente,veiculo, data de entrega,tempo demorado ,ranking, n serie)

%comp esta a dar mal -> mas basicamente quero comparar duas datas ( a primeira de um dia antes da seg e se estiver entre as datas O= a essa data)
% comp(data(K,Y,Z),data(_,_,_),data(K,Y,Z),O):-O= data(K,Y,Z).
% comp(data(_,_,_),data(U,Y,Z),data(U,Y,Z),O):-O=data(U,Y,Z).
% comp(data(U,Y,Z),data(K,Y,Z),data(X,Y,Z),O):-(X<K),X>U,O= data(X,Y,Z). % mesmo ano e mes mas dias dif 
% comp(data(_,V,Z),data(_,L,Z),data(X,I,Z),O) :-(I<L),I>V, O=data(X,I,Z). % mesmo ano meses dif 
% comp(data(_,V,P),data(_,_,Z),data(X,I,P),O) :-Z\=P ,I>V ,O=data(X,I,P).% mesmo ano que o minimo
% comp(data(_,_,P),data(_,J,Z),data(X,I,Z),O) :-Z\=P,J>I ->O=data(X,I,Z).% mesmo ano q o max
% comp(data(_,_,I),data(_,_,E),data(R,Y,Z),O) :- Z>I ,Z<E, O=data(R,Y,Z). %anos dif 


convertDatatodays(data(X,Y,Z),P):- P is (Z*12+Y)*30+X.

comp(data(X,Y,I),data(Z,G,E),data(K,P,F),O):- convertDatatodays(data(X,Y,I),T),convertDatatodays(data(K,P,F),Y0), T=<Y0,
                                              convertDatatodays(data(Z,G,E),Y1), Y0=<Y1, O=data(K,P,F). 

aux(Meio,Data1,Data2,X):-confirmacao(_,_,Meio,dataehora1(Dia,_),_,_,_),comp(Data1,Data2,Dia,X).

query7(Data1,Data2,Veiculo,C):-findall(X,aux(Veiculo,Data1,Data2,X),List),length(List, C).

                                           

%query 8 

query8_aux(Data1,Data2,X):-confirmacao(_,_,_,dataehora1(Dia,_),_,_,_),comp(Data1,Data2,Dia,X).
query8(Data1,Data2,C):-findall(X,query8_aux(Data1,Data2,X),List),length(List, C).

%Query 9

query9(Data1,Data2,(X,Y)):- query8(Data1,Data2,X),findall(I,caminho(_,_,_,_,_,_,_,I),List),length(List, C), Y is C-X.


%Query 10 

% encomenda (estafeta, cliente, veiculo,data,o q leva,preço, tempo que se quer q demore, n serie)
% confirmacao(estafeta,cliente,veiculo, data de entrega,tempo demorado ,ranking, n serie)

query10_aux(Estafeta,Dia,Peso):- confirmacao(Estafeta,Cliente,_,dataehora1(Dia,_),_,_,Ns),caminho(Estafeta,Cliente,_,_,encomenda(_,Peso,_),_,_,Ns).
query10(Estafeta,Dia,PesoTotal):-findall(Peso,query10_aux(Estafeta,Dia,Peso),Lista),soma(Lista,PesoTotal).

        


% determinar quantas entregas ocorreram numa dada hora

query12(Hora,X):- findall(Hora,confirmacao(_,_,_,dataehora1(_,Hora),_,_,_),Lista),length(Lista,X).

%Invariante estrutural
:- op( 900,xfy,'::' ).
/*caminho(catia,paulo,mota,
    dataehora(hora(11,15),data(2,12,2021)),
    encomenda(livros,18,100),40,tempo(0,0,8),2012).
*/

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



% Entregas feitas a tempo 

converteTempoHoras(tempo(M,D,H),X):-
    X is H+(D*24)+(M*30*24).

compTempos(tempo(M1,D1,H1),tempo(M2,D2,H2)):-
    converteTempoHoras(tempo(M1,D1,H1),X),
    converteTempoHoras(tempo(M2,D2,H2),Y),
    X=<Y.

query13_aux(Serie):-
    confirmacao(Estafeta,Cliente,Veiculo,_,Tempo,_,Serie),
    caminho(Estafeta,Cliente,Veiculo,_,_,_,TempoS,Serie),
    compTempos(Tempo,TempoS).

query13(Lista):-findall(Serie,query13_aux(Serie),Lista).








