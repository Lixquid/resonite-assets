// Martian Chess board
//
// A slotted board, with two separate 4x4 grids, shaped for Icehouse pieces.
// This is comprised of two meshes; a flat bottom part and a cutout top part,
// for different materials.

Model = "Top"; // [Top, Bottom]

rotate([ -90, 0, 0 ]) {
    if (Model == "Top") {
        translate([ 0, 0, 0.005 ]) difference() {
            cube(
                [
                    0.1 * 4 + 0.01 * (4 - 1) + 0.025 * 2,
                    0.1 * 8 + 0.01 * (8 - 1) + 0.025 * 2 + 0.04, 0.01
                ],
                center = true);
            for (y = [0:3]) {
                for (x = [0:3]) {
                    translate([
                        -(0.1 * 4 + 0.01 * (4 - 1)) / 2 + 0.11 * x + 0.05,
                        0.02 + 0.055 + 0.11 * y, 0
                    ]) {
                        cube([ 0.1, 0.1, 0.01 ], center = true);
                    }
                }
            }
            for (y = [0:3]) {
                for (x = [0:3]) {
                    translate([
                        -(0.1 * 4 + 0.01 * (4 - 1)) / 2 + 0.11 * x + 0.05,
                        0.01 - 0.03 - 0.11 * 4 + 0.055 + 0.11 * y, 0
                    ]) {
                        cube([ 0.1, 0.1, 0.01 ], center = true);
                    }
                }
            }
            cube([ 0.1 * 4 + 0.01 * (4 - 1), 0.01, 0.01 ], center = true);
        }
    } else if (Model == "Bottom") {
        translate([ 0, 0, -0.005 ]) cube(
            [
                0.1 * 4 + 0.01 * (4 - 1) + 0.025 * 2,
                0.1 * 8 + 0.01 * (8 - 1) + 0.025 * 2 + 0.03, 0.01
            ],
            center = true);
    }
}
