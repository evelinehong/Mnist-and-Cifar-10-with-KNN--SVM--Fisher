function Model=trainSVM_linear(data,label,C)
label=single(label);
if nargin < 3
    C=0.1;    
end
numClass=max(label)-min(label)+1;
Model.W=[];
Model.b=[];
for i=1:numClass
    label1=label;
    label1(label==i-1,1)=1;
    label1(label~=i-1,1)=-1;
    [w,b]=binarySVM_linear(data,label1,C);
    Model.W=[Model.W;w];
    Model.b=[Model.b;b];
end
end
function [w,b]=binarySVM_linear(data,label,C)
H=(data*data').*(label*label');
f=ones(size(label,1),1);
Aeq=label';
beq=0;
lb=zeros(size(label,1),1);
ub=zeros(size(label,1),1)+C;
alpha=quadprog(double(H),-1*f,[],[],double(Aeq),beq,lb,ub,[],optimset('Algorithm','interior-point-convex','Display','off'));
w=(alpha.*label)'*data;
sv_idx=find((alpha>1e-5)&(alpha<C-1e-5));
b_all=1./label-(w*data')';
b=mean(b_all(sv_idx));
end
