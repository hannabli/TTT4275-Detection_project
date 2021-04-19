

lambda = 0:0.1:3000;
K = 1024;
P_FA = 1 - gamcdf(lambda, K, sigma_w_sq);
P_D = 1 - gamcdf(lambda, K, sigma_w_sq + sigma_s_sq);

figure(1)
plot(P_FA,P_D)
xlabel('P_{FA}'); ylabel('P_{D}');
legend('K = 1024')
title('ROC')




% function p_D = P_D(sigma_s_sq, sigma_w_sq, alpha)
%     p_D = exp((sigma_w_sq*log(alpha)/(sigma_s_sq + sigma_w_sq)));
% end
% For 2 frihetsgrader. 


