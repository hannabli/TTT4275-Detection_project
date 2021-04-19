
lambda = 0:0.1:3000;
K = 1024;
P_FA_gaussian = 1 - normcdf(lambda, K*sigma_w_sq, sqrt(K*sigma_w_sq^2));
P_D_gaussian = 1 - normcdf(lambda, K*(sigma_w_sq+sigma_s_sq), sqrt(K*(sigma_s_sq+sigma_w_sq)^2));

figure(1)
plot(lambda, P_FA_gaussian)
hold on;
plot(lambda, P_FA)
legend('Gaussian approximation', 'Exact gamma')
title('P_FA: Exact vs. approximation')

figure(2)
plot(lambda, P_D_gaussian)
hold on;
plot(lambda, P_D)
legend('Gaussian approximation', 'Exact gamma')
title('P_D: Exact vs. approximation')