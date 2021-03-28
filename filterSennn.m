%function [ filterSen ] = myfilterSen(filterWord)
filterWord='Kinetics';
myfilterSen={''};
indexx={''};
for i=1:numel(sen2)
    if ~iscell(sen2{i})
          sen2{i}={sen2(i)};
    end
    for j=1:numel(sen2{i})
        i
        j
        
      flag=strfind(sen2{i}{j},filterWord);
      %flag is empty if there is no wanted word in sentences sen{i}{j}
      if iscell(flag)
      flag=cell2mat(flag);
      end
      if ~isempty(flag)
          indexx{i}=i;
          %index to know which abstract id 
          myfilterSen{i}=sen2{i}{j};
      end
    end
end
myfilterSen=myfilterSen(~cellfun('isempty',myfilterSen));
indexx=indexx(~cellfun('isempty',indexx));
%this line for remove empty cell