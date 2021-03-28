
function [filterParag,indexxp,existFilter] = Filter_File_Parag( FileNam ,Parag)
%take any filter words in txt file and make filter on  Open source full paper sentences
% make filter in the sentences 
%thia main for myfilterParag
%   b
%fid = fopen('tryfilter.txt');
fid = fopen(FileNam);
c= textscan(fid, '%s');
fclose(fid);
a=c{:};
for i=1:numel(a)
[ filterParag{i},indexxp{i}] = myfilterParag(a{i},Parag);
end
% filterSen
e=find(~cellfun(@isempty,filterParag));
if isempty(e)
    existFilter={''};
end
for k=1:numel(e)
    existFilter(k)=a(e(k));
end
filterParag=filterParag(~cellfun('isempty',filterParag));
if isempty(filterParag)
    filterParag={''};
end
indexxp=indexxp(~cellfun('isempty',indexxp));
if isempty(indexxp)
    indexxp={''};
end
            