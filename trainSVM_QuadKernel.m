function Model=trainSVM_QuadKernel(data,label,C)
label=single(label);
if nargin < 3
    C=0.1;    
end
numClass=max(label)-min(label)+1;
Model.SV=cell(numClass,1);
Model.alpha_sv=cell(numClass,1);
Model.label_sv=cell(numClass,1);
Model.b=[];
for i=1:numClass
    label1=label;
    label1(label==i-1,1)=1;
    label1(label~=i-1,1)=-1;
    [SV,alpha_sv,label_sv,b]=binarySVM_QuadKernel(data,label1,C);
    Model.SV{i}=SV;
    Model.alpha_sv{i}=alpha_sv;
    Model.label_sv{i}=label_sv;
    Model.b=[Model.b;b];
end
end
function [SV,alpha_sv,label_sv,b]=binarySVM_QuadKernel(data,label,C)
kernel=(data*data'+1).^2;
H=kernel.*(label*label');
f=ones(size(label,1),1);
Aeq=label';
beq=0;
lb=zeros(size(label,1),1);
ub=zeros(size(label,1),1)+C;
alpha=quadprog(double(H),-1*f,[],[],double(Aeq),beq,lb,ub,[],optimset('Algorithm','interior-point-convex','Display','off'));
sv_idx=find(alpha>1e-5);%&(alpha<C-1e-4));
sv_idx1=find((alpha>1e-4)&(alpha<C-1e-4));
SV=data(sv_idx,:);
alpha_sv=alpha(sv_idx,:);
label_sv=label(sv_idx,:);
b_sv=(1./label(sv_idx1,:))'-(alpha.*label)'*kernel(:,sv_idx1);
b=mean(b_sv);
end
