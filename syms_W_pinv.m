clear all
close all
clc

syms q0 q1 q2 q3 real
syms vxr vyr vzr real

P1 = [
    q0, q1, -q2, -q3;
    -q3, q2, q1, -q0;
    q2, q3, q0, q1;
    ];
P2 = [
    q3, q2, q1, q0;
    q0, -q1, q2, -q3;
    -q1, -q0, q3, q2;
    ];
P3 = [
    -q2, q3, -q0, q1;
    q1, q0, q3, q2;
    q0, -q1, -q2, q3;
    ];

P = vxr * P1 + vyr * P2 + vzr * P3;
assume(vxr * vxr + vyr * vyr + vzr * vzr == 1);
assumeAlso(q0, 'real');
assumeAlso(q1, 'real');
assumeAlso(q2, 'real');
assumeAlso(q3, 'real');

assumeAlso(vxr, 'real');
assumeAlso(vyr, 'real');
assumeAlso(vzr, 'real');
assumeAlso(q0 * q0 + q1 * q1 + q2 * q2 + q3 * q3 == 1);
PP = simplify(pinv(P))

PPx = [jacobian(PP(:, 1), vxr), jacobian(PP(:, 2), vxr), jacobian(PP(:, 3), vxr)];
PPy = [jacobian(PP(:, 1), vyr), jacobian(PP(:, 2), vyr), jacobian(PP(:, 3), vyr)];
PPz = [jacobian(PP(:, 1), vzr), jacobian(PP(:, 2), vzr), jacobian(PP(:, 3), vzr)];
expand(PP - (PPx * vxr + PPy * vyr + PPz * vzr))