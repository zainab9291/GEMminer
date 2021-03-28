function [finvar] = UNnestloop( varCell )
% myf={''};
% for k=1:numel(varCell)
%     k
% if numel(varCell{k})>1
%     myf=varCell{k};
%     [finvar] = UNnestloop( myf );
% end
%  
% asd{k}=vertcat(varCell{k}{:});
% asd=asd(~cellfun('isempty',asd));
% if ~isempty(asd)
% for m=1:numel(asd{k})
% finvar{k,m}=asd{k}{m};
% end
% end
% end
% finvar=asd;
asd={''};
for k=1:numel(varCell)
    k
    for m=1:numel(varCell{k})
  asd(k)=varCell{k,m};
    end
end
 



