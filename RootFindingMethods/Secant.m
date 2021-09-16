roots = SecantMethod(5, 6, 0.0000001);

sprintf('Root of the function: %f', roots)

%x1 and x2 are inital guesses
%Epsilon is the tolerance
%Desired input function can be changed in the function at the bottom.
function roots = SecantMethod(x1, x2, epsilon)
   f1 = myFunc(x1);
   xn = inf;
   
   while abs(xn) > epsilon
       f2 = myFunc(x2);
       
       %Secant method formula
       xn = (f2 * (x2 - x1)) / (f2 - f1);
       
       %Make second point first point 
       x1 = x2;
       f1 = f2;
       
       %New second point 
       x2 = x2 - xn;
   end
   roots = x2;
end

%Desired function that roots will be found for.
function y = myFunc(t)
    y = t^2 - 4 * t - 7;
end