%%
% Juan Jose Garcia Leon (108025118945)
% Jorge Enrique Rojas Perez (108025118076)
% Andres Esteban Murillo Moreno (108025118109)
% Santiago Andres Acosta Parra (108025118010)
clc
clear all
close all

% ¿the unsorted list is loaded from the .mat file 
data = load('unsortierteliste.mat');
unsortierteListe = data.unsortierte_liste;

tic;
sorted_quick = quicksort1(unsortierteListe);
time_quick = toc;
tic;
sorted_bubble = bubblesort(unsortierteListe);
time_bubble = toc;
tic;
sorted_matlab = sort(unsortierteListe);
time_matlab = toc;


%the measured execution times of each sorting algorithm are displayed 
disp(['Quicksort time: ', num2str(time_quick)]);
disp(['Bubblesort time: ', num2str(time_bubble)]);
disp(['MATLAB sort time: ', num2str(time_matlab)]);

%The times recorded that we measured with each of the algorithms
%Quicksort time: 0.0069736
%Bubblesort time: 0.0024914
%MATLAB sort time: 6.28e-05

%The fastest sorting algorithm seems to be the one that uses the matlab
%function sort
