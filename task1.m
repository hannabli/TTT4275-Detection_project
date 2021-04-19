clear all;
Sk = importdata('data/T1_data_Sk_Gaussian.mat');
S = ifft(Sk);
Sr = real(S);
Si = imag(S);
N = length(Sk);
sigma_r_gaussian = std(Sr);
sigma_i_gaussian = std(Si);
x = linspace(-0.1,0.1,1000);
pdf_r_gaussian = normpdf(x,0,sigma_r_gaussian);
pdf_i_gaussian = normpdf(x,0,sigma_i_gaussian);
% Plotting of histograms Gaussian
figure(1)
histogram(Sr, 'Normalization', 'pdf')
hold on;
plot(x,pdf_r_gaussian)
legend('Histogram', 'Real gaussian pdf')
title('Histogram of S_r')
figure(2)
histogram(Si, 'Normalization', 'pdf')
hold on;
plot(x,pdf_i_gaussian)
legend('Histogram', 'Real gaussian pdf')
title('Histogram of S_i')

%% 
Sbk = importdata('data/T1_data_Sk_BPSK.mat');
Sb = ifft(Sbk);
Sbr = real(Sb);
Sbi = imag(Sb);
sigma_r_bpsk = std(Sbr);
sigma_i_bpsk = std(Sbi)
pdf_r_bpsk = normpdf(x,0,sigma_r_bpsk);
pdf_i_bpsk = normpdf(x,0,sigma_i_bpsk);
%% Plotting of histograms BPSK
figure(3)
histogram(Sbr, 'Normalization', 'pdf')
hold on;
plot(x,pdf_r_bpsk)
legend('Histogram','Real gaussian pdf')
title('Histogram of S_{r}')
figure(4)
histogram(Sbi, 'Normalization', 'pdf')
hold on;
plot(x,pdf_i_bpsk)
legend('Histogram','Real gaussian pdf')
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

