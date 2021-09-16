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
    k1 = h .* (-K .*x(i) - B .* v(i));
    k2 = h .* (-K .*(x(i) + (h/2)) - B .* (v(i) + (k1/2)));
    k3 = h .* (-K .*(x(i) + (h/2)) - B .* (v(i) + (k2/2)));
    k4 = h .* (-K .* (x(i)+h) - B .* (v(i) + k3));
    

    k5 = h * v(i);
    k6 = h * (v(i) + k5/2);
    k7 = h * (v(i) + k6/2);
    k8 = h * (v(i) + k7);
    
    v(i+1) = v(i) + k1/6 + k2/3 + k3/3 + k4/6;
    x(i+1) = x(i) + k5/6 + k6/3 + k7/3 + k8/6;
    a(i) = (-K .*x(i) - B .* v(i));
end

plot(t,x,t,v,t,a)
xlabel('t(seconds)');
title('Runge Kutta 4th Order Method');
legend('Displacement','Velocity','Acceleration');