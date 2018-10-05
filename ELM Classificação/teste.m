function [acc] = teste(Theta1, Theta2, X, D_teste)

[H, Y] = feedforward(Theta1, Theta2, X);


Y = ativar(Y);

cont = 0;
for i=1:size(Y,1)
   if isequal(Y(i,:), D_teste(i,:))
       cont = cont + 1;
   end
end

acc = 100*(cont/size(Y,1));

end

