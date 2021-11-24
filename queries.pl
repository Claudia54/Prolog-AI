%identificar quais as zonas com maior volume de entregas por parte da green distribution 
% rua(Vasco_da_Gama, Gualtar, Braga).
% rua(Da_Torre, Bagunte, Porto).
% rua(Castelo_do_Norte, Nogueiro, Braga).
% rua(Afonso_de_Jeronimo, Prado, Braga).
% rua(Familia_Real, Greenville, Algarve).
%rua(Torta, Esposende, Alentejo).

% cliente(Ogando, Vasco_da_Gama).
% cliente(Paulo, Afonso_de_Jeronimo).
% cliente(Marlene, Torta).
% cliente(Susana, Familia_Real).
% cliente(Jessica, Da_Torre).
% cliente(Sandro, Castelo_do_Norte).

% estafeta(Roger).
% estafeta(Sheila).
% estafeta(Ilidio).
% estafeta(Carlos).
% estafeta(Catia).
% estafeta(Filipe).

% veiculo(Bicicleta).
% veiculo(Mota).
% veiculo(Carro).
% (estafeta, cliente, transporte,peso, data, ranking,o q leva)
caminho(roger, sandro, bicicleta,2,15,5,computador).
caminho(ilidio, paulo, carro,8,15,5,roupa).
caminho(sheila, sandro, mota,5,15,5,roupa).
caminho(filipe, jessica, carro,55,15,5,roupa).
caminho(carlos, paulo, mota,10,15,5,roupa).
caminho(carlos, busana, bicicleta,2,15,5,roupa).
caminho(ilidio, ogando, bicicleta,2,15,5,roupa).
caminho(catia, jessica, mota,17,15,5,roupa).
caminho(sheila, marlene, mota,10,15,5,roupa).
caminho(carlos, marlene, bicicleta,2,15,5,ananas).
caminho(carlos, marle, bicicleta,2,15,5,roupa).
caminho(catia,paulo,bicicleta,4,15,5,roupa).

estafeta(catia).
estafeta(carlos).
estafeta(sheila).
estafeta(ilidio).

veiculo(carro,2).
veiculo(bicicleta,0).
veiculo(mota,1).


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
% ecologicoEstafeta(Estafeta,Ecologia) :- caminho(Estafeta,_,Veiculo,_),
%                                         veiculo(Veiculo,Ecologia).

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
ecologicoEstafeta(Estafeta,Ecologia) :- caminho(Estafeta,_,Veiculo,_),
                                        veiculo(Veiculo,Ecologia).


    %findall (Estafeta,min(ecologicoEstafeta(Estafeta,X),Bag).


ecologico_aux([],[]).
ecologico_aux([Estafeta|Estafetas],[(Estafeta,X)|T]):-ecologicoEstafeta(Estafeta,X),ecologico_aux(Estafetas,T).


%list_min([(L,T)|Ls],(U,Min)) :- foldl(num_num_min, Ls, (L,T), (U,Min)).
%num_num_min((X,U),(H,Y),(N,Min)) :-(U>Y -> N is H,Min is Y; N is X, Min is U).
%myrec([],(_,_)).
%myrec ([(X,U)],(Estafeta,Min)):- Estafeta is X, Min is U.
%myrec([(X,U),(H,Y)|Ls],(Estafeta,Min)):-(U>Y -> myrec([(H,Y)|Ls],(H,Y)); myrec([(X,U)|Ls],(X,U))).


query1([],(_,_)).
query1([Estafeta1],(X,Y)):-ecologico_aux([Estafeta1],[(W,K)|I]),list_min([(W,K)|I],(X,Y)).


%Query 2
query2_aux(Cliente,Encomenda,Estafeta):-caminho(Estafeta,Cliente,_,_,_,_,Encomenda),estafeta(Estafeta).
query2(Cliente,Encomenda,Lista):-findall(X,query2_aux(Cliente,Encomenda,X),Lista).

%Query 3 
query3_aux(Estafeta,Cliente):-caminho(Estafeta,Cliente,_,_,_,_,_),estafeta(Estafeta).
query3(Estafeta,Lista):- findall(X,query3_aux(Estafeta,X),Lista).

%Query 5
%ou ([Caminho],[(Rua,Qt)])

%Query 10
soma([],0).
soma([H|T],S):-soma(T,G),S is H+G.

entrega(joao,paulo,5,20,15,5,pao).
entrega(andre,marco,5,40,15,5,milho).
entrega(joao,marco,5,30,15,5,milho).
entrega(joao,marco,5,40,20,5,milho).


query10_aux(Estafeta,Dia,Peso):- caminho(Estafeta,_,_,Peso,Dia,_,_).

query10(Estafeta,Dia,PesoTotal):-findall(Peso,query10_aux(Estafeta,Dia,Peso),Lista),soma(Lista,PesoTotal).

                    
%query10(Estafeta,Dia,Total):- query10_aux(Estafeta,Dia,W),soma(W,Total).









