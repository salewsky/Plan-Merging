#include "./input.lp".
%time(1..horizon).
conflict_nr(0..c_nr).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X|+|Y|!=2.
nextto((X,Y),(DX,DY),(X',Y')) :- direction((DX,DY)), position((X,Y)), position((X',Y')), (X',Y')=(X+DX,Y+DY).
								 
% Rename occurs/3 to move/4 ---------------------------------------------------------------------------------------------------------------
move(R,D,T,0) :- occurs(object(robot,R),action(move,D),T).	

% Define position -------------------------------------------------------------------------------------------------------------------------
position(R,C,0,0) :- position(robot(R),C,0).
position(R,C,T,A) :- move(R,D,T,A), position(R,C',T-1,A), conflict_nr(A), nextto(C',D,C).
                  :- move(R,D,T,A), position(R,C ,T-1,A), conflict_nr(A), not nextto(C ,D,_).
%position(R,C,T,A) :- position(R,C,T-1,A), not move(R,_,T,A), conflict_nr(A).
								 

% Wait if two robots move to the same node ------------------------------------------------------------------------------------------------
wait(R2,T,A)            :- move(R1,D1,T,A), move(R2,D2,T,A), position(R1,C1,T-1,A), position(R2,C2,T-1,A), conflict_nr(A), 
					     nextto(C1,D1,C), nextto(C2,D2,C), R1<R2.
move(R,(0,0),T,A+1)     :- wait(R,T,A).
position(R',C,T-1,A+1)  :- wait(R,T,A), position(R',C,T-1,A), isRobot(robot(R')).
move(R,D,T'+1,A+1)      :- wait(R,T,A), move(R,D,T',A), T'>=T.
move(R',D,T',A+1)       :- wait(R,T,A), move(R',D,T',A), R'!=R, T'>=T.


% Dodge if two robots switch nodes --------------------------------------------------------------------------------------------------------			  
dodge(R2,T,A) 		   :- move(R1,D1,T,A), move(R2,D2,T,A), position(R1,C1,T-1,A), position(R2,C2,T-1,A), conflict_nr(A), 
	                      nextto(C1,D1,C2), nextto(C2,D2,C1), R1<R2.
position(R',C,T-1,A+1) :- dodge(R,T,A), position(R',C,T-1,A), isRobot(robot(R')). 
move(R,D,T'+2,A+1)     :- dodge(R,T,A), move(R,D,T',A), T'>T.
move(R',D,T',A+1)      :- dodge(R,T,A), move(R',D,T',A), R'!=R, T'>=T.

1{move(R,D',T,A+1) : direction(D'), D'!=D, nextto(C,D',C')}1    :- dodge(R,T,A), move(R,D,T,A), position(R,C,T-1,A).
move(R,D,T+1,A+1)   	  :- dodge(R,T,A), move(R,D,T,A).
move(R,(DX',DY'),T+2,A+1) :- dodge(R,T,A), move(R,(DX,DY),T,A+1), direction((DX',DY')), DX'=-DX, DY'=-DY.

% Generate merged plan --------------------------------------------------------------------------------------------------------------------
% This does not work! 
new_move(R,D,T) :- move(R,D,T,A), not move(R,_,T,B), B>A, conflict_nr(B).
new_occurs(object(robot,R),action(move,D),T) :- new_move(R,D,T).

% Output ----------------------------------------------------------------------------------------------------------------------------------
%#show new_occurs/3.

% Debugging -------------------------------------------------------------------------------------------------------------------------------
%c_nr = 3
%#show move/4.

%Conflict 0: 
%move(1,(-1,0),1,0). move(1,(-1,0),2,0). move(1,(-1,0),3,0).
%move(2,(1,0),1,0). move(2,(1,0),2,0). move(2,(1,0),3,0). 

%Conflict 1:
%move(1,(-1,0),1,1). move(1,(-1,0),2,1). move(1,(-1,0),3,1). 
%move(2,(0,0),1,1). move(2,(1,0),2,1). move(2,(1,0),3,1). move(2,(1,0),4,1).

%Conflict 2:
%move(1,(-1,0),2,2). move(1,(-1,0),3,2). 
%move(2,(0,-1),2,2). move(2,(1,0),3,2). move(2,(0,1),4,2). move(2,(1,0),5,2). move(2,(1,0),6,2).  


#show new_move/3.
%Timestep 1:
%new_move(1,(-1,0),1).
%new_move(2,(1,0),1). 
%new_move(2,(0,0),1). 

%Timestep 2:
%new_move(1,(-1,0),2).
%new_move(2,(1,0),2). 
%new_move(2,(0,-1),2).

%Timestep 3:
%new_move(1,(-1,0),3).
%new_move(2,(1,0),3).

%Timestep 4:
%new_move(2,(1,0),4). 
%new_move(2,(0,1),4).

%Timestep 5,6:
%new_move(2,(1,0),5). 
%new_move(2,(1,0),6).
 