mergeSort([],[]) :- !.
mergeSort([X|[]],[X]) :- !.
mergeSort(List,Ans) :- split(List,Left,Right),
                      mergeSort(Left,LeftAns),
                      mergeSort(Right, RightAns),
                      merge(LeftAns,RightAns,Ans).

merge([],[],[]) :- !.
merge([L|Left], [], [L|Ans]) :- merge(Left,[],Ans), !.
merge([],[R|Right],[R|Ans]) :- merge([],Right,Ans), !.
merge([L|Left],[R|Right],[R|Ans]) :- L >= R, merge([L|Left],Right,Ans), !.
merge([L|Left],[R|Right],[L|Ans]) :- L < R, merge(Left,[R|Right],Ans), !.

split(List,Left,Right) :- append(Left,Right,List), length(Left, N), length(Right, N), !.
split(List,Left,Right) :- append(Left,Right,List),
                          length(Left,N),
                          RightSize is N+1,
                          length(Right,RightSize), !.
