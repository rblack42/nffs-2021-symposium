use <springs.scad>;
include <colors.scad>

// spring with default values

module front_bearing() {
    color(METAL_Steel) {
        difference() {
            translate([5,0,0]) {
                translate([0,0,0])
                rotate([0,90,0])
                    spring(windings=2.25,H=20,R=14,R1=15,ends=false);
                //translate([10,15,0])
                //    cylinder(r=4, h=100);
            }
            translate([-50,0,0]) cube([100,400,400], center=true);
        }
    }
}

module pig_tail() {
    color(METAL_Steel) {
        translate([150,0,0])
        rotate([90,0,0])
            rotate([90,90,90])
                spring(windings=1,H=-80,R=14,R1=15,ends=false);
        //translate([110,15,0])
        //rotate_extrude(angle=40, convexity=10) circle(10);
    }
}


module prop_wire() {
    color(METAL_Steel)
    translate([300,0,0]) {
        rotate([0,90,-90]) {
            // basic hook 270 degrees
            translate([-20,60,0])
                rotate_extrude(angle=270, convexity=10)
                    translate([40, 0]) circle(10);
            // 90 degree bend
            translate([-20,0,0])
                rotate_extrude(angle=90, convexity=10)
                translate([20, 0]) circle(10);
            // straight shaft
            translate([0,0,0])
                rotate([90,0,0]) cylinder(r=10,h=350);
            // 90 degree bend
            translate([-20,-350,0])
                rotate_extrude(angle=-90, convexity=10)
                    translate([20,0]) circle(10);
            // final straight
            translate([-20,-370,0])
                rotate([0,-90,0]) cylinder(r=10,h=100);

    }
}
}

module prop_connector() {
    color(METAL_Steel) {
    translate([20,0,0])
    rotate([-90,180,0])
        rotate_extrude(angle=45, convexity=10) translate([20,0]) circle(5);
    translate([6,0,14]) rotate([0,45,0])
    cylinder(h=80,r=5);
    translate([76,0,56]) rotate([90,0,0])
                rotate_extrude(angle=135, convexity=10)
                translate([20,0]) circle(5);
    translate([96,0,0]) cylinder(r=5,h=57);
    }
}

module prop_hanger() {
    scale([0.1,0.1,0.1]) {
        //front_bearing();
        pig_tail();
        //prop_wire();
        translate([15,15,0]) prop_connector();
    }
}

prop_hanger();
