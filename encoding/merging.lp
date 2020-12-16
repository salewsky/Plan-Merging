#include "./input.lp".
%time(1..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X|+|Y|!=2.
nextto((X,Y),(DX,DY),(X',Y')) :- direction((DX,DY)), position((X,Y)), position((X',Y')), (X',Y')=(X+DX,Y+DY).
								 
% Rename occurs/3 to move/3 ---------------------------------------------------------------------------------------------------------------
move(R,D,T) :- occurs(object(robot,R),action(move,D),T).	

% Define position -------------------------------------------------------------------------------------------------------------------------
position(R,C,0) :- position(robot(R),C,0).
position(R,C,T) :- move(R,D,T), not new_move (R,_,T), position(R,C',T-1), nextto(C',D,C).
position(R,C,T) :- new_move(R,D,T), position(R,C',T-1), nextto(C',D,C).
                :- new_move(R,D,T), position(R,C ,T-1), not nextto(C ,D,_).
								 

% Wait if two robots move to the same node ------------------------------------------------------------------------------------------------
wait(R2,T) :- move(R1,D1,T), move(R2,D2,T), position(R1,C1,T-1), position(R2,C2,T-1), nextto(C1,D1,C), nextto(C2,D2,C), R1<R2.
new_move(R,(0,0),T) :- wait(R,T).
new_move(R,D,T+1) :- wait(R,T'), move(R,D,T), T>=T'.


% Dodge if two robots switch nodes --------------------------------------------------------------------------------------------------------			  
dodge(R2,T) :- move(R1,D1,T), move(R2,D2,T), position(R1,C1,T-1), position(R2,C2,T-1), nextto(C1,D1,C2), nextto(C2,D2,C1), R1<R2.
new_move(R,(DX',DY'),T) :- dodge(R,T), move(R,(DX,DY),T), |DX|!=|DX'|, |DY|!=|DY'|, position(R,(X,Y),T-1), nextto((X,Y),(DX',DY'),(X',Y')), position(X',Y').

% Generate merged plan --------------------------------------------------------------------------------------------------------------------
new_occurs(object(robot,R),action(move,D),T) :- move(R,D,T), not new_move(R,_,T).
new_occurs(object(robot,R),action(move,D),T) :- new_move(R,D,T).
:- new_move(R,D1,T), new_move(R,D2,T), D1!=D2.


%#show new_occurs/3.
#show new_move/3.