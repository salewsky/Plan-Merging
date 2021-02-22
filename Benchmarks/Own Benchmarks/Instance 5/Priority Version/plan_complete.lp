occurs(object(robot,3),action(move,(0,-1)),1). occurs(object(robot,2),action(move,(0,1)),1). occurs(object(robot,1),action(move,(0,1)),2). occurs(object(robot,4),action(move,(0,-1)),2). occurs(object(robot,4),action(move,(1,0)),1). occurs(object(robot,1),action(move,(1,0)),1). occurs(object(robot,1),action(move,(-1,0)),3). occurs(object(robot,4),action(move,(-1,0)),3). occurs(object(robot,2),action(move,(1,0)),2). occurs(object(robot,2),action(move,(-1,0)),3).

%priority(1,2).
%priority(2,1).
%priority(3,3).
%priority(4,0).
%horizon = 4
%c_nr = 3
%Time         : 0.348s (Solving: 0.03s 1st Model: 0.01s Unsat: 0.02s)
%CPU Time     : 0.313s