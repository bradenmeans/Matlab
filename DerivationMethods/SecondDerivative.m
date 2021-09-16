y = @(x)cos(x);
secondDeriv(y,0.1,-pi,pi);

function [df] = secondDeriv(f,h,lower,upper)
n = 1;


for x = lower:h:upper
    df(n) = (f(x+h)+f(x-h)-2*f(x))/(h^2);
    n = n + 1;
end


xval = (-pi:(2*pi)/(((upper - lower)/0.1)):pi);

f = cos(xval);
fprime = -cos(xval);
hold on 
p = plot(xval,f,xval,df,xval,fprime);
p(1).LineWidth = 1.5;
p(2).LineWidth = 4;
p(3).LineWidth = 1.5;
title('Graph of Cosine and Second Derivative Cosine');
xlabel('x-axis');
ylabel('y-axis');
xlim([-pi pi]);
ylim([-1.75 1.75]);

legend({'f(x) = cos(x)','f''''(x)=-cos(x) (Numerical)','f''''(x)=-cos(x) (Analytical)'}, 'Location', 'southeast');
end
