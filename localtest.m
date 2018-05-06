%this is the script for test your classifier locally, replace the path with
%your setup for the given dataset and enjoy~
clear;
path = '';
digits 4;
A = [];
for i = 1 : 5
    A = [A,load([path,'data_batch_',num2str(i),'.mat'])];
end
    B = load([path,'test_batch.mat']);
accuracy = 0;
for i = 1 : 5
    traindata = [];
    trainlabels = [];
    disp(['Training Batch ',num2str(i)]);
    traindata = A(i).data;
    trainlabels = A(i).labels;
    testdata = B.data;
    testlabels = B.labels;
    Model = train(traindata,trainlabels);
    disp(['Testing Batch ',num2str(i)]);
    resultlabels = classify(Model,testdata);
    disp(['Accuracy is ', num2str(sum(resultlabels == testlabels) / 10000)]);
    accuracy = accuracy + sum(resultlabels == testlabels);
end
accuracy = accuracy / 50000;
fprintf('Total accuracy = %f\n',accuracy);