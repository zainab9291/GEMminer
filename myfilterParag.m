function [ filterParag,indexx ] = myfilterParag(filterWord,parag)
filterParag={''};
indexx={''};
%FILTER Paragraphs from full paper
for i=1:numel(parag)
%         i
%         j
      parm=[filterWord '\s']  ;
      %flag=strfind(SenI{i}{j},filterWord);
      flag=regexp(parag{i},parm);
      %flag is empty if there is no wanted word in sentences sen{i}{j}
      if iscell(flag)
      flag=cell2mat(flag);
      end
      if ~isempty(flag)
          indexx{i}=i;
          %index to know which abstract id 
          filterParag{i}=parag{i};
%           targetParag=parag{i};
%           k=regexp(targetParag,parm,'match');
%           kj=k{1};
%           %to remove cell
%           targetParag=strrep(targetParag,kj,['<span>' (kj) '</span>']);
%           filterParag{i}=targetParag;
      end
      filterParag=filterParag(~cellfun('isempty',filterParag));
%this line for remove empty cell
indexx=indexx(~cellfun('isempty',indexx));
      
end
