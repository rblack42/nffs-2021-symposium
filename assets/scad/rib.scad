include <colors.scad>

module rib(
      chord=5,
      camber=6,
      height=1/16,
      thickness=1/32) {
    camber = camber * chord / 100;
    radius = chord * chord / (8 * camber) + camber / 2;

    echo(radius);
          rotate([90,0,0])
    translate([chord/2,-radius + camber + height,-thickness/2]) 
    intersection() {    
        difference() {
            cylinder(r=radius,h=thickness, $fn=100);
            translate([0,0,-0.5])
                cylinder(r=radius-height, h=1, $fn=100);
        }
        translate([-chord/2,radius-camber-height,0]) 
            cube([chord, 1, 1]);
    }
}

rib(5,6,1/16,1/16);

