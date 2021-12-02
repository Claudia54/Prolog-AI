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
