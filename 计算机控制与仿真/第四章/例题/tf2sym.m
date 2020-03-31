function P=tf2sym(G)
P=poly2sym(G.num{1},'s')/poly2sym(G.den{1},'s');
    
