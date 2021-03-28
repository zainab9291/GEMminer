function [ sen1 ] = collectSen( allabs )
%collect oll sentences from all abstracts
for i=1:numel(allabs)
sen1{i}= ExtractSen(allabs(i));
i
end


end

