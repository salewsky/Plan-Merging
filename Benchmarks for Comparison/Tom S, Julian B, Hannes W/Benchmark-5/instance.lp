%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Grid size X: 5
%Grid size Y: 8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.

#const horizon=15

%init
init(object(node, 1), value(at, (1, 1))).
init(object(node, 2), value(at, (2, 1))).
init(object(node, 3), value(at, (4, 1))).
init(object(node, 4), value(at, (5, 1))).
init(object(node, 5), value(at, (1, 2))).
init(object(node, 6), value(at, (5, 2))).
init(object(node, 7), value(at, (1, 3))).
init(object(node, 8), value(at, (2, 3))).
init(object(node, 9), value(at, (3, 3))).
init(object(node, 10), value(at, (4, 3))).
init(object(node, 11), value(at, (5, 3))).
init(object(node, 12), value(at, (2, 4))).
init(object(node, 13), value(at, (3, 4))).
init(object(node, 14), value(at, (4, 4))).
init(object(node, 15), value(at, (1, 5))).
init(object(node, 16), value(at, (2, 5))).
init(object(node, 17), value(at, (4, 5))).
init(object(node, 18), value(at, (5, 5))).
init(object(node, 19), value(at, (1, 6))).
init(object(node, 20), value(at, (2, 6))).
init(object(node, 21), value(at, (3, 6))).
init(object(node, 22), value(at, (5, 6))).
init(object(node, 23), value(at, (1, 7))).
init(object(node, 24), value(at, (3, 7))).
init(object(node, 25), value(at, (4, 7))).
init(object(node, 26), value(at, (5, 7))).
init(object(node, 27), value(at, (1, 8))).
init(object(node, 28), value(at, (2, 8))).
init(object(node, 29), value(at, (3, 8))).
init(object(node, 30), value(at, (4, 8))).
init(object(node, 31), value(at, (5, 8))).
init(object(highway, 1), value(at, (1, 2))).
init(object(highway, 2), value(at, (5, 2))).
init(object(highway, 3), value(at, (1, 3))).
init(object(highway, 4), value(at, (2, 3))).
init(object(highway, 5), value(at, (3, 3))).
init(object(highway, 6), value(at, (4, 3))).
init(object(highway, 7), value(at, (5, 3))).
init(object(highway, 8), value(at, (2, 4))).
init(object(highway, 9), value(at, (3, 4))).
init(object(highway, 10), value(at, (4, 4))).
init(object(highway, 11), value(at, (1, 5))).
init(object(highway, 12), value(at, (2, 5))).
init(object(highway, 13), value(at, (4, 5))).
init(object(highway, 14), value(at, (5, 5))).
init(object(highway, 15), value(at, (1, 6))).
init(object(highway, 16), value(at, (2, 6))).
init(object(highway, 17), value(at, (3, 6))).
init(object(highway, 18), value(at, (5, 6))).
init(object(highway, 19), value(at, (1, 7))).
init(object(highway, 20), value(at, (3, 7))).
init(object(highway, 21), value(at, (4, 7))).
init(object(highway, 22), value(at, (5, 7))).
init(object(highway, 23), value(at, (1, 8))).
init(object(highway, 24), value(at, (2, 8))).
init(object(highway, 25), value(at, (4, 8))).
init(object(highway, 26), value(at, (5, 8))).
init(object(pickingStation,1), value(at,(3,8))).
init(object(robot,1), value(at,(1,8))).
init(object(robot,2), value(at,(2,8))).
init(object(robot,3), value(at,(4,8))).
init(object(robot,4), value(at,(5,8))).
init(object(shelf,1), value(at,(1,1))).
init(object(product,1),value(on,(1,1))).
init(object(shelf,2), value(at,(2,1))).
init(object(product,2),value(on,(2,1))).
init(object(shelf,3), value(at,(4,1))).
init(object(product,3),value(on,(3,1))).
init(object(shelf,4), value(at,(5,1))).
init(object(product,4),value(on,(4,1))).
init(object(order,1),value(pickingStation,1)).
init(object(order,1),value(line,(1,1))).
init(object(order,2),value(pickingStation,1)).
init(object(order,2),value(line,(2,1))).
init(object(order,3),value(pickingStation,1)).
init(object(order,3),value(line,(3,1))).
init(object(order,4),value(pickingStation,1)).
init(object(order,4),value(line,(4,1))).