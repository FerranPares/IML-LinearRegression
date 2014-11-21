load('reg_data_set_1.mat');
scatter(x(1),y(1),5,'blue');
hold on;
for i=1:length(x)
    scatter(x(i),y(i),5,'blue');
end
hold off;

%analitical
x2 = [ones(length(x),1) x];
wanalitical = 1/(transpose(x2)*x2).*x2.*y;

%plot analitical

%randomly initialize w1, w0
i1 = randi(length(x));
i2 = randi(length(x));

%t=? ask to user
%num_iter=? ask to user

for k=1:num_iter
    [J, G] = Jfunc(w, x, y);
    w = w + t.*G;
    %control de J
end


