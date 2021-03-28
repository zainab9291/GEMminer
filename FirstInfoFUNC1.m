function [ Infomatrix] = FirstInfoFUNC1()
%this function for build
%   information matrix
filename='impoData.xlsx';
% the following statments is working on excel file to extract the all
% papers number
[num,txt,raw]=xlsread(filename);
q=txt(2:end,9);
k=regexp(q(2),'\w+\d+\w','match');
f=cell2mat(k{:});
d=str2num(f);
c=zeros(1,length(q));
c(1)=d;
[Abstract,mask,words_count]=wordCountPubMed1_11_2016(d);
for i=2:length(q)
k=regexp(q(i),'\w+\d+\w','match');
f=cell2mat(k{:});
d=str2num(f);
c(i)=d;
end
n=length(c);
Infomatrix=cell(n+1,4);
for j=1:n
    [ Model,React,Meta ] = ModelReactMetaFunc1(c(j));
    Infomatrix(j+1,2)=Model;
    Infomatrix(j+1,3)=React;
    Infomatrix(j+1,4)=Meta;
end
c=num2cell(c);
Infomatrix(2:end,1)=c;
Infomatrix(1,2)={'Model'};
Infomatrix(1,3)={'React'};
Infomatrix(1,4)={'Meta'};



end

