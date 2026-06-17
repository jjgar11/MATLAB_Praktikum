%%
% Juan Jose Garcia Leon (108025118945)
% Jorge Enrique Rojas Perez (108025118076)
% Andres Esteban Murillo Moreno (108025118109)
% Santiago Andres Acosta Parra (108025118010)

clc
clear all
close all

% Task 4a: Define variables
delta = 0.03;

% Task 4b: Create system objects
Rx = empfaenger();
% It is assumed that the kanal.m file provided in Moodle is in the same folder
Ch = kanal(delta, Rx); 
Tx = sender(Ch);

% Task 4c: Generate a vector of 250 random bits {0,1} with uniform distribution
originalBits = randi([0, 1], 1, 250);

% Send the vector through the transmitter
Tx.sendeBitvektor(originalBits);

% Task 4d: Receive the extracted and decoded data from the buffer
receivedBits = Rx.ausBufferNehmen();

% Calculate the number of faulty bits by comparing sent and received vectors
faultyBits = sum(originalBits ~= receivedBits);

% Calculate the Bit Error Rate (BER)
bitErrorRate = faultyBits / length(originalBits);

% Display results in the command window
fprintf('Binary Symmetric Channel Simulation with Repetition Code\n');
fprintf('Number of transmitted bits: %d\n', length(originalBits));
fprintf('Number of faulty bits: %d\n', faultyBits);
fprintf('Bit Error Rate (BER): %f\n', bitErrorRate);