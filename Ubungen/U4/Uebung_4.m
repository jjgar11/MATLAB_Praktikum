%%
% Juan Jose Garcia Leon (108025118945)
% Jorge Enrique Rojas Perez (108025118076)
% Andres Esteban Murillo Moreno (108025118109)
% Santiago Andres Acosta Parra (108025118010)

clc
clear all
close all

% The unsorted list is loaded from the .mat file 
load("unsortierteliste.mat", "unsortierte_liste");

tic;
sortierte_liste = quicksort(unsortierte_liste);
time_quick = toc;

tic;
sortierte_liste = bubblesort(unsortierte_liste);
time_bubble = toc;

tic;
sorted_matlab = sort(unsortierte_liste);
time_matlab = toc;

% The measured execution times of each sorting algorithm are displayed 
disp(['Quicksort time: ', num2str(time_quick)]);
disp(['Bubblesort time: ', num2str(time_bubble)]);
disp(['MATLAB sort time: ', num2str(time_matlab)]);

%The times recorded that we measured with each of the algorithms
%Quicksort time: 0.004752
%Bubblesort time: 0.001692
%MATLAB sort time: 5.6e-05

%The fastest sorting algorithm seems to be the one that uses the matlab
%function sort
