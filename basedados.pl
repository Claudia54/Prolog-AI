%identificar quais as zonas com maior volume de entregas por parte da green distribution
%rua-freguesia 
rua(vasco_da_Gama, bagunte).
rua(da_Torre, bagunte).
rua(castelo_do_Norte, esposende).%-
rua(afonso_de_Jeronimo, prado).
rua(familia_Real, esposende).
rua(torta, esposende).
rua(nova_america, esposende).
rua(moure,bagunte).%-


%clientes -nome , rua 
clienteerua(ogando,rua(vasco_da_Gama, bagunte)).
clienteerua(paulo,rua(da_Torre,bagunte)).
%clienteerua(marlene,rua(castelo_do_Norte,nogueiro)).
clienteerua(carla,rua(castelo_do_Norte, esposende)).
clienteerua(pedro,(rua(moure,bagunte))).
clienteerua(susana,rua(afonso_de_Jeronimo,prado)).
clienteerua(jessica,rua(familia_Real, esposende)).
clienteerua(marlene,rua(nova_america, esposende)).
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
    encomenda(computador,1,75),8,tempo(0,10,0),2008). %8

caminho(carlos,marlene,bicicleta,
    dataehora(hora(19,00),data(4,10,2020)),
    encomenda(roupa,2,15),2,tempo(1,0,0),2010).

caminho(carlos,marlene,bicicleta,
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


pontorecolha(gualtar).



%1 caminho

edge(gualtar,familia_Real,10).
%edge(familia_real,gualtar,10).
edge(gualtar,nova_america,20).
%edge(nova_america,gualtar,20).
edge(gualtar,torta,5).
%edge(torta,gualtar,5).
edge(familia_Real,torta,1).
%edge(torta,familia_Real,1).
edge(familia_Real,nova_america,3).
%edge(nova_america,familia_real,3).
edge(nova_america,torta,2).

edge(nova_america,castelo_do_Norte,2).
edge(castelo_do_Norte,familia_Real,3).
edge(torta,castelo_do_Norte,4).
     
%2 caminho (local de saida , local de chegada , distancia em km)
edge(gualtar,vasco_da_Gama,25).
%edge(vasco_da_Gama,gualtar,25).
edge(gualtar,da_Torre,30).
%edge(da_Torre,gualtar,30).
edge(vasco_da_Gama,da_Torre,4).
%edge(da_Torre,vasco_da_Gama,4).
edge(vasco_da_Gama,moure,3).%
edge(da_Torre,moure,4).%


%3 caminho
edge(gualtar,afonso_de_Jeronimo,15).
%edge(afonso_de_Jeronimo,gualtar,15).

%custo para pesquisa informada
nodo(gualtar,0).
nodo(familia_Real,10).
nodo(torta,5).
nodo(castelo_do_Norte,25).
nodo(nova_america,20).


nodo(vasco_da_Gama,25).
nodo(da_Torre,30).
nodo(moure,3).

nodo(afonso_de_Jeronimo,15).

caminhoV(sandro,
    encomenda(roupa,5,20),1,200).

caminhoV(paulo,
    encomenda(bicicleta,12,2800),40,2001).

caminhoV(paulo,
    encomenda(livros,1,5),10,2004).

caminhoV(susana,
    encomenda(livros,1,5),300,2005).

caminhoV(ogando,
    encomenda(livros,3,15),48,2006).

caminhoV(jessica,
    encomenda(livros,1,5),60,2007).

caminhoV(marlene,
    encomenda(computador,1,75),72,2008). 

caminhoV(paulo,
    encomenda(livros,18,100),8,2012).

caminhoV(carla,
    encomenda(roupa,2,15),10,20033).

caminhoV(pedro,
    encomenda(computador,1,75),4,11111).
