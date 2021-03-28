fptr=fopen('paragView.txt','w')
for i=1:numel(matches)
%     if ~iscell(sen1{i})
%           sen1{i}={sen1(i)};
%     end
%     for j=1:numel(sen1{i})
%         i
%         j
        
    fprintf(fptr,'>paragraph num %d is \n%s\n\n',i,matches{i})
%     end
end
fclose(fptr)