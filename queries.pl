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
    encomenda(roupa,2,15),2,tempo(1,0,0),2009).

caminho(carlos,marle,bicicleta,
    dataehora(hora(11,15),data(2,12,2021)),
    encomenda(livros,1,5),20,tempo(0,1,0),2010).

caminho(catia,paulo,mota,
    dataehora(hora(11,15),data(2,12,2021)),
    encomenda(livros,18,100),40,tempo(0,0,8),2011).

%verificar se sao clientes ou estafetas


 % confirmaçao -- estafeta,cliente,veiculo, data de entrega,tempo demorado ,ranking 
confirmacao(roger,sandro,bicicleta,
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
% querytesteaux (Y,X):- caminho(_,_,_,_,_,_,_,Y), confirmacao(_,_,_,_,_,_,Y).
% queryteste(Y,X):- findall(Y,querytesteaux(_,Y),List),length(List,X).


%QUERY 1 
%estafeta_eco_aux([(X,_,_,_)|Cs],Y,U) :- X \= Y ,estafeta_eco_aux(Cs,Y,U).
%stafeta_eco_aux(_,0,_).
% estafeta_eco_aux([],_,_,0).
% estafeta_eco_aux([(X,_,_,_)|Cs],Y,U) :- X \= Y ,estafeta_eco_aux(Cs,Y,U).
% estafeta_eco_aux([(A,_,C,_)|Caminhos],Veiculo,Estafeta1,Y) :-
%          (estafeta(A)) is Estafeta1,C is Veiculo,Y is Y1+1.
        %(caminho(Estafeta1,_,Veiculo,_) -> Y is Y1+1 ; Y ).
%estafeta_eco_aux(Estafeta1,Y1,Veiculo),Y is Y1+1.

%ecoestafeta(Estafeta,Nivel)                                                
%QUERY 1 
% calcular a ecologia de um estafeta 
ecologicoEstafeta(Estafeta,Ecologia) :- caminho(Estafeta,_,Veiculo,_),
                                        veiculo(Veiculo,Ecologia).

%%findall (Estafeta,min(ecologicoEstafeta(Estafeta,X),Bag).

% ecologico_aux([],[]).
% ecologico_aux([Estafeta|Estafetas],[(Estafeta,X)|T]):-ecologicoEstafeta(Estafeta,X),ecologico_aux(Estafetas,T).

%ecologico_aux([],[]).
%ecologico_aux([Estafeta|Estafetas],[(Estaf,X)|T]):-ecologicoEstafeta(Estafeta,X),ecologico_aux(Estafetas,T).

% list_min([L|Ls], Min) :- foldl(num_num_min, Ls, L, Min).
% num_num_min(X, Y, Min) :- Min #= min(X, Y).

% %ecologico()
% %maispeq([],_).
%maispeq([X],Index):-nth0(Index,[X|T],list_min([X|T],U)).

 % se y for mais pequeno q w entao w
% maispeq([],(_,_)).
% maispeq([(X,Y)|T],(J,N)):-N is min(Y,N),maispeq(T,(X,Y)); maispeq(T,(J,N)).

% list_min([(T,L)|Ls], (R,Min)) :- foldl(num_num_min, Ls, L, Min).
% num_num_min(X, Y, Min) :- Min is min(X, Y).

% ecologico([Estafeta1],(X,N)):-ecologico_aux(Estafeta1,[W|T]),maispeq([W|T],(X,N))

% n mais pequeno
% list_min([L|Ls], Min) :- foldl(num_num_min, Ls, L, Min).
% num_num_min(X, Y, Min) :- Min is min(X, Y).

% minimoindice([],_).
% minimoindice([X|T],Index):-list_min([X|T],U),nth0(Index,[X|T],U).

% pode dar erro pode ter varias vees o msm estafeta
%ecologicoEstafeta(Estafeta,Ecologia) :- caminho(Estafeta,_,Veiculo,_,_,_,_),
                                    %    veiculo(Veiculo,Ecologia).

%query1_aux(Estafeta,Lista):-findall((Estafeta,Ecologia),ecologicoEstafeta(Estafeta,Ecologia),Lista).


%query1_aux2([],_).
%query1_aux2([Estafeta1|Estafetas],Lista):-query1_aux(Estafeta1,Y0),query1_aux2(Estafetas,Lista).

    %findall (Estafeta,min(ecologicoEstafeta(Estafeta,X),Bag).


%ecologico_aux([],[]).
%ecologico_aux([Estafeta|Estafetas],[(Estafeta,X)|T]):-ecologicoEstafeta(Estafeta,X),ecologico_aux(Estafetas,T).


%list_min([(L,T)|Ls],(U,Min)) :- foldl(num_num_min, Ls, (L,T), (U,Min)).
%num_num_min((X,U),(H,Y),(N,Min)) :-(U>Y -> N is H,Min is Y; N is X, Min is U).
%myrec([],(_,_)).
%myrec ([(X,U)],(Estafeta,Min)):- Estafeta is X, Min is U.
%myrec([(X,U),(H,Y)|Ls],(Estafeta,Min)):-(U>Y -> myrec([(H,Y)|Ls],(H,Y)); myrec([(X,U)|Ls],(X,U))).


%query1([],(_,_)).
%query1([Estafeta1],(X,Y)):-ecologico_aux([Estafeta1],[(W,K)|I]),list_min([(W,K)|I],(X,Y)).


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

soma([],0).
soma([H|T],S):-soma(T,G),S is H+G.

query4_aux(Dia,Preco):- caminho(_,_,_,dataehora(_,Dia),_,Preco,_,_). %assumimos que paga qd faz a encomenda
query4(Data,Valor):- findall(Custo,query4_aux(Data,Custo),Lista), soma(Lista,Valor).


%Query 5

query5_aux1(Cliente,Rua) :- confirmacao(Cliente,_,_,_,_,_,_),clienteerua(Cliente,rua(Rua,_)).


%query5_aux2(Rua,List)
query5_aux2(Rua,List) :- findall(Rua ,query5_aux1(_,Rua),List).

procura(Rua1,[],(Rua1,0)).
procura(Rua1 ,[Rua1|Ruas],(Rua1,X)) :- procura(Rua1,Ruas,(Rua1,X0)), X is X0+1.
procura(Rua1 ,[Rua3|Ruas],(Rua1,X)) :- Rua1\=Rua3,procura(Rua1,Ruas,(Rua1,X)).

query_comp (_ ,[]).
query_comp([Rua|Ruas],[(_,Y)|T]):-procura(Rua,Ruas,(Rua,Y)),query_comp(Ruas,T).


%query5(Rua,X):- aggregate(query5_aux2(_,Rua),Rua, max).


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

query9(Data1,Data2,(X,Y)):- query8(Data1,Data2,X),findall(I, caminho(_,_,_,_,_,_,_,I),List),length(List, C), Y is C-X.


%Query 10 

% encomenda (estafeta, cliente, veiculo,data,o q leva,preço, tempo que se quer q demore, n serie)
% confirmacao(estafeta,cliente,veiculo, data de entrega,tempo demorado ,ranking, n serie)

query10_aux(Estafeta,Dia,Peso):- confirmacao(Estafeta,Cliente,_,dataehora1(Dia,_),_,_,Ns),caminho(Estafeta,Cliente,_,_,encomenda(_,Peso,_),_,_,Ns).
query10(Estafeta,Dia,PesoTotal):-findall(Peso,query10_aux(Estafeta,Dia,Peso),Lista),soma(Lista,PesoTotal).

        


% determinar quantas entregas ocorreram numa dada hora

query12(Hora,X):- findall(Hora,confirmacao(_,_,_,dataehora1(_,Hora),_,_,_),Lista),length(Lista,X).






