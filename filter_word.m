function fword=filter_word(word)
List={'a','an','the','for','is','in','on','from','at','are','of','to','by','with',...
    'here','this','the','was','we','how','Here','This','The','Was','We'};
index=find(ismember(List,word));
if numel(index)==0
  fword=word;
else
 fword='';
end
