time(1..horizon).

% ----------------- Prerequisites --------------------------------------------------------------------

%get every initialized node
node(X,Y) :- init(object(node,_), value(at, (X,Y))).

%get start positions
planned_position(R,(X,Y),0) :- init(object(robot, R), value(at, (X, Y))).

%generate every position a robot has at a given time
planned_position(R,(X+DX,Y+DY),T) :- occurs(object(robot,R),action(move,(DX,DY)),T), planned_position(R,(X,Y),T-1).

r_time(R,T_max-1) :- T_max = #sum{1,T:planned_position(R,_,T)}, planned_position(R,_,0).
max_time(T_max) :- T_max = #max{T:r_time(R,T)}.

artificial_position(R,(X,Y),T+1) :- r_time(R,T'), planned_position(R,(X,Y),T'), max_time(T_max), time(T), T>=T', T<T_max. 

initial_position(R,(X,Y),T) :- planned_position(R,(X,Y),T).
initial_position(R,(X,Y),T) :- artificial_position(R,(X,Y),T).

goal_node(R,(X,Y)) :- init(object(shelf,R),value(at,(X,Y))).

% ----------------- Conflict Detection ---------------------------------------------------------------

%generate a vertex conflict (robots try to access the same square) for every robot who's part of the conflict
conflict(R,T) :- initial_position(R,(X,Y),T), initial_position(R',(X,Y),T), R!=R'.

%generate a edge conflict (robots try to cross over each other) for every robot who's part of the conflict
conflict(R,T) :- initial_position(R,(X,Y),T-1), initial_position(R,(X',Y'),T), initial_position(R',(X',Y'),T-1), initial_position(R',(X,Y),T), R!=R'.

first_conflict(R,T_min) :- T_min = #min{T:conflict(R,T)}, initial_position(R,_,0), T_min!=#sup.

% ----------------- Change Time Generation -----------------------------------------------------------

before(B) :- B=0..T_min-1, T_min = #min{T:first_conflict(_,T)}, T_min!=#sup.
after(R,A) :- A=0..horizon-T_max, r_time(R,T_max), first_conflict(R,_).

1{window(R,B,A) : before(B), after(R,A)}1 :- first_conflict(R,_).

change_time(R,T') :- first_conflict(R,T_min), T'=T_min-B..T_min+A, window(R,B,A), T'>0, T'<=horizon. 


% ----------------- Copy Moves -----------------------------------------------------------------------

position(R,(X,Y),T) :- initial_position(R,(X,Y),T), window(_,B,_), first_conflict(R,T_min), T<T_min-B.

position(R,(X,Y),T+A) :- initial_position(R,(X,Y),T), window(R,_,A), first_conflict(R,T_min), T>T_min, r_time(R,T_max), T<=T_max.

position(R,(X,Y),T') :- initial_position(R,(X,Y),T), r_time(R,T), time(T'), T'>T+A, T'<=horizon , window(R,_,A).

position(R,(X,Y),T) :- initial_position(R,(X,Y),T), not change_time(R,_).

% ----------------- Move Generation ------------------------------------------------------------------

adj_node(R,(X+DX,Y+DY),T) :- change_time(R,T+1), position(R,(X,Y),T), node(X+DX,Y+DY), DX=-1..1, DY=-1..1, 1{|DX+DY| == 1;(DX,DY) == (0,0)}1, T<horizon.
1{position(R,(X,Y),T+1) : adj_node(R,(X,Y),T)}1 :- adj_node(R,_,T).

% ----------------- Constraints ----------------------------------------------------------------------

:- position(R,(X,Y),T_max), position(R,(X',Y'),T_max+1), T_max = #max{T:change_time(R,T)}, DX=X'-X, DY=Y'-Y, |DX|+|DY| >= 2.
:- position(R,(X,Y),T), position(R,(X',Y'),T+1), time(T), DX=X'-X, DY=Y'-Y, |DX|+|DY| >= 2.
:- position(R,(X,Y),T), position(R',(X,Y),T), R!=R'.
:- position(R,(X,Y),T-1), position(R,(X',Y'),T), position(R',(X',Y'),T-1), position(R',(X,Y),T), R!=R'.
:- position(R,(X,Y),horizon), goal_node(R,(X',Y')), (X,Y) != (X',Y').
:- position(R,(X,Y),T), T>horizon.

#minimize {1@1,T:change_time(R,T)}.

% ----------------- Output --------------------------------------------------------------------------

occurs'(object(robot,R),action(move,(X'-X,Y'-Y)),T+1) :- position(R,(X,Y),T), position(R,(X',Y'),T+1).

#show occurs'/3.