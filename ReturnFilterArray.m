function [OutFilter]=ReturnFilterArray(Parag,myfiler)
cc=Parag;
hh=myfiler;
%cell array of paragraphs
%cell array of our filter words
for k=1:numel(cc)
    for n=1:numel(hh)
        ff=regexp(cc{k},hh{n});
        if ~isempty(ff)
        hhh{k}=hh{n};
        end
    end
end
OutFilter=hhh;