%PLOT DATA

load('reg_data_set_1.mat');
figure(1);
scatter(x(1),y(1),5,'blue');
hold on;
for i=1:length(x)
    scatter(x(i),y(i),5,'blue');
end
hold off;

%ANALITICAL

x2 = [ones(length(x),1) x];
wanalitical = (x2'*x2)\(x2'*y);
%show values analitical
disp(['w0: ',num2str(wanalitical(1))]);
disp(['w1: ',num2str(wanalitical(2))]);
%plot analitical
p1 = 0:0.1:1;
p2 = wanalitical(2)*p1+wanalitical(1);
figure(2);
scatter(x(1),y(1),5,'blue');
hold on;
for i=1:length(x)
    scatter(x(i),y(i),5,'blue');
end
plot( p1, p2, 'g' );
hold off;



%ITERATING
%Question 3
t = 0.8; num_iter = 500;
descentMethod(t, num_iter, x, y, 'usual');

t = 0.1; num_iter = 2000;
descentMethod(t, num_iter, x, y, 'usual');

%Question 4
t = 0.5; num_iter = 500;
descentMethod(t, num_iter, x, y, 'normalized');

