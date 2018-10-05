function [MSE] = teste(Theta1, Theta2, X, D_teste)

[H, Y] = feedforward(Theta1, Theta2, X);

MSE = mean((Y - D_teste).^2);
%RMSE = sqrt(MSE)

end

