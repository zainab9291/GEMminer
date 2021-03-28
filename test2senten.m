 l=string(myfinAbstractList.Abstract);
 sen = regexp(l,'\S.*?[\.\!\?]','match'); 
 %----> best one
%  sentences1 = regexp(l,'[\.\!\?]\s*','split');
%  SplitString=regexp(text,'[\.?!,]','split');

f=sen(1);
%cac = regexp( f{:}, '\d++');
cac=regexp( f{:}, '\s(\d++|\d++%|\d++.\d+|\d++.\d+%)\s');
myindex=~cellfun('isempty',cac);
myindex=find(myindex);
k=f{:};
mysen=k(myindex);
mysen{:}

 
