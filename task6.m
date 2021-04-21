
lambda = 0:0.1:750;
K = 256;
P_FA_gaussian = 1 - normcdf(lambda, K*sigma_w_sq, sqrt(K*sigma_w_sq^2));
P_D_gaussian = 1 - normcdf(lambda, K*(sigma_w_sq+sigma_s_sq), sqrt(K*(sigma_s_sq+sigma_w_sq)^2));
P_FA = 1 - gamcdf(lambda, K, sigma_w_sq);
P_D = 1 - gamcdf(lambda, K, sigma_w_sq + sigma_s_sq);
    
figure(1)
plot(lambda, P_FA_gaussian)
hold on;
plot(lambda, P_FA)
legend('Gaussian approximation', 'Exact gamma')
xlabel("\lambda'"); ylabel("p(\lambda')")
title('P_{FA}: Exact vs. approximation')

figure(2)
plot(lambda, P_D_gaussian)
hold on;
plot(lambda, P_D)
legend('Gaussian approximation', 'Exact gamma')
xlabel("\lambda'"); ylabel("p(\lambda')")
title('P_D: Exact vs. approximation')