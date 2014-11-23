%Evaluation model
%Question 7 (missing 6)
load('reg_data_set_2.mat');

%Using first half for training and second half for validation
trainx = x(1:(length(x)/2));
trainy = y(1:(length(y)/2));

figure(1);

scatter(trainx(1),trainy(1),5,'blue');
hold on;
for i=2:length(trainx)
    scatter(trainx(i),trainy(i),5,'blue');
end
xlabel('x')
ylabel('y')
hold off;

valx = x((length(x)/2+1):length(x));
valy = y((length(y)/2+1):length(y));

figure(2);
scatter(valx(1),valy(1),5,'blue');
hold on;
for i=2:length(valx)
    scatter(valx(i),valy(i),5,'blue');
end
xlabel('x')
ylabel('y')
hold off;

%Computing analitical model
tx1 = [ones(length(x),1) x ];
tx2 = [ones(length(x),1) x x.^2];
tx3 = [ones(length(x),1) x x.^2 x.^3];
tx4 = [ones(length(x),1) x x.^2 x.^3 x.^4];
tx5 = [ones(length(x),1) x x.^2 x.^3 x.^4 x.^5];
tx6 = [ones(length(x),1) x x.^2 x.^3 x.^4 x.^5 x.^6];

tw1 = (tx1'*tx1)\(tx1'*y);
tw2 = (tx2'*tx2)\(tx2'*y);
tw3 = (tx3'*tx3)\(tx3'*y);
tw4 = (tx4'*tx4)\(tx4'*y);
tw5 = (tx5'*tx5)\(tx5'*y);
tw6 = (tx6'*tx6)\(tx6'*y);

i = 0:0.01:1;
f1 = tw1(1) + tw1(2)*i;
f2 = tw2(1) + tw2(2)*i + tw2(3)*i.^2;
f3 = tw3(1) + tw3(2)*i + tw3(3)*i.^2 + tw3(4)*i.^3;
f4 = tw4(1) + tw4(2)*i + tw4(3)*i.^2 + tw4(4)*i.^3 + tw4(5)*i.^4;
f5 = tw5(1) + tw5(2)*i + tw5(3)*i.^2 + tw5(4)*i.^3 + tw5(5)*i.^4 + tw5(6)*i.^5;
f6 = tw6(1) + tw6(2)*i + tw6(3)*i.^2 + tw6(4)*i.^3 + tw6(5)*i.^4 + tw6(6)*i.^5 + tw6(7)*i.^6;

%plot validation set and the 6 models
figure(3);
scatter(valx(1),valy(1),5,'black');
hold on;
for p=2:length(valx)
    scatter(valx(p),valy(p),5,'blue');
end
hline1 = plot( i, f1, 'y' );
hline2 = plot( i, f2, 'm' );
hline3 = plot( i, f3, 'c' );
hline4 = plot( i, f4, 'r' );
hline5 = plot( i, f5, 'g' );
hline6 = plot( i, f6, 'b' );
legend([hline1,hline2,hline3,hline4,hline5,hline6],'p=1','p=2','p=3','p=4','p=5','p=6','Location','northwest')

hold off;

%plot training set and the 6 models
figure(4);
scatter(trainx(1),trainy(1),5,'black');
hold on;
for p=2:length(trainx)
    scatter(trainx(p),trainy(p),5,'blue');
end
hline1 = plot( i, f1, 'y' );
hline2 = plot( i, f2, 'm' );
hline3 = plot( i, f3, 'c' );
hline4 = plot( i, f4, 'r' );
hline5 = plot( i, f5, 'g' );
hline6 = plot( i, f6, 'b' );
legend([hline1,hline2,hline3,hline4,hline5,hline6],'p=1','p=2','p=3','p=4','p=5','p=6','Location','northwest')
hold off;

%Compute the RMS
i = sort(trainx);
f1 = tw1(1) + tw1(2)*i;
f2 = tw2(1) + tw2(2)*i + tw2(3)*i.^2;
f3 = tw3(1) + tw3(2)*i + tw3(3)*i.^2 + tw3(4)*i.^3;
f4 = tw4(1) + tw4(2)*i + tw4(3)*i.^2 + tw4(4)*i.^3 + tw4(5)*i.^4;
f5 = tw5(1) + tw5(2)*i + tw5(3)*i.^2 + tw5(4)*i.^3 + tw5(5)*i.^4 + tw5(6)*i.^5;
f6 = tw6(1) + tw6(2)*i + tw6(3)*i.^2 + tw6(4)*i.^3 + tw6(5)*i.^4 + tw6(6)*i.^5 + tw6(7)*i.^6;



tRMS1 = sqrt(pdist2(f1', sort(trainy)'));
tRMS2 = sqrt(pdist2(f2', sort(trainy)'));
tRMS3 = sqrt(pdist2(f3', sort(trainy)'));
tRMS4 = sqrt(pdist2(f4', sort(trainy)'));
tRMS5 = sqrt(pdist2(f5', sort(trainy)'));
tRMS6 = sqrt(pdist2(f6', sort(trainy)'));
vRMS1 = sqrt(pdist2(f1', sort(valy)'));
vRMS2 = sqrt(pdist2(f2', sort(valy)'));
vRMS3 = sqrt(pdist2(f3', sort(valy)'));
vRMS4 = sqrt(pdist2(f4', sort(valy)'));
vRMS5 = sqrt(pdist2(f5', sort(valy)'));
vRMS6 = sqrt(pdist2(f6', sort(valy)'));

p = 1:6;
tRMS = [tRMS1 tRMS2 tRMS3 tRMS4 tRMS5 tRMS6];
vRMS = [vRMS1 vRMS2 vRMS3 vRMS4 vRMS5 vRMS6];

figure(5);
hline1 = plot(p, tRMS, 'g');
hold on;
hline2 = plot(p, vRMS, 'r');
legend([hline1,hline2],'tRMS','vRMS','Location','northwest');

hold off;