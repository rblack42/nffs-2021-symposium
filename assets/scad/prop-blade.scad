include <math-magik-data.scad>
use <magik-utils.scad>

$fn = 100;
s = prop_radius - 1;
c = 3;
f = 2;
sl = 1.5;
su = s - sl;
fr = 3.5;
pitch = 55;


module prop_blade() {
    rotate([0,0,pitch])
    translate([0,fr,0])
    rotate([0,14,0])
    intersection() {
        translate([0,0,-2])
            circularArc(180,360,fr,1/16);
        rotate([90,-14,0])
            linear_extrude()
                elliptic_blade_blank(s,c,f,sl,su);
    }
}

for (a = [0:8]) {
    ang = 360 * a/8;
    rotate([ang,0,0])
        translate([0,2.5,0])
    //cube([0.2,5,0.2], center=true);
    prop_blade();
}
