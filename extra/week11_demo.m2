needsPackage "InvariantRing"
R = QQ[x_0..x_3];
T = diagonalAction(matrix{{1,1,-1,-1}}, R);
RG = invariantRing T;
stdio << "For problem sheet 8 exercise 1," << endl;
stdio << "the ring of invariant is: " << RG << endl;