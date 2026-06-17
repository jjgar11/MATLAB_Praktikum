%%
% Juan Jose Garcia Leon (108025118945)
% Jorge Enrique Rojas Perez (108025118076)
% Andres Esteban Murillo Moreno (108025118109)
% Santiago Andres Acosta Parra (108025118010)

clc
clear all
close all

% a) Load image and average third dimension

A_rgb = imread("bochum-2312174_1280.jpg");
A = double(mean(A_rgb, 3));

figure;
colormap("gray");
sgtitle("Image Proccessing")

% Original image in grayscale
subplot(2,2,1);
imagesc(A); axis off; title("Grayscale image")

% Image with motion blur
A_blur = ImageProcessing.unschaerfe(A, 25);
subplot(2,2,2);
imagesc(A_blur); axis off; title("Motion blur image")

% Image detecting edges
A_edges = ImageProcessing.edges(A);
subplot(2,2,3);
imagesc(A_edges); axis off; title("Edge detection image")

% Image applying threshold comparison to A_edges
A_th = ImageProcessing.threshold(A_edges, 12);
subplot(2,2,4);
imagesc(A_th); axis off; title("Threshold to edge detection image")
