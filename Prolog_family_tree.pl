male(george).
male(spencer).
male(philip).
male(charles).
male(mark).
male(andrew).
male(edward).
male(william).
male(harry).
male(peter).


female(mum).
female(kydd).
female(elizabeth).
female(margaret).
female(diana).
female(anne).
female(sarah).
female(zara).
female(beatrice).
female(eugenie).



parent(george,elizabeth).
parent(george,margaret).
parent(mum,elizabeth).
parent(mum,margareth).
parent(spencer,diana).
parent(kydd,diana).
parent(elizabeth,charles).
parent(elizabeth,anne).
parent(elizabeth,andrew).
parent(elizabeth,edward).
parent(philip,charles).
parent(philip,anne).
parent(philip,andrew).
parent(philip,edward).
parent(diana,william).
parent(diana,harry).
parent(charles,william).
parent(charles,harry).
parent(anne,peter).
parent(anne,zara).
parent(mark,peter).
parent(mark,zara).
parent(andrew,beatrice).
parent(andrew,eugenie).
parent(sarah,beatrice).
parent(sarah,eugenie).


father(X,Y):- parent(Y,X),male(Y).
mother(X,Y):- parent(X,Y),female(X).

son(X,Y) :- male(X),parent(Y,X).
daughter(X,Y) :- female(X),parent(Y,X).

sister(X,Y):-parent(Z,X),parent(Z,Y),female(X),X\==Y.
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\==Y.

husband(X,Y):-parent(X,Z),parent(Y,Z),male(X),female(Y).
wife(X,Y):-parent(X,Z),parent(Y,Z),female(X),male(Y).

aunt(X,Y) :- parent(Z,Y), sister(X,Z),female(X). 
uncle(X,Y) :- parent(Z,Y), brother(X,Z),male(X). 

grandchild(X,Y):-parent(Z,X),parent(Y,Z).
greatGarandParent(X,Y):- parents(X,Z),parents(Z,W),parents(W,Y).
greatgrandparent(X,Y) :- parent(X,D), parent(D,F), parent(F,Y).

fatherinlaw(X,Y):-father(X,Z),wife(Y,Z),husband(Y,Z).
motherinlaw(X,Y):-mother(X,Z),wife(Y,Z),husband(Y,Z).

brotherinlaw(X,Y):- husband(Y,Z),brother(X,Z);wife(Y,Z),brother(X,Z).
sisterinlaw(X,Y):- husband(Y,Z),sister(X,Z);wife(Y,Z),sister(X,Z).

firstCousin(X,Y):-parent(Z1,X),parent(Z2,Y),parent(Z,Z1),parent(Z,Z2).


