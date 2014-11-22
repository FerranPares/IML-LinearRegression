%PLOT DATA
%Question 1
load('reg_data_set_1.mat');
figure(1);
scatter(x(1),y(1),5,'blue');
hold on;
for i=1:length(x)
    scatter(x(i),y(i),5,'blue');
end
hold off;

%ANALITICAL
%Question 2
x2 = [ones(length(x),1) x];
wAnalitical = (x2'*x2)\(x2'*y);
%show values analitical
disp(['w0: ',num2str(wAnalitical(1))]);
disp(['w1: ',num2str(wAnalitical(2))]);
%plot analitical
p1 = 0:0.1:1;
p2 = wAnalitical(2)*p1+wAnalitical(1);
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


%ANALITICAL
%Question 5
x4 = [ones(length(x),1) x x.^2 x.^3];
wAnaliticalPoly = (x4'*x4)\(x4'*y);
%show values analitical
disp(['wanalitic0: ',num2str(wAnaliticalPoly(1))]);
disp(['wanalitic1: ',num2str(wAnaliticalPoly(2))]);
disp(['wanalitic2: ',num2str(wAnaliticalPoly(3))]);
disp(['wanalitic3: ',num2str(wAnaliticalPoly(4))]);
%plot analitical
p1 = 0:0.1:1;
p2 = wAnaliticalPoly(4)*p1.^3+wAnaliticalPoly(3)*p1.^2+wAnaliticalPoly(2)*p1+wAnaliticalPoly(1);
figure;
scatter(x(1),y(1),5,'blue');
hold on;
for i=1:length(x)
    scatter(x(i),y(i),5,'blue');
end
plot( p1, p2, 'g' );
hold off;


%Evaluation model
%Question 7 (missing 6)
