memberRem(X,[],[]).
memberRem(X,[X|Xs],Ans) :- memberRem(X,Xs,Ans), !.
memberRem(X,[Y|Xs],[Y|Ans]) :- memberRem(X,Xs,Ans).
