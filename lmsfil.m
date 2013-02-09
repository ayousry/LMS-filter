close all
clear all
clc
   
N=100000;                    % Filter length
t=[0:N-1];
input=wavread('input.wav');  % Input signal including noise
indes=wavread('Ref.wav');    % Desired signal = reference 
x=indes(1:N);
d=input(1:N);
mu=.1;                       % Step size
w=zeros(1,N);                % Filter coefficients

for i=1:N
   e(i) = d(i) - w(i)' * x(i);        % Error signal
   w(i+1) = w(i) + mu * e(i) * x(i);  % Final filter coefficients
end
for i=1:N
yd(i) = sum(w(i)' * x(i));            % Output signal
end

subplot(221),plot(t,d),ylabel('Desired Signal'),
subplot(222),plot(t,x),ylabel('Input Signal+Noise'),
subplot(223),plot(t,e),ylabel('Error'),
subplot(224),plot(t,yd),ylabel('Adaptive Desired output');
