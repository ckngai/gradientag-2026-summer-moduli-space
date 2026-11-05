needsPackage "InvariantRing";
needsPackage "SchurFunctors";

d = 3;

SL = QQ[a_(1,1)..a_(2,2)];
M = genericMatrix(SL, 2, 2);
I = ideal(det M - 1);
R = QQ[t_0..t_d]; -- Homog. coord. ring of PP(Sym^d V)
G = linearlyReductiveAction(I, schur({d}, M), R);
stdio << invariantRing G << endl;