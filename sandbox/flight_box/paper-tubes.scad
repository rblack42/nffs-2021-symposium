//#####################################
// paper tube generator

include <math-magik.data>
$fn = 100;

module paper_tube(radius=1/16, height=1/4) {
    difference() {
        cylinder(r=radius + 2 * paper_tube_thickness,
            h=height);
        translate([0,0,-height])
            cylinder(r=radius, h=3 * height);
    }
}
