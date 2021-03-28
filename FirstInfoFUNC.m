function [ Infomatrix] = FirstInfoFUNC()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
filename='impoData.xlsx';
% the following statments is working on excel file to extract the union of
% words from all abstracts in all IDs
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
Infomatrix=c;


end

