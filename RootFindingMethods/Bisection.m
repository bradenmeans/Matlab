%Desired function that roots will be found for.
y = @(x) x^3 - 6*x + 3;

roots = BisectionMethod(y, 0, 1, 0.0000001);

sprintf('Root of the function: %f', roots)

%f is the input function which can be changed above
%x1 and x2 are inital guesses
%Epsilon is the tolerance
function roots = BisectionMethod(f, x1, x2, epsilon)
    if f(x1) * f(x2) > 0
        fprintf("No roots exist between the given interval.")
    end
    
    %Bisection formula initial claculation
    xh = (x1 + x2) / 2;
    
    while abs(f(x1) * f(x2)) > epsilon
        %Check if the x axis has been crossed
        if f(xh) * f(x2) < 0
            x1 = xh;
        else 
            x2 = xh;
        end
        
        %Recalculate new half way point based on the new x values.
        xh = (x1 + x2) / 2;
    end
    
    roots = xh;
end