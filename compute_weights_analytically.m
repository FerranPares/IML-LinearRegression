function [ w0, w1 ] = compute_weights_analytically( x, y )
N = size(x,1);
sumX = sum(x);
sumY = sum(y);
sumXY = sum(x.*y);

sumX2 = sum(x.^2);

w1 = (N*sumXY -sumX*sumY) / (N*(sumX2) - sumX^2);

w0 =(sumY - w1*sumX)/N;

end

