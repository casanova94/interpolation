function [X,Y]=leePuntos
%este imread solo funciona para windows :s
%a=imread('fondo2.JPG');
%image([0 1],[0 1],a);
imshow('fondo2.JPG');
[X,Y]=ginput;

end