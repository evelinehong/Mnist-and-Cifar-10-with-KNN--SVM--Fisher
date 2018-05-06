function [ K ] = poly2(data1,data2)
    K = data1 * data2';
    K = K + ones(size(K));
    K = K.^2;
end

