// Volcano Board
//
// A slotted board, shaped for Icehouse pieces.
// This is a "deluxe" board, with two separate meshes; a flat bottom part and a
// cutout top part.
// A third model is also available known as an "Elb", which is a single tile
// perfectly sized to fill-in one of the slots in the main board.

width = 5;
height = 5;
Model = "Top"; // [Top, Bottom, Elb]

rotate([ -90, 0, 0 ]) {
    slot_width = 0.1 * width + 0.01 * (width - 1);
    slot_height = 0.1 * height + 0.01 * (height - 1);
    if (Model == "Top") {
        translate([ 0, 0, 0.005 ]) difference() {
            cube([ slot_width + 0.025 * 2, slot_height + 0.025 * 2, 0.01 ],
                 center = true);
            for (y = [0:height - 1]) {
                for (x = [0:width - 1]) {
                    translate([
                        -slot_width / 2 + 0.11 * x + 0.05,
                        -slot_height / 2 + 0.11 * y + 0.05, 0
                    ]) {
                        cube([ 0.1, 0.1, 0.01 ], center = true);
                    }
                }
            }
        }
    } else if (Model == "Bottom") {
        translate([ 0, 0, -0.005 ])
            cube([ slot_width + 0.025 * 2, slot_height + 0.025 * 2, 0.01 ],
                 center = true);
    } else if (Model == "Elb") {
        translate([ 0, 0, 0.005 ]) cube([ 0.1, 0.1, 0.01 ], center = true);
    }
}
