
function [filterSen,indexx,existFilter] = Filter_File( FileNam ,allabs )
%take any filter words in txt file and make filter on abstract sentences
% make filter in the sentences 
%thia main for myfilterSen1
%   b
%fid = fopen('tryfilter.txt');

fid = fopen(FileNam);
c = textscan(fid,'%s');
fclose(fid);
a=c{:};
%a=strrep(a, '+', ' ');
%to put filter in cell array
% ht ={''};
% for i=1:numel(a)
% htt=regexp(a{i},'\|','split');
% ht=[ht htt];
% end
% ht=ht(~cellfun('isempty',ht));
%---------------------------------
for i=1:numel(a)
[ filterSen{i},indexx{i}] = myfilterSen1(a{i},allabs);

end

ff={''};
bb={''};
for j=1:numel(filterSen)
f=vertcat(filterSen{j});
b=vertcat(indexx{j});
ff=[ff f];
bb=[bb b];
end

filterSen=ff;
indexx=bb;
% -----------------------
existFilter={''};
for k=1:numel(filterSen)
    for g=1:numel(a)
   flag=regexp(filterSen{k},a{g});
   if iscell(flag)
      flag=cell2mat(flag);
      end
      if ~isempty(flag)
    existFilter{k}=a{g};
      end
    end
end
%-------------------------------



% filterSen
% e=find(~cellfun(@isempty,filterSen))
% for k=1:numel(e)
%     existFilter(k)=a(e(k));
% end
filterSen=filterSen(~cellfun('isempty',filterSen));
indexx=indexx(~cellfun('isempty',indexx));
existFilter=existFilter(~cellfun('isempty',existFilter));
            