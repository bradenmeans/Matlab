M = 1;
K = 3;
B = 0.5;
x0 = 2;
v0 = 0;
Integration_Time = 15;
h = 0.001;
N = Integration_Time / h;

t = [0:h:Integration_Time];
x = zeros(N+1,1);
v = zeros(N+1,1);
a = zeros(N+1,1);
x(1) = x0;
v(1) = v0;



for i = 1:N
    k1 = -K *x(i) - B * v(i);
    k2 = -K * (x(i)+h) - B * (v(i) + h * k1);
    
    v(i+1) = v(i) + (h/2).*(k1 + k2);
    x(i+1) = x(i) + (h/2).*(2 * v(i) + h*v(i));
    a(i) = (-K .*x(i) - B .* v(i));
end

plot(t,x,t,v,t,a)
xlabel('t(seconds)');
title('Improved Euler Method');
legend('Displacement','Velocity','Acceleration');
