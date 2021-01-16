// magik utilities
use <MCAD/2Dshapes.scad>

module circularArc(angle1, angle2, radius, height, thickness) {
    $fn=100;
    r2 = radius - height;
    linear_extrude(height=thickness, convexity=5)
        donutSlice([r2], radius, angle1, angle2);
}

module rib(chord, camber, height, thickness, tilt) {
	t = chord * camber / 100;
	r = chord * chord / (8 * t) + t / 2;
    theta = 2 * atan2( chord - 2 * t, chord + 2 * t);
    translate([0,thickness/2,0])
    intersection() {
        translate([0,-0.5,0])
                cube([chord, 1, 2 * t]);
        rotate([tilt,0,0])
            translate([chord / 2, -r + t + thickness, 0])
                circularArc(theta-2, 182 - theta, r, 1/16, 1/16);
    }
}

module _ellipse(width, height) {
  scale([1, height/width, 1]) circle(r=width/2);
}

module elliptic_blade_blank(s,c,f,sl,su) {
  // first quadrant
  intersection() {
    _ellipse(2 * (c-f),2 * su);
    translate([0,0]) square([(c-f),su]);
  }
  // second quadrant
  intersection() {
    _ellipse(2 * f,2 * su);
    translate([-f,0]) square([f,su]);
  }
  // third quadrant
  intersection() {
    _ellipse(2 * f,2 * sl);
    translate([-f,-sl]) square([f,sl]);
  }
  // fourth quadrant
  intersection() {
    _ellipse(2 *(c-f),2 * sl);
    translate([0,-sl]) square([(c-f),sl]);
  }
}

module rounded_post(d=1/16, h=1, t=1/4) {
    // d = post thickness, h = total post height, t = tube height
    cube([d, d, h - t]);
    translate([d/2,d/2,h - t])
        cylinder(r=d/2,h = t);
}

