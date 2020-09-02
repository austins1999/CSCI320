%1) Fibonacci sequence  fib(N,FN)
fib(1,1).
fib(2,1).
fib(N,FN) :- N>2, N1 is N-1, N2 is N-2, fib(N1,FN1), fib(N2,FN2), FN is FN1+FN2.


%2) Ackermann function  ack(X,Y,A)
ack(0,Y,A) :- A is Y+1.
ack(X,0,A) :- X1 is X-1, ack(X1,1,A).
ack(X,Y,A) :- Y1 is Y-1, X1 is X-1, ack(X,Y1,A1), ack(X1,A1,A).


%3) Mergesort           mergesort(List,MSorted)
mergesort([],[]).
mergesort([H],[H]).
mergesort([H1,H2],[H1,H2]) :- H1=<H2.
mergesort([H1,H2],[H2,H1]) :- H1>H2.
mergesort(List,MSorted) :- half(List,Half1,Half2), mergesort(Half1,Half1Sorted),
                            mergesort(Half2,Half2Sorted), merge(Half1Sorted,Half2Sorted,MSorted).

  %Helpers
  half(List,Half1,Half2) :- length(List,Len), Mid is Len//2, split(List,Half1,Half2,Mid).

  split(List,[],List,0).
  split([H|T],[H|T2],Half2,Mid) :- TempMid is Mid-1, split(T,T2,Half2,TempMid).

  merge(List,[],List).
  merge([],List,List).
  merge([H1|T1],[H2|T2],MSorted) :- H1=<H2, merge(T1,[H2|T2],TempSorted), MSorted=[H1|TempSorted].
  merge([H1|T1],[H2|T2],MSorted) :- H1>H2, merge(T2,[H1|T1],TempSorted), MSorted=[H2|TempSorted].


%4) Binary Tree
%tree([a,[b,[],[c,[],[]]],[d,[],[e,[f,[],[]],[]]]]).  Copied for testing purposes
  %a) tree(Tree)
  tree([]).
  tree([Atom,LTree,RTree]) :- element([Atom]), tree(LTree), tree(RTree).
  tree([Atom,LTree,RTree]) :- element([Atom]), element(LTree), tree(RTree).
  tree([Atom,LTree,RTree]) :- element([Atom]), tree(LTree), element(RTree).
  tree([Atom,LTree,RTree]) :- element([Atom]), element(LTree), element(RTree).

    %Helper
    element([_]).

  %b) preorder(Tree,PreorderList)
  preorder([],[]).
  preorder([Atom,LTree,RTree],PreorderList) :- preorder(LTree,LSorted), preorder(RTree,RSorted),
                                               append([Atom|LSorted],RSorted,PreorderList).
