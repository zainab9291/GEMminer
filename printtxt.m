fptr=fopen('COat protein.txt','w')
for i=1:numel(sen1)
    if ~iscell(sen1{i})
          sen1{i}={sen1(i)};
    end
    for j=1:numel(sen1{i})
        i
        j
        
    fprintf(fptr,'>sen%d in abstract number %d\n%s\n\n',j,i,sen1{i}{j})
    end
end
fclose(fptr)