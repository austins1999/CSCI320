%1) Find the length of a list
%   Using the format mylength(List,Len), where Len is the length
mylength([],0).
mylength([_|[]],1).
mylength([_|Tail],Len) :-  mylength(Tail,TailLen),Len is 1 + TailLen.


%2) Find the last element of a list
%   Using the format myLast(List,L), where L is the last element in the list
%   Assuming there is at least one element
mylast([Head|[]],Head).
mylast([_|Tail],Last) :- mylast(Tail,Last).


%3) Find the maximum of a list of integers
%   Using the format mymax(List,MaxVal), where MaxVal is the max value of the list
%   Assuming there is at least one element
mymax([],_,_).
mymax([Head|Tail],Val,Max) :- Head > Val, mymax(Tail,Head,Max).
mymax([_|Tail],Val,Max) :- mymax(Tail,Val,Max).
mymax([Head|Tail],Max) :-  mymax(Tail,Head,Max).


%4) Remove elements from a list
%   Using the format myRemove(X,List,RedList), where X is the element to remove from List,
%   and RedList is the resulting list
myRemove(X, [], RedList)
myRemove(X,[Head|Tail],RedList) :- Head = X, myRemove(X,Tail,TempList),RedList is TempList
myRemove(X,[Head|Tail],RedList) :- myRemove(X,Tail,TempList),RedList is Head + TempList



%5) Obtain the elements common to two lists
%   Using the format intersect(List1,List2,IntList), where List1 and List2 are given lists,
%   and intList is a list of their common elements
intersect(List1,List2,IntList)


%6) Obtain the union of two lists
%   Using the format union(List1,List2,UnionList), where List1 and List2 are given lists,
%   and UnionList contains the Elements of List1 and List2, but no duplicate Elements.
union(List1,List2,UnionList)


%7) Determine whether two lists are permutations
%   Using the format myPerm(List1,List2)
%   Which evaluates to true if List2 is a permutation of List1
myPerm(List1,List2)
