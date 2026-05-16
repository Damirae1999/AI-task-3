% CCS 2226 - Task 3: My Family Tree
% Grandparents -> Parents -> Children -> Grandchildren, with Uncles, Aunts & Cousins

% --- Gender ---
male(kirombe). male(gichohi). male(gichuhi). male(kamau).
male(waithaka). male(wamiti). male(ngumo).
female(wambui). female(mercy). female(nyambura). female(njeri).
female(ciku). female(thuku). female(shiro).

% --- Parent relationships ---
% Kirombe & Wambui's children (parents + uncles/aunts)
parent(kirombe, gichohi).  parent(wambui, gichohi).
parent(kirombe, nyambura). parent(wambui, nyambura).
parent(kirombe, waithaka). parent(wambui, waithaka).
parent(kirombe, wamiti).   parent(wambui, wamiti).
parent(kirombe, ciku).     parent(wambui, ciku).
parent(kirombe, thuku).    parent(wambui, thuku).

% Gichohi & Mercy's children
parent(gichohi, gichuhi). parent(mercy, gichuhi).
parent(gichohi, shiro).   parent(mercy, shiro).

% Nyambura's children (cousins to gichuhi & shiro)
parent(nyambura, njeri).
parent(nyambura, ngumo).

% Gichuhi's children (grandchildren)
parent(gichuhi, kamau).

% --- Rules ---
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
grandchild(X, Y)  :- grandparent(Y, X).
sibling(X, Y)     :- parent(P, X), parent(P, Y), X \== Y.
uncle(X, Y)       :- parent(P, Y), sibling(X, P), male(X).
aunt(X, Y)        :- parent(P, Y), sibling(X, P), female(X).
cousin(X, Y)      :- parent(PX, X), parent(PY, Y), sibling(PX, PY), X \== Y.

% --- Try these queries ---
% ?- grandparent(X, gichuhi).   -> kirombe, wambui
% ?- grandchild(X, kirombe).    -> gichuhi, shiro, njeri, ngumo, kamau
% ?- parent(X, gichuhi).        -> gichohi, mercy
% ?- uncle(X, gichuhi).         -> waithaka, wamiti
% ?- aunt(X, gichuhi).          -> ciku, thuku, nyambura
% ?- cousin(X, gichuhi).        -> njeri, ngumo
