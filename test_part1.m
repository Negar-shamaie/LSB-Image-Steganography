clc;clear;close all;
image = imread('Amsterdam.jpg');
image=rgb2gray(image);

message = 'signal; ';
Mapset_data = load('Mapset.mat');
mapset = Mapset_data.Mapset;

encoded_image = coding(message, image, mapset);
encoded_image_path = 'encoded_image.jpg';  % Provide the correct file path
decoded_message = decoding(encoded_image, mapset,5);

