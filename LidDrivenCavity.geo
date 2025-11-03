
// Define parameters
d = 1.0;
lc =0.05;

Point(1) = {0, 0, 0, lc};
Point(2) = {0, d, 0, lc};
Point(3) = {d, d, 0, lc};
Point(4) = {d, 0, 0, lc};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

Line Loop(5) = {1, 2, 3, 4};
Plane Surface(6) = {5};

// Transfinite lines for structured mesh
Transfinite Line {1, 3} = d/lc+1; // vertical divisions
Transfinite Line {2, 4} = d/lc+1; // horizontal divisions

// Transfinite surface to structure the mesh inside
Transfinite Surface {6};
Recombine Surface{6};

// Physical groups
Physical Line("Boundaries") = {1, 2, 3, 4};  // All lines
Physical Surface("Domain") = {6};
