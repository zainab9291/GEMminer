
function [fptr,FinInd] = FilOut_File(FileNam,filterSen,indexx,existFilter)
%fptr=fopen('my_out.txt','w');
fptr=fopen(FileNam,'w');
for i=1:length(filterSen)
    for j=1:length(filterSen{i})
        fprintf(fptr,'>sen %d from filter %s and from paper %d\n%s\n\n',j,existFilter{i},indexx{i}{j},filterSen{i}{j});
        filInd(i,j)=indexx{i}{j};
    end
end
fclose(fptr)
imp=find(filInd);
for s=1:length(imp)
    FinInd(s)=filInd(imp(s));
end

%FilOut.IND=FinInd;