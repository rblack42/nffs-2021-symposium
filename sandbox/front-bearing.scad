// propeller and front bearing assembly
include <colors.scad>
$fn = 100;

front_mount_length = 0.5;
front_mount_thickness = 1/8;
front_mount_height = 3/8;
front_mount_wall_thickness = 1/32;

prop_shaft_d = 1/32;
prop_bearing_d = 1/16;
prop_bearing_length = 1/4;
prop_shaft_offset = 3/16;   // measured from front of mount
prop_bearing_x = -5/16;     // from front of mount to prop bearing point
down_thrust_angle = 2;

attachment = [
    [prop_bearing_x,-prop_shaft_offset],
    [prop_bearing_x + prop_bearing_length * cos(down_thrust_angle),
     -prop_shaft_offset + prop_bearing_length * sin
     (down_thrust_angle)],
    [1/8, -front_mount_wall_thickness],
    [-front_mount_wall_thickness, front_mount_height+front_mount_wall_thickness],
    [prop_bearing_x,-prop_shaft_offset]
];

module front_bearing() {
    color("white")
    translate([
        -front_mount_wall_thickness,
        -front_mount_thickness/2 -front_mount_wall_thickness,
        -front_mount_wall_thickness
    ])
    difference() {
        cube([
            front_mount_length + front_mount_wall_thickness,
            front_mount_thickness + 2 * front_mount_wall_thickness,
            front_mount_height + 2 * front_mount_wall_thickness
        ]);
        translate([front_mount_wall_thickness,
            front_mount_wall_thickness,
            front_mount_wall_thickness])
        cube([
            front_mount_length + 1,
            front_mount_thickness,
            front_mount_height
        ]);
    }  
}

module prop_bearing() {
    color("white")
    rotate([-prop_shaft_offset,90 -down_thrust_angle,0])
    cylinder(h = prop_bearing_length, r = prop_bearing_d/2);

}
module prop_wire(diameter) {
    sf = diameter/20;
    scale([sf,sf,sf])
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


front_bearing();
rotate([0,-down_thrust_angle,0])
translate([prop_bearing_x,prop_shaft_d/2- 3/64,-prop_shaft_offset]) {
    prop_wire(prop_shaft_d);
    prop_bearing();
}

color("white")
rotate([90,0,0])translate([0,prop_bearing_d/2,-2/64])
   linear_extrude(height = 1/32, convexity=10)
        
        polygon(attachment);  
