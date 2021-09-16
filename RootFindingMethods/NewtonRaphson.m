
roots = NewtonRaphsonMethod(-4, 0.0000001);

sprintf('Root of the function: %f', roots)

%x0 is the initial guess input 
%Epsilon is tolerance value
%Desired input function/derivative can be changed in the functions at the bottom.
function roots = NewtonRaphsonMethod(x0, epsilon)
    diff = inf;
    
    while abs(diff) > epsilon
        %Orignal function we want to find roots of as well as derivative
        f = myFunc(x0);
        df = myDerFunc(x0);
        
        %Newton Raphson formula
        xn = x0 - (f/df);
        
        diff = abs(x0 - xn); %Difference between the two terms calculated
        x0 = xn; %Update the new value of x after the loop
        
    end
    
    roots = x0; 


end

%Desired function that roots will be found for.
function y = myFunc(t)
    y = t^3 -5 * t + 4;
end

%Derivative of that function
function dy = myDerFunc(t)
dy = 3 * t^2 - 5;
end