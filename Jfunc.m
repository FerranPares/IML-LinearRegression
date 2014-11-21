function [ J, G ] = Jfunc( w, x, y )
    x2 = [ones(length(x),1) x];
    N = length(x);
    J = (transpose(x2*w - y)*(x2*w - y))./(2*N);
    G = (transpose(x2)./N)*(x2*w - y);
end

