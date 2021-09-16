y = @(x)cos(x);
xval = (-pi:0.00901:pi);
xval2 = (-pi:0.4834:pi);
yprime = -sin(xval);

 for h = 0.00001:0.001:0.01
     dh = firstDeriv(y, h, -pi,pi);
end

for h2 = 0.01:0.001:0.5
    dh2 = secondDeriv(y,h2,-pi,pi);
end

figure(1);
sse = (dh - (sin(xval))).^2;
hval = (0.00001:1.4312321*10^-5:0.01);
plot(hval,sse)
xlim([0 0.001]);
set(gca, 'YScale','log');
title('SSE of First Derivative by Step Width');
xlabel('Step width h');
ylabel('ln(sum of squared error)');

figure(2);
sse2 = (dh2 - (-sin(xval2))).^2;
hval2 = (0.01:0.03799:0.5);
plot (hval2,sse2)
xlim([0 0.1]);
set(gca, 'YScale','log');
title('SSE of Second Derivative by Step Width');
xlabel('Step width h');
ylabel('ln(sum of squared error)');




function [df] = firstDeriv(f,h,lower,upper)
n = 1;


for x = lower:h:upper
    df(n) = (f(x+h)-f(x))/h;
    n = n + 1;
end
end 
function [ddf] = secondDeriv(f,h,lower,upper)
n = 1;


for x = lower:h:upper
    ddf(n) = (f(x+h)+f(x-h)-2*f(x))/(h^2);
    n = n + 1;
end


end

