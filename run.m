clear all;
clc;
warning off;
addpath(genpath('./'));
addpath(genpath('./measure'));
addpath(genpath('./utils'));
ds = {'synthetic_data.mat'};
dsPath = './datasets/';
for dsi = 1:1:length(ds)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    dataName = ds{dsi}; disp(dataName);
    load(strcat(dsPath,dataName)); 
    k = length(unique(Y));
    numofview = length(X);
    lambdalist=[1e0];
    selectanchor = [k,k+3,k+6, k+9, k+12, k+15, k+18, k+28, k+50];
    gammalist = [1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2.0];  
    result = [];
for iter=1:1
    for ilam= 1:length(lambdalist)
    for ichor = 1:length(selectanchor)
        for id = 1:length(gammalist)
                [U,A,W,Zi,iter,obj,J_matrix,alpha,t,W_m] = algo_qp_ADM(X,Y,selectanchor(ichor),gammalist(id),5,lambdalist(ilam)); % X,Y,lambda,d,numanchor
                [~ , label] = max(U, [], 2);
                res=Clustering8Measure(Y,label)
                result = [result; selectanchor(ichor)  gammalist(id) lambdalist(ilam) res t];
        end
    end
    end
end
end


