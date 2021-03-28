

%[a b data]=xlsread('CompExcl.xlsx')
level1=unique(data(:,1),'stable');
for i=1:numel(level1)
fprintf('%s\n',cell2mat(level1(i)));
Index=find(ismember(data(:,1),level1(i)));
for j=1:numel(Index)
fprintf('%s\n',cell2mat(data(Index(j),2)));

end
end