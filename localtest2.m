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
    
    traindata = A;
    trainlabels = B;
    disp(['Training Batch ']);
    Model = trainKNN(traindata,trainlabels);
    %Model = trainFisher(traindata,trainlabels);
    %Model = trainSVM_linear(traindata,trainlabels);
    %Model = trainSVM_QuadKernel(traindata,trainlabels);
    %Model = trainFisherwKernel(traindata,trainlabels,@poly2,2000);
    disp(['Testing Batch ']);
    resultlabels = KNNclassify(Model,testdata);
    %resultlabels = FisherClassify(Model,testdata);
    %resultlabels = SVM_linearClassify(Model,testdata);
    %resultlabels = SVM_QuadKernelClassify(Model,testdata);
    %resultlabels = FisherwKernelClassify(Model,testdata,@poly2);
    disp(['Accuracy is ', num2str(sum(resultlabels == testlabels) / 10000)]);

