function prakt2
clc;
t=[0 40];
[t,X]=ode45(@Func,t,[9; 4]);
plot(t,X(:,1), t,X(:,2));
title('Модель Хищник-Жертва');
legend('Жертва','Хищник');
disp(['Жертв:     ' num2str(X(length(X)-1, 1))]);
disp(['Хищников: ' num2str(X(length(X)-1, 2))]);
disp(['Коэффициент р:   ' num2str(X(length(X)-1, 1)/X(length(X)-1, 2))]);
end 

function out=Func(~,x)
a1 = 0.8;
a2 = 0.8;
b1 = 0.3;
b2 = 0.055;
T = 1;
p = 3;


u = ((((x(1)-p.*x(2))./T)+a1.*x(1)-b1.*x(1).*x(2)+p.*a2.*x(2)-p*b2.*x(1).*x(2))/p);

f1 = (a1.*x(1)-b1.*x(1).*x(2));
f2 = (-a2.*x(2)+b2.*x(1).*x(2)+u);

out = [f1;f2];
end
