roots = RegulaFalsiMethod(-2, 0, 0.0000001);

sprintf('Root of the function: %f', roots)

%x1 and x2 are inital guesses
%Epsilon is the tolerance
%Desired input function can be changed in the function at the bottom.
function roots = RegulaFalsiMethod(x1, x2, epsilon)
    f1 = myFunc(x1);
    f2 = myFunc(x2);
    
    flag = 0;
    
    %Make sure interval has roots
    if f1 * f2 > 0
        fprintf("No roots exist between the given interval.")
        roots = "Unknown";
        flag = 1;
    end
    
   
    while abs(f1 * f2) > epsilon & flag ~= 1
        %RF method formula
        xr = x2 - (f2 * (x1 - x2))/(f1 - f2);
        fr = myFunc(xr);
        
        %New x and y values assigned
        if sign(fr) == sign(f1)
            x1 = xr;
            f1 = fr;
        else 
            x2 = xr;
            f2 = fr;
        end
    end
    
    if flag ~= 1
        roots = xr;
    end
        

end

%Desired function that roots will be found for.
function y = myFunc(t)
    y = t^4-3*t^3+4*t-2;
end