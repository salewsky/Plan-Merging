% Input
#include "./input.lp".

% Move actions
#include "./action-M.lp".

% Goal
#include "./goal.lp".

% Output
occurs(object(robot,R), action(move,D),     T) :-    move(robot(R),D,T).
#show occurs/3.

