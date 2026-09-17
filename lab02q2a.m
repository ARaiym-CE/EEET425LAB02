%EEET 425 LAB02Q2

n = 0:199; % 0 =< n =< 199

xn = [1, 1, 1, 1, 1, -1, -1, 1, 1, -1, 1, -1, 1]; %13 point barker sequence
x = [xn, zeros(1, 200 - length(xn))]; % fills in the vector with zeros

a = 0.9; %alpha/attenuation i think
D = 20; %delay by 20 sample periods
sigmaSqrd = 0.01;
sigma = sqrt(sigmaSqrd);

wn = sigma * randn(1, 200); % w(n) is sigma multiplied by a random number

delay = [zeros(1, D), x(1:200-D)]; %actual delay 

yn = a * delay + wn; %final signal with the delay and random noise

%stem(n, x, 'filled');

stem(n, yn, 'filled');