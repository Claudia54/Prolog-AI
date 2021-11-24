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
% (estafeta, cliente, transporte,peso, data, ranking )
caminho(roger, sandro, bicicleta, 2).
caminho(ilidio, paulo, carro, 85).
caminho(sheila, sandro, mota, 5).
caminho(filipe, jessica, carro, 55).
caminho(carlos, paulo, mota, 10).
caminho(carlos, busana, bicicleta, 2).
caminho(ilidio, ogando, bicicleta, 2).
caminho(catia, jessica, mota, 17).
caminho(sheila, marlene, mota, 10).
caminho(carlos, marlene, bicicleta, 2).
caminho(ilidio, susana, mota, 15).
caminho(catia, paulo, bicicleta, 4).

estafeta(joao).
entrega(joao,paulo,5,20,15,mota,pao).
veiculo(mota,2).

%estafeta_eco([Caminho|Caminhos], Estafeta) :-
%QUERY 1 
estafeta_ecoaux([],_,0,_).
%estafeta_ecoaux([(X,_,_,_)|Cs],Y,U) :- X = Y ,estafeta_eco_aux(Cs,Y,U). 
estafeta_ecoaux([Estafeta|Estafetas],Estafeta1,Y,Veiculo) :-
    caminho(Estafeta,_,Veiculo,_),veiculo(Veiculo), 
    estafeta_ecoaux(Estafetas,Estafeta1,Y1,Veiculo),Y is Y1 +1.


%ecoestafeta(Estafeta,Nivel)

%QUERY 1 
%ecologicoEstafeta(Estafeta,Ecologia) :- entrega(Estafeta,,,,,Veiculo,),
%

%QUERY 2
estafeta_encomenda([],_,_,_).
estafeta_encomenda([(_,Cliente,_,_,_,_,_)|T], Enc, C, Lista) :- Cliente \= C, estafeta_encomenda(T, Enc, C, Lista).
estafeta_encomenda([(Estafeta,Cliente,_,_,_,_,Encomenda)|T], Enc, C, Lista) :-
    not(member(Encomenda, Enc)) ->
        estafeta_encomenda(T, Enc, C, Lista);
        estafeta_encomenda(T, Enc, C, [Estafeta|Lista]).



not(Questao) :-
    Questao, !, fail.
not(Questao).

member(X, [X|_]).
member(X, [_|Xs]):-
    member(X, Xs).
