

lambda = 0:0.1:3000;
K = [1,10,100,1000];

for i=1:length(K)
    P_FA = 1 - gamcdf(lambda, K(i), sigma_w_sq);
    P_D = 1 - gamcdf(lambda, K(i), sigma_w_sq + sigma_s_sq);
    plot(P_FA,P_D, 'LineWidth',1.2)
    hold on
    title('ROC')
end

legend('K=1','K=10','K=100','K=1000')
xlabel('P_{FA}'); ylabel('P_{D}')


