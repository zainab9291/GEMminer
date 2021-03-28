%function [returnedID] = ExtractIDReference(excelFile)
excelFile='refrences for Yeastbook.xlsx';
t = readtable(excelFile);
%t = readtable('refrences for Yeastbook.xlsx')
[num,txt,raw] = xlsread(excelFile);
% txt
for i=1:numel(txt)
    i
str=txt{i};
%regexp(str, '\d{4}', 'match', 'once')
mystr=regexp(str, '\d{4}\s|\d{4}[a-z]{1}', 'split');
mystr=mystr{2};
%mystr=regexp(mystr,'\.\sJ\.', 'split');
mystr=regexp(mystr,'\.\s(.*)', 'split');
mystr=mystr{1};
[ returnedID ] = myQueryID(mystr);
returnedID
k=numel(returnedID);
if k==0
    returnedID=0;
end
if k>1
    returnedID=returnedID(k);
end
finalIDs(i)= returnedID;
end
%B = finalIDs(finalIDs~=0)
%the above statment to remove zeros
%find(~finalIDs)
%returnedID
% regexp(str, '\d{4}\s\w+.J.', 'match', 'once')
% regexp(str, '\d{4}\s\w+.j.', 'match', 'once')
% regexp(str, '\d{4}\s\w+', 'match', 'once')
% regexp(str, '\d{4}\s\w+', 'match',)
% regexp(str, '\d{4}\s\w+', 'match')
% regexp(str, '\d{4}(\w*).', 'match')
% regexp(str, '\d{4}\s(\w*).', 'match')
% regexp(str, '\d{4}\s\w+', 'match', 'once')
% regexp(str, '\d{4}\s\w*', 'match', 'once')
% clc
% Sentences=regexp(str,'\.','split');
% Index=cellfun(@isempty,strfind(Sentences,'Matlab'));
% FoundSentences=Sentences(~Index);