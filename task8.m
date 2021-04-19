data = importdata('data/T8_numerical_experiment.mat');

K = 256;
realizations = 100;
sigma_w_sw = 1;
sigma_s_sq = 5;
alpha = 0.1;
% alpha = 0.01
q_inv = 1.2816;
% q_inv_0.01 = 2.3263;
lambda = (K*sigma_w_sq) + (q_inv * sqrt(K)*sigma_w_sq);

PU_present = 0;
T = zeros(1,realizations);
for i=1:realizations
    T(i) = sum(abs(data(:,i)).^2);
    if T(i)>lambda
        PU_present = PU_present + 1;
    end
end
PU_absent = realizations - PU_present;
