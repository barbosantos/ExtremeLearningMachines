n = 20;

cont = 0;
%base = 'column_3C.dat';
%atributos = 6;

base = 'iris.dat';
atributos = 4;

for i = 1:n
    MSE(i) =  ELMregressao();
end

media_MSE = mean(MSE)
media_RMSE = sqrt(media_MSE)
