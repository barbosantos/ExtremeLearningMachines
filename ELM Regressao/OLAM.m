
function [ans] = OLAM()

%Entrada: numero de atributos e nome da base de dados devem ser alteradas
clc;
close all;
clearvars;
%format longG;

qtd_atributos = 6;
%[dados, classes] = readfile('iris.dat', qtd_atributos);
[dados, classes] = readfile('column_3C.dat', qtd_atributos);
%rotula os dados
dados = label_classes(dados, classes);
%Embaralha os dados
dados = embaralha(dados);
%Normaliza os dados
dados = normalize(dados);
[X_treino,X_teste,Y_treino,Y_teste] = divide_dados(dados, qtd_atributos, 80);  
X_treino = [-ones(size(X_treino,1),1) X_treino];
X_teste = [-ones(size(X_teste,1),1) X_teste];
% X = dados(:, 1:qtd_atributos); %vetores de entrada
% Y = dados(:, qtd_atributos + 1:end); %desejado
% 
% qtd_linhas_X = size(X,1);
% qtd_dados_treino = floor(0.8*qtd_linhas_X);
% 
% X_treino = X(1:qtd_dados_treino,:);
% Y_treino = Y(1:qtd_dados_treino,:);
% 
% X_teste = X(qtd_dados_treino + 1:qtd_linhas_X,:);
% Y_teste = Y(qtd_dados_treino + 1:qtd_linhas_X,:);

W = X_treino\Y_treino;
%W = (X_treino' * X_treino)\(X_treino' * Y_treino)
%Equivalente
%W = (inv(X_treino'*X_treino)*X_treino')*Y_treino

cont_acerto = 0;
for i=1:size(Y_teste,1)
    
    u = ativacao(X_teste(i,:)*W);
    if isequal(u, Y_teste(i,:))
       cont_acerto = cont_acerto + 1;
    end
    
end

ans = (cont_acerto/size(Y_teste,1))*100;