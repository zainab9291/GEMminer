fid = fopen('tryfilter.txt');
c= textscan(fid, '%s');
fclose(fid);
a=c{:};
for i=1:numel(a)
[ filterSen{i},indexx{i}] = myfilterSen1(a{i},allabs);
end