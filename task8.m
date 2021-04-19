data = importdata('data/T8_numerical_experiment.mat');

K = 256;
realizations = 100;
sigma_w_sw = 1;
sigma_s_sq = 5;
alpha = [0.1;0.01];
q_inv = [1.2816;2.3263];

lambda = (K*sigma_w_sq) + (q_inv * sqrt(K)*sigma_w_sq);
PU_present = zeros(2,1);
T = zeros(1,realizations);
decisions = zeros(2, realizations);
for i=1:realizations
    T(i) = sum(abs(data(:,i)).^2);
    if T(i)>lambda(1)
        PU_present(1) = PU_present(1) + 1;
        decisions(1,i) = 1;
    end
    if T(i)>lambda(2)
        PU_present(2) = PU_present(2) + 1;
        decisions(2,i) = 1;
    end
end
PU_absent = realizations - PU_present;

beta = 1- normcdf(lambda, K*(sigma_w_sq+sigma_s_sq), sqrt(K*(sigma_s_sq+sigma_w_sq)^2));

figure(1)
stem(decisions(1,:),'filled')
title('Decisions made by SU with alpha = 0.1')

figure(2)
stem(decisions(2,:),'filled')
title('Decisions made by SU with alpha = 0.01')

