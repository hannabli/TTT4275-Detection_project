

lambda = 1;
alpha = 

fplot(@(alpha)P_D(sigma_s,sigma_w,alpha),[0,1])



function p_D = P_D(sigma_s, sigma_w, alpha)
    p_D = exp((sigma_w^2*log(alpha)/(sigma_s^2 + sigma_w^2)));
end

function p_FA = P_FA(sigma_w,lambda)
    p_FA = exp(-lambda/sigma_w^2);
end