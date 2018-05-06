# Mnist and Cifar-10 with KNN, SVM, Fisher
Project包括五种分类器，KNN, SVM linear, SVM kernel, Fisher’s Linear Discriminant, Kernel Fisher Discriminant。用来分类CIFAR-10和MNIST。

注意事项：
init.m: 在检验CIFAR-10之前一定要先跑init.m！这个是VLFEAT特征提取库的代码。<br>
train.m: 为CIFAR-10选定分类器。<br>
classify.m: 为CIFAR-10选定分类器。<br>
localtest.m: CIFAR-10的主程序，CIFAR-10在这里跑。<br>
localtest2.m: MNIST的主程序。直接在localtest2.m里选择分类器。train 和classify都要选！
	SVM, FisherKernel在电脑内存小于8GB时Matlab提示内存不足，这时改用	localtest3.m <br>
localtest3.m: 当MNIST显示内存不足时，用这个跑MNIST. <br>
当相对路径不成功时，在init.m;localtest.m;localtest2.m;localtest3.m中我都有path=''。请在引号内输入下载的hongyining文件夹所在的位置。<br>

其他函数：
训练函数：
trainKNN.m
trainSVM_linear.m
trainSVM_QuadKernel.m
trainFisher.m
trainFisherwKernel.m

分类函数：
KNNclassify.m
SVM_linearClassify.m
SVM_QuadKernelClassify.m
FisherClassify.m
FisherwKernelClassify.m

特征提取函数：
naivehog.m