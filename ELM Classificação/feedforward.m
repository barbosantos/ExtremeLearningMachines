function [a2, h] = feedforward(Theta1, Theta2, X)

%calculo feedforward
m = size(X, 1); %qtd linhas dos dados de entrada

a1 = [ones(m, 1) X]; %camada de entrada
z2 = a1*Theta1'; % U da camada de entrada
a2 = [ones(size(z2, 1), 1) sigmoid(z2)]; %entrada da segunda camada
z3 = a2*Theta2'; % U da segunda camada
a3 = sigmoid(z3); 
h = a3;
end

