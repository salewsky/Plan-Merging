% Formatting input
#include "./input.lp".

% Generating Plan
#include "./action.lp".

% Defining Goal
#include "./goal.lp".

% Defining Output
occurs(object(robot,R),action(move,D),T) :- move(robot(R),D,T).
#show occurs/3.