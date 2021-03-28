fptr=fopen('a.txt','w')
for i=1:numel(allSen)
    fprintf(fptr,'>sen%d\n%s\n\n',i,cell2mat(allSen(i)))
end
fclose(fptr)