 function [AllParag,IDParags] = ExtractAllParag( myPMCID,AllIDpaper )
% extract all pragraphs from all pmc filtered URL
%main for extract paragraph

AllParag={''};
for i=1:numel(myPMCID)
     messag = sprintf('step number %d of %d',i,numel(myPMCID));
    disp(messag)
    [AllParag{i},IDParags{i}] = ExtractParag( myPMCID{i},AllIDpaper{i} );
    pause(3)
end