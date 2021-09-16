y = @(x)cos(x);
firstDerivImproved(y,0.1,-pi,pi);

function [df] = firstDerivImproved(f,h,lower,upper)
n = 1;


for x = lower:h:upper
    df(n) = (f(x+h)-f(x-h))/(2*h);
    n = n + 1;
end

xval = (-pi:(2*pi)/(((upper - lower)/0.1)):pi);

f = cos(xval);
fprime = -sin(xval);
hold on 
p = plot(xval,f,xval,df,xval,fprime);
p(1).LineWidth = 1.5;
p(2).LineWidth = 4;
p(3).LineWidth = 1.5;
title('Graph of Cosine and Derivative Cosine');
xlabel('x-axis');
ylabel('y-axis');
xlim([-pi pi]);
ylim([-1.75 1.75]);

legend({'f(x) = cos(x)','f''(x)=-sin(x) (Numerical)','f''(x)=-sin(x) (Analytical)'}, 'Location', 'southeast');





end