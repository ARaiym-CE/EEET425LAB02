%EEET 425 LAB02

n = 0:99; %time

h1 = [1, 1/2, 1/4, 1/8, 1/16, 1/32];

h2 = [1, 1, 1, 1, 1];

h1h2 = conv(h1, h2);

h3 = [1/4, 1/2, 1/4];

h1h2h3 = conv(h1h2, h3);

x = [1, zeros(1, 99)]; %T4 impulse response

a4 = [1 -0.9 0.81];

b4 = [1 2];

x123 = [h1h2h3 zeros(1, 100-length(h1h2h3))];

h = filter(b4, a4, x123);

stem(n, h, 'filled')

