#include "./input.lp".
time(1..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
nextto((X,Y),(DX,DY),(X',Y')) :- direction((DX,DY)), position((X,Y)), position((X',Y')),
                                 (X,Y)=(X'-DX,Y'-DY), (X',Y')=(X+DX,Y+DY).
position(robot(R),C,T) :- occurs(object(robot,R),action(move,D),T), position(robot(R),C',T-1), nextto(C',D,C).

% Wait if two robots move to the same node ------------------------------------------------------------------------------------------------
wait(R2,T) :- occurs(object(robot,R1),action(move,D1), T), occurs(object(robot,R2),action(move,D2),T), 
			  position(robot(R1),C1,T-1), position(robot(R2),C2,T-1), nextto(C1,D1,C), nextto(C2,D2,C), R1<R2.
occur(object(robot,R),action(move,(0,0)),T) :- wait(R,T).
occur(object(robot,R),action(move,D),T+1) :- wait(R,T'), occurs(object(robot,R),action(move,D),T), T>T'.


% Dodge if two robots switch nodes --------------------------------------------------------------------------------------------------------			  
dodge(R2,T) :- occurs(object(robot,R1),action(move,D1), T), occurs(object(robot,R2),action(move,D2), T), position(robot(R1),C1,T-1), 
			   position(robot(R2),C2,T-1), nextto(C1,D1,C2), nextto(C2,D2,C1), R1<R2.
occur(object(robot,R),action(move,(DX',DY')),T) :- occurs(object(robot,R),action(move,(DX,DY)), T), |DX|!=DX', |DY|!=DY', position(robot(R),(X,Y),T-1),
												   nextto((X,Y),(DX',DY'),(X',Y')), position(X',Y').

% Generate merged plan --------------------------------------------------------------------------------------------------------------------
new_occurs(object(robot,R),action(move,D),T) :- occurs(object(robot,R),action(move,D),T), not occur(object(robot,R),action(move,_),T).
new_occurs(object(robot,R),action(move,D),T) :- occur(object(robot,R),action(move,D),T).

#show new_occurs/3.