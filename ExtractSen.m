function [sen] = ExtractSen( my_text )
%take the text and return it's  sentences  
aa=my_text{:};
s={''};
ii=regexp(my_text,'\.[\s]*[A-Z]');
if isempty(ii{:})
sen=aa;
else

ind=ii{:};
for i=1:length(ind)-1
    s(i+1)=cellstr(aa((ind(i)+1):ind(i+1)));
end
s(1)=cellstr(aa(1:ind(1)));
%numel(s)
s(numel(s)+1)=cellstr(aa((ind(numel(s))+1):end));

sen=s;
end
end

