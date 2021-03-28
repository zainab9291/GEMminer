h=regexp(k,'title {\s*\.*name "','split');
s1=regexp(h{2},'."','split');
s1{1}
year1=unique(regexp(k,'year \d+','match'))