%%
% Juan Jose Garcia Leon (108025118945)
% Jorge Enrique Rojas Perez (108025118076)
% Andres Esteban Murillo Moreno (108025118109)
% Santiago Andres Acosta Parra (108025118010)

clc       % clear the command window
clear all % clear all variables in the workspace
close all % close all open figure windows

% We can define the vectors x1 and h1
x1 = [17;9;2;-14;7;-4;8]; 
h1 = [12;4;0;-2;8;-5;-9]; 

%Using the first function
y1 = skalarprodukt(x1, h1); 

%Function for scalar product
function [y] = skalarprodukt(x, h)
    N = length(x); 
    y = 0;

    for m = 1:N 
        y = y + conj(x(m)) * h(m);

    end
end

%Plot the result
figure;
subplot(3,1,1);
stem(x1);
title('Vector x_1');
grid on;

subplot(3,1,2);
stem(h1);
title('Vector h_1');
grid on;

subplot(3,1,3);
stem(y1);
title(['Scalar Product y = ', num2str(y1)]);
grid on;

%%
%Usign the second funtion
y1_alt = skalarprodukt_alternativ(x1, h1);

%Function for alternative scalar product
function [y] = skalarprodukt_alternativ(x, h)
    y = x' * h;
end

%Plot the result for these case
figure; 
stem(y1_alt);
title(['Alternative Scalar Product y = ', num2str(y1_alt)]);
grid on;

%Comparing the result with the two funtions
disp(['Are the results of both functions equal?: ', num2str(y1 == y1_alt)]);
%%
%Print the result of the scalar product
y1_invert = skalarprodukt_alternativ(h1, x1);
disp(['Result swapping parameters (h1, x1): ', num2str(y1_invert)]);

%%
% Define x2 and h2
x2 = [7;4;(5+6+9+0)]; 
h2 = [2;7;-10]; 

%Firts calculate to both scalar products
y_var1 = skalarprodukt_alternativ(x1, h1);
y_var2 = skalarprodukt_alternativ(x2, h2);
y_var=y_var1*y_var2;

%Print the resultd without used the function
disp(['The result of the first scalar product is: ', num2str(y_var1)]);
disp(['The result of the second scalar product is: ', num2str(y_var2)]);
disp(['The result of the first times the second scalar product is: ', num2str(y_var)]);

%Using the third function
y_multi = skalarprodukt_multi(x1, h1, x2, h2);
disp(['The result of the multiple scalar product is: ', num2str(y_multi)]);
disp(['Are the results of both cases equal?: ', num2str(y_var == y_multi)]);