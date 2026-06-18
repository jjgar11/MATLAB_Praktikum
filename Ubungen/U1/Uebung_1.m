% Juan Jose Garcia Leon (108025118945)
% Jorge Enrique Rojas Perez (108025118076)
% Andres Esteban Murillo Moreno (108025118109)
% Santiago Andres Acosta Parra (108025118010)

clc       % clear the command window
clear all % clear all variables in the workspace
close all % close all open figure windows

%% 1 - Fakultät
function result = factorial(n)
    if n > 1
        % Each factorial is obtained by multiplying the current number
        % times the previous factorial
        result = n * factorial(n-1);
        % The factorial of 1 is 1.
    else
        result = 1;
    end
end

% User interaction
prompt = "Enter a number for which the factorial is to be calculated:\n";
num = input(prompt);
fprintf("The factorial of %d is %d \n\n\n", num, factorial(num));

%% 2 - Fibbonacchi-Zahlen
function fibonacci(n)
    k = 1;
    k_minus_1 = 1;
    k_minus_2 = 0;
    % Loop until the desired Fibonacci number
    for i = 1:n
        % Fibonacci serie is 1 for the first 2 numbers
        if i > 2
            % Current Fib. number is obtained by adding the previous two
            % numbers
            new_k = k + k_minus_1;

            % Update the last two number for the next sum
            k_minus_2 = k_minus_1;
            k_minus_1 = k;
            k = new_k;
        end
        fprintf("F.Z. %d: \t%d \t(%d + %d)\n", i, k, k_minus_1, k_minus_2);
    end
end

num = 121;
fprintf("The first %d numbers of the Fibonacci sequence are:\n", num)
fibonacci(num)

%% 3 - Summe der ersten n geraden Zahlen
n = 10; % Number of even numbers to sum
sum_even = 0; % Initialize the sum to 0
for i = 1:n
    even_number = i * 2; % Calculate the i-th even number
    sum_even = sum_even + even_number; % Add the even number to the sum
end