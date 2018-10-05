%%%ALuno: Gabriel Santos Barbosa
%%%Professor: Ajalmar
%%%Disciplina: Redes Neurais Artificiais
function [acc] = ELM(base_de_dados, qtd_atributos)

    %qtd_atributos = 4;
    [dados, classe] = readfile(base_de_dados, qtd_atributos);

    %% Parametros
    input_layer_size = qtd_atributos; 
    hidden_layer_size = 25;   
    num_labels = size(unique(classe), 1);     
    %%
    %Renomeia as classes em vetores de 0s e 1s
    dados = label_classes(dados, classe);
    %y = dados(:,(size(X,2)+1):end); %classes 1 e 0s
    %Embaralha os dados
    dados = embaralha(dados);

    %Normaliza os dados
    dados = normalize(dados);

    [X_treino,X_teste,D_treino,D_teste] = divide_dados(dados, qtd_atributos, 80);  
    %%
    %Se os valores dos pesos forem todos iguais, todos os neuronios irao 
    % atualizar com os mesmos valores repetidamente
    %melhor aleatorizar os pesos em um pequeno intervalo

    INIT_EPSILON = 0.3;
    %Thetas sao os pesos
    Theta1 = rand(hidden_layer_size, (input_layer_size + 1)) * (2 * INIT_EPSILON) - INIT_EPSILON;
    Theta2 = rand(num_labels,(hidden_layer_size + 1)) * (2 * INIT_EPSILON) - INIT_EPSILON;

    %% Calculo do custo (Feedforward)

    %retorna saida da camada intermediaria
    [H, Y] = feedforward(Theta1, Theta2, X_treino);

    M = (H\D_treino)'; %OLAM

    acc = teste(Theta1, M, X_teste, D_teste);
    
    end

               
               
               