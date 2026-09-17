%EEET 425 LAB02Q2c

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

cn = length(yn);
l = 0:59;
len = length(l);
newX = zeros(len, cn); %makes the new 60x200 matrix needed

for i = 1:len %iterates 60 times
    lagindex = l(i); 
    newX(i, :) = [zeros(1, lagindex), x(1:cn-lagindex)]; %shift x right by lagindex samples
end

ryx = newX * yn'; %new matrix made with 60x200 and 200x1
[max_val, max_idx] = max(ryx); %finds the highest y point and gives the x value
Dtotal = l(max_idx)

stem(l, ryx, 'filled')