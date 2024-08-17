// Volcano Board
//
// A slotted board, shaped for Icehouse pieces.
// This is a "deluxe" board, with two separate meshes; a flat bottom part and a
// cutout top part.

width = 5;
height = 5;
render_top_part = true;

rotate([ -90, 0, 0 ]) {
    slot_width = 0.1 * width + 0.01 * (width - 1);
    slot_height = 0.1 * height + 0.01 * (height - 1);
    if (render_top_part) {
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
    } else {
        translate([ 0, 0, -0.005 ])
            cube([ slot_width + 0.025 * 2, slot_height + 0.025 * 2, 0.01 ],
                 center = true);
    }
}
