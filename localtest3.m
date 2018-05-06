clear;
path = '';
digits 4;

    A = loadMNISTImages([path,'train-images.idx3-ubyte']);
    B = loadMNISTLabels([path,'train-labels.idx1-ubyte']);
    C = loadMNISTImages([path,'t10k-images.idx3-ubyte']);
    D = loadMNISTLabels([path,'t10k-labels.idx1-ubyte']);
accuracy = 0;
    testdata = C;
    testlabels = D;

for i = 1 : 6
    traindata = [];
    trainlabels = [];
    disp(['Training Batch ',num2str(i)]);
    siz = size(A,1)/6;
    siz1 = siz * (i-1) + 1;
    siz2 = siz * i;
    for j = siz1 : siz2
    traindata = [traindata; A(j,:)];
    trainlabels = [trainlabels; B(j,:)];
    end
    %Model = trainSVM_linear(traindata,trainlabels);
    %Model = trainSVM_QuadKernel(traindata,trainlabels);
    Model = trainFisherwKernel(traindata,trainlabels,@poly2,2000);
    disp(['Testing Batch ',num2str(i)]);
    %resultlabels = SVM_linearClassify(Model,testdata);
    %resultlabels = SVM_QuadKernelClassify(Model,testdata);
    resultlabels = FisherwKernelClassify(Model,testdata,@poly2);
    disp(['Accuracy is ', num2str(sum(resultlabels == testlabels) / 10000)]);
    accuracy = accuracy + sum(resultlabels == testlabels);
end
accuracy = accuracy / 60000;
fprintf('Total accuracy = %f\n',accuracy);
