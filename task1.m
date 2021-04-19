clear all;
Sk = importdata('data/T1_data_Sk_Gaussian.mat');
S = ifft(Sk);
Sr = real(S);
Si = imag(S);
N = length(Sk);

%% Plotting of histograms Gaussian
% pdf_normal = pdf('Normal', 
% figure(1)
% histogram(Sr, 'Normalization', 'pdf')
% title('Histogram of S_r')
% figure(2)
% histogram(Si, 'Normalization', 'pdf')
% title('Histogram of S_i')

%% 
Sbk = importdata('data/T1_data_Sk_BPSK.mat');
Sb = ifft(Sbk);
Sbr = real(Sb);
Sbi = imag(Sb);

%% Plotting of histograms BPSK
figure(3)
histogram(Sbr)
title('Histogram of S_{r}')
figure(4)
histogram(Sbi)
title('Histogram of S_{i}')

%% Expected values Gaussian
avg_r = 0;
avg_i = 0;
avg_ri = 0;
for i = 1:N
    avg_r = avg_r + Sr(i)/N;
    avg_i = avg_i + Si(i)/N;
    avg_ri = avg_ri + Sr(i)*Si(i)/N;
end

exp_s = avg_r + 1i*avg_i;

%% Expected values BPSK
b_avg_r = 0;
b_avg_i = 0;
b_avg_ri = 0;
for i = 1:N
    b_avg_r = b_avg_r + Sbr(i)/N;
    b_avg_i = b_avg_i + Sbi(i)/N;
    b_avg_ri = b_avg_ri + Sbr(i)*Sbi(i)/N;
end

b_exp_s = b_avg_r + 1i*b_avg_i;

