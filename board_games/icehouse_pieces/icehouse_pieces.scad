// Icehouse pieces
// https://en.wikipedia.org/wiki/Icehouse_pieces
//
// Dimensions:
// Large: Base 1, Height 7/4
// Medium: Base 25/32, Height 11/8
// Small: Base 9/16, Height 1
//
// Pyramids have a hollow center with a wall thickness of 0.08. They have small
// indentations on each face called pips to represent the size of the pyramid;
// large pyramids have three pips, medium pyramids have two pips, and small
// pyramids have one pip.

// What model to render
Model = "Demo"; // [Demo, L, M, S, L_C, M_C, S_C]

module pyramid(width, height) {
  x = -width / 2;
  y = -width / 2;
  polyhedron(
      [[x, y, 0], [x + width, y, 0], [x + width, y + width, 0],
       [x, y + width, 0], [x + width / 2, y + width / 2, height]],
      [ [ 0, 1, 4 ], [ 1, 2, 4 ], [ 2, 3, 4 ], [ 3, 0, 4 ], [ 3, 2, 1, 0 ] ]);
}

thickness = 0.008;

module hollow_pyramid(width, height) {
  width = width / 10;
  height = height / 10;
  difference() {
    pyramid(width, height);
    pyramid(width - thickness * 2,
            height / width * 2 * (width / 2 - thickness));
  }
}

module repeat_4() {
  children();
  rotate([ 0, 0, 90 ]) children();
  rotate([ 0, 0, 180 ]) children();
  rotate([ 0, 0, 270 ]) children();
}

module large_pyramid() {
  difference() {
    hollow_pyramid(1, 1 + 3 / 4);
    // Three pips
    repeat_4() {
      translate([ 1 / 2 / 10 - 0.004, -1 / 2 / 10 + 0.02, 0.02 ])
          cube(0.01, center = true);
      translate([ 1 / 2 / 10 - 0.004, -1 / 2 / 10 + 0.035, 0.02 ])
          cube(0.01, center = true);
      translate([ 1 / 2 / 10 - 0.004, -1 / 2 / 10 + 0.05, 0.02 ])
          cube(0.01, center = true);
    }
  }
}

module medium_pyramid() {
  difference() {
    hollow_pyramid(25 / 32, 1 + 3 / 8);
    // Two pips
    repeat_4() {
      translate([ 25 / 64 / 10 - 0.004, -25 / 64 / 10 + 0.02, 0.02 ])
          cube(0.01, center = true);
      translate([ 25 / 64 / 10 - 0.004, -25 / 64 / 10 + 0.035, 0.02 ])
          cube(0.01, center = true);
    }
  }
}

module small_pyramid() {
  difference() {
    hollow_pyramid(9 / 16, 1);
    // One pip
    repeat_4() {
      translate([ 9 / 32 / 10 - 0.004, -9 / 32 / 10 + 0.02, 0.02 ])
          cube(0.01, center = true);
    }
  }
}

if (Model == "Demo") {
  // Visual models (includes pips)

  // Nest
  large_pyramid();
  medium_pyramid();
  small_pyramid();

  // Tree
  translate([ 0.15, 0, 0 ]) {
    large_pyramid();
    translate([ 0, 0, 0.07 ]) medium_pyramid();
    translate([ 0, 0, 0.14 ]) small_pyramid();
  }

  // Simplified models for collision detection (no pips)

  // Nest
  translate([ 0.3, 0, 0 ]) {
    hollow_pyramid(1, 1 + 3 / 4);
    hollow_pyramid(25 / 32, 1 + 3 / 8);
    hollow_pyramid(9 / 16, 1);
  }

  // Tree
  translate([ 0.45, 0, 0 ]) {
    hollow_pyramid(1, 1 + 3 / 4);
    translate([ 0, 0, 0.07 ]) hollow_pyramid(25 / 32, 1 + 3 / 8);
    translate([ 0, 0, 0.14 ]) hollow_pyramid(9 / 16, 1);
  }
}

// Resonite imports meshes rotated by 90 degrees
rotate([ -90, 0, 0 ]) {
  if (Model == "L") {
    large_pyramid();
  } else if (Model == "M") {
    medium_pyramid();
  } else if (Model == "S") {
    small_pyramid();
  } else if (Model == "L_C") {
    hollow_pyramid(1, 1 + 3 / 4);
  } else if (Model == "M_C") {
    hollow_pyramid(25 / 32, 1 + 3 / 8);
  } else if (Model == "S_C") {
    hollow_pyramid(9 / 16, 1);
  }
}
