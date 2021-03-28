function [ allSen ] = mySen(allabs)
%mySen take all abstracts then return sentences contain numbers

l=string(allabs);
 sen = regexp(l,'\S.*?[\.\!\?]','match');
 allSen={''};
 for i=1:length(sen)
 f=sen(i);
%cac = regexp( f{:}, '\d++');
cac=regexp( f{:}, '\s(\d++|\d++%|\d++.\d+|\d++.\d+%)\s');
%i
%cac{:}
if ~iscell(cac)
cac={cac};
end
myindex=~cellfun('isempty',cac);
myindex=find(myindex);
k=f{:};
mysen=k(myindex);
allSen=[mysen allSen];
 end

end

