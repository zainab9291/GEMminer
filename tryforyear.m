%tryforyear
c='';
for i=1:numel(filterSen)
    i
    myfid=myfinAbstractList.ID(indexx{i});
[paper_year] = DetYear(myfid{:});
paper_year
if paper_year < 2014
c(i)=myfid;
end
end