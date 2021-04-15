data_H0 = importdata('T3_data_x_H0.mat');
data_H1 = importdata('T3_data_x_H1.mat');
data_sigma_s = importdata('T3_data_sigma_s.mat');
data_sigma_w = importdata('T3_data_sigma_w.mat');

N = length(data_sigma_s);

sigma_s_sq = 0;
sigma_w_sq = 0;
for i = 1:N
    sigma_s_sq = sigma_s_sq + abs(data_sigma_s(i))^2/N;
    sigma_w_sq = sigma_w_sq + abs(data_sigma_w(i))^2/N;
end

chi_square_H0 = zeros(1,N);
chi_square_H1 = zeros(1,N);

for i = 1:N
    chi_square_H0(i) = 2*abs(data_H0(i))^2/sigma_w_sq;
    chi_square_H1(i) = 2*abs(data_H1(i))^2/(sigma_s_sq + sigma_w_sq);
end
x = linspace(0,14);
pdf_chi_sq = pdf('Chisquare',x, 2); 

figure(1)
h = histogram(chi_square_H0, 'Normalization', 'pdf'); hold on;
plot(x, pdf_chi_sq); hold off;
title('Histogram of chi-squared random variable H0 vs. real pdf')

%q = integral(@(x)pdf_H0(x),0,Inf)

figure(2)
histogram(chi_square_H1, 'Normalization', 'pdf'); hold on;
plot(x, pdf_chi_sq); hold off;
title('Histogram of chi-squared random variable H1 vs. real pdf')












