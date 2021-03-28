function [ filterSen,indexx ] = myfilterSen1(filterWord,allabs)
%filterWord='Km';

[SenI] = mySenI(allabs);
filterSen={''};
indexx={''};
for i=1:numel(SenI)
    if ~iscell(SenI{i})
          SenI{i}={SenI(i)};
    end
    for j=1:numel(SenI{i})
%         i
%         j
      %parm=[filterWord '\s'] ;
      parm = filterWord;
      %flag=strfind(SenI{i}{j},filterWord);
      flag=regexp(SenI{i}{j},parm);
      %flag is empty if there is no wanted word in sentences sen{i}{j}
      if iscell(flag)
      flag=cell2mat(flag);
      end
      if ~isempty(flag)
          indexx{i}=i;
          %index to know which abstract id 
          filterSen{i}=SenI{i}{j};
%           targetSen=SenI{i}{j};
%           k=regexp(targetSen,parm,'match');
%           kj=k{1};
%           %to remove cell
%           targetSen=strrep(targetSen,kj,['<span>' (kj) '</span>']);
%           filterSen{i}=targetSen;
      end
    end
end
filterSen=filterSen(~cellfun('isempty',filterSen));
%this line for remove empty cell
indexx=indexx(~cellfun('isempty',indexx));
