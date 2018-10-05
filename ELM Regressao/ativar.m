function [h] = ativar(h)
% 
[x,y] = size(h(1,:));

for i=1:size(h,1)    
    [~,I] = max(h(i,:));
    h(i,:) = zeros(x,y);
    h(i,I) = 1;
end

end

