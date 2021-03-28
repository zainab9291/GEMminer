function fword=remove_Symbols(word)

fword=strrep(word,')','');
fword=strrep(fword,'(','');
fword=strrep(fword,'"','');
fword=strrep(fword,'''','');

