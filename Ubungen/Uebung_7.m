%%
% Juan Jose Garcia Leon (108025118945)
% Jorge Enrique Rojas Perez (108025118076)
% Andres Esteban Murillo Moreno (108025118109)
% Santiago Andres Acosta Parra (108025118010)

clc
clear all
close all

% Define delta and transmitted bitvector
delta = 0.05;
bitvector = logical(randi([0, 1], [1, 250]));

% Definition of the receiver, channel, and transmitter
repetition = 3;
rx = empfaenger(repetition);
ch = kanal(delta, rx);
tx = sender(ch, rx.pRepetition);

% Send the bitvector via the transmitter (tx)
tx.sendeBitvektor(bitvector);

% Receive the decoded data from the receiver (rx)
received_data = rx.ausBufferNehmen();

% Calculate the bit error rate
wrong_bits = (bitvector ~= received_data);
bit_error = sum(wrong_bits) / length(bitvector);

% Display results in the command window
fprintf('Number of transmitted bits: %d\n\n', length(bitvector));

fprintf('Transmitted and Received bits: \n')
fprintf('%d', bitvector);
fprintf('\n');
fprintf('%d', received_data);
fprintf('\n');
chars = ' ↑'; fprintf(chars(wrong_bits + 1));
fprintf('\n');

fprintf('Faulty bits (%d) are marked with an arrow underneath. \n\n', sum(wrong_bits))

fprintf('Bit Error Rate (BER): %.3f\n', bit_error);