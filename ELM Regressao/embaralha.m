function [data] = embaralha(data)
%Fun��o que embaralha os dados
    n_patterns = size(data, 1);
    index = randperm(n_patterns);
    data = data(index, :);
end