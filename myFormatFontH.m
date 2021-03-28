
function StParag=myFormatFontH(FileNam,Parag)
%FileNam='tryfilter.txt';
fid = fopen(FileNam);
mm=Parag;
c= textscan(fid, '%s');
fclose(fid);
a=c{:};
ht ={''};
for i=1:numel(a)
htt=regexp(a{i},'\|','split');
ht=[ht htt];
end
ht=ht(~cellfun('isempty',ht));
% for k=1:numel(ht)
% % newht=regexp(Parag,ht{k},'match');
%newht=newht{1};
%  %to remove cell
%zht(k)=newht
% end
%zht=zht(~cellfun('isempty',zht));
for j=1:numel(ht)
mm=strrep(mm,ht{j},['<span>' [ht{j}] '</span>']);
end
StParag=mm;