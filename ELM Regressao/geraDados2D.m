function [data] = geraDados2D()
    
    %Gera e plota os dados bidimensionais

    x = linspace(0,10,200);
    %Criando os pontos o vetor de pontos da função com ruídos adicionados
    y = sin(x) + 5 + (rand(size(x)) - 0.5);
    z = sin(x);
    %Normalizando os dados
    data = normalize([x' y' z']);
    
    figure(1);
    %plotagem
    scatter(data(:,1), data(:,3), '.black');
    hold on;
    
    scatter(data(:,1), data(:,2), '.r');
    hold on;
    
    data = data(:, 1:2);

end

