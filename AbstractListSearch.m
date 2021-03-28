function [ myoutAbstract] = AbstractListSearch( myfinAbstractList,AbstractID )
%AbstractListSearch takes abstract id and download the paper of this id 
%   then return abstract

%[ myfinAbstractList ] = AbstractListBuild1( resultID ,stepnum );
fin=myfinAbstractList.Abstract(find(ismember(myfinAbstractList.ID,AbstractID)));
myoutAbstract=fin;



end

