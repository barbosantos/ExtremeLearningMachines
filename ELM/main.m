n = 20;

cont = 0;
%base = 'column_3C.dat';
%atributos = 6;

% base = 'iris.dat';
% atributos = 4;

base = 'dermatology.dat';
atributos = 34;

for i = 1:n
    acc(i) =  ELM(base, atributos);
end

media_acc = mean(acc)
desvio_padrao = std(acc);
variancia = var(acc);