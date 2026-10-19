needsPackage "RationalPoints2";
needsPackage "InvariantRing";
needsPackage "Cyclotomic";
clearAll

ex1a = (n) -> (
    a = symbol a;
    -- Building the field kk=Q(a)
    -- where "a" is a primitive n-th root of unity
    QQ[symbol t];
    kk = extField(cyclotomicPoly(n, t), Variable => a);

    R = kk[x_1, x_2];
    -- Note: for n = 1 or 2, the n-th root of unity is in QQ already
    if n == 1 then a = 1 else if n == 2 then a = -1;
    -- {matrix{{a, 0}, {0, a^-1}}} generates the whole group
    Zn = finiteAction({matrix{{a, 0}, {0, a^-1}}}, R);
    RG = invariantRing Zn;
    RG
);

ex1b = (n) -> (
    a = symbol a;
    -- Building the field kk=Q(a)
    -- where "a" is a primitive 2n-th root of unity
    QQ[symbol t];
    kk = extField(cyclotomicPoly(2*n, t), Variable => a);   

    R = kk[x_1, x_2];
    -- Note: for n = 1, the 2n-th root of unity is in QQ already
    if n == 1 then a = -1;
    -- {matrix{{a, 0}, {0, a^-1}}, matrix{{0, 1}, {-1, 0}}} generates the whole group
    Gn = finiteAction({matrix{{a, 0}, {0, a^-1}}, matrix{{0, 1}, {-1, 0}}}, R);
    RG = invariantRing Gn;
    RG
);

stdio << "---------- Exercise 1(a) ----------" << endl;
for i in 1..5 do (
    tmp := ex1a(i);
    stdio << "The invariant ring of the action of Z_" << i << " on k[x_1, x_2] is:" << endl;
    stdio << tmp << endl << endl;
);
stdio << endl;
stdio << "---------- Exercise 1(b) ----------" << endl;
for i in 1..5 do (
    tmp := ex1b(i);
    stdio << "The invariant ring of the action of G_" << i << " on k[x_1, x_2] is:" << endl;
    stdio << tmp << endl << endl;
);

-- The following computes the defining ideal of the invariant ring:
if true then (
    RG := ex1a(2);
    stdio << "The defining ideal of the invariant ring of the action of Z_2 on k[x_1, x_2] is:" << endl;
    stdio << definingIdeal RG << endl;
);