sublist(0,_,[[]]).
sublist(Size,[],[]).
sublist(Size,[Head|Tail],Ans) :- NextSize is Size-1,
                                 sublist(NextSize,Tail,SubAns1),
                                 predList(Head,SubAns1,SubAns2),
                                 sublist(Size,Tail,SubAns3),
                                 append(SubAns2,SubAns3, Ans).
                                 
% Takes in a number and a list of lists and prefixes all of them to have the number
predList(Pred,[],[]).
predList(Pred,[L1|Rest],[[Pred|L1]|Z]) :- predList(Pred,Rest,Z).

question17(Ans) :- numlist(1,40,L),
                    sublist(10,L,SubLists).

matches([], []).
matches([[2,X,4,Y,Z|List]|Lists], [2,X,4,Y,Z|List]) :- 16 is X+Y+Z.
matches([_|Lists], Ans) :- matches(Lists,Ans).
