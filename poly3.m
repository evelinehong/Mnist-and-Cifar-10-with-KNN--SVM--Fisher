function [ K ] = poly3(data1,data2)
    K = data1 * data2';
    K = K + ones(size(K));
    K = K.^3;
end

