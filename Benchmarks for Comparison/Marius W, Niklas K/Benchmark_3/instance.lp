%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Grid size X: 6
%Grid size Y: 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.

%#const horizon=9.
%#const c_nr=2.

%init
init(object(node, 2), value(at, (2, 1))).
init(object(node, 8), value(at, (2, 2))).
init(object(node, 14), value(at, (2, 3))).
init(object(node, 20), value(at, (2, 4))).
init(object(node, 26), value(at, (2, 5))).
init(object(node, 3), value(at, (3, 1))).
init(object(node, 9), value(at, (3, 2))).
init(object(node, 27), value(at, (3, 5))).
init(object(node, 33), value(at, (3, 6))).
init(object(node, 4), value(at, (4, 1))).
init(object(node, 10), value(at, (4, 2))).
init(object(node, 16), value(at, (4, 3))).
init(object(node, 22), value(at, (4, 4))).
init(object(node, 28), value(at, (4, 5))).
init(object(node, 34), value(at, (4, 6))).
init(object(node, 29), value(at, (5, 5))).
init(object(node, 35), value(at, (5, 6))).
init(object(node, 6), value(at, (6, 1))).
init(object(node, 12), value(at, (6, 2))).
init(object(node, 18), value(at, (6, 3))).
init(object(node, 24), value(at, (6, 4))).
init(object(node, 30), value(at, (6, 5))).
init(object(node, 36), value(at, (6, 6))).
init(object(node, 7), value(at, (1, 2))).
init(object(node, 13), value(at, (1, 3))).
init(object(node, 19), value(at, (1, 4))).
init(object(node, 25), value(at, (1, 5))).
init(object(node, 31), value(at, (1, 6))).
init(object(node, 1), value(at, (1, 1))).
init(object(node, 32), value(at, (2, 6))).
init(object(highway, 31), value(at, (1, 6))).
init(object(highway, 32), value(at, (2, 6))).
init(object(highway, 26), value(at, (2, 5))).
init(object(highway, 20), value(at, (2, 4))).
init(object(highway, 19), value(at, (1, 4))).
init(object(highway, 13), value(at, (1, 3))).
init(object(highway, 7), value(at, (1, 2))).
init(object(highway, 8), value(at, (2, 2))).
init(object(highway, 14), value(at, (2, 3))).
init(object(highway, 2), value(at, (2, 1))).
init(object(highway, 3), value(at, (3, 1))).
init(object(highway, 9), value(at, (3, 2))).
init(object(highway, 27), value(at, (3, 5))).
init(object(highway, 33), value(at, (3, 6))).
init(object(highway, 28), value(at, (4, 5))).
init(object(highway, 29), value(at, (5, 5))).
init(object(highway, 35), value(at, (5, 6))).
init(object(highway, 36), value(at, (6, 6))).
init(object(highway, 30), value(at, (6, 5))).
init(object(highway, 24), value(at, (6, 4))).
init(object(highway, 18), value(at, (6, 3))).
init(object(highway, 16), value(at, (4, 3))).
init(object(highway, 12), value(at, (6, 2))).
init(object(robot,1), value(at,(4,4))).
init(object(robot,1), value(max_energy,0)).
init(object(robot,1), value(energy,0)).
init(object(robot,2), value(at,(4,2))).
init(object(robot,2), value(max_energy,0)).
init(object(robot,2), value(energy,0)).
init(object(robot,3), value(at,(6,1))).
init(object(robot,3), value(max_energy,0)).
init(object(robot,3), value(energy,0)).
init(object(pickingStation,1), value(at,(1,1))).
init(object(shelf,1), value(at,(4,1))).
init(object(product,1),value(on,(1,1))).
init(object(shelf,2), value(at,(4,6))).
init(object(product,2),value(on,(2,1))).
init(object(shelf,3), value(at,(1,5))).
init(object(product,3),value(on,(3,1))).
init(object(order,1),value(pickingStation,1)).
init(object(order,1),value(line,(1,1))).
init(object(order,2),value(pickingStation,1)).
init(object(order,2),value(line,(2,1))).
init(object(order,3),value(pickingStation,1)).
init(object(order,3),value(line,(3,1))).