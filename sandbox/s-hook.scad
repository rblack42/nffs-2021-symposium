include <colors.scad>
$fn=100;

// hook dimensions
r1 = 6;
r2 = 2;
w = 0.5;

bend_angle = 90;
bend_radius = 2 * w;

alpha = acos(r1/(r1 + r2));
echo(alpha);
sweep_angle = 180 - alpha;
cylinder_height = 2 * (r1 + r2) * sin(alpha);
echo(cylinder_height);

module s_arc() {
    rotate_extrude(angle=sweep_angle, convexity=10)
        translate([r1,0,0])
           circle(w);
}

module s_cylinder() {
    rotate([-90,0,90])
        cylinder(r=w, h=cylinder_height);
}

module tight_bend(r) {
    rotate_extrude(angle=r, convexity=10)
    translate([bend_radius,0,0])
        circle(w);
}

module left_arm() {
    translate([0,0,-bend_radius]) 
    union() {
        // bend
        rotate([90,0,0])
            tight_bend(90);

        // lower wire
        translate([bend_radius,0,0]) 
            rotate([180,0,0])
                cylinder(r=w,h=2*(r1+r2));
        color("yellow")
            translate([0,0,-2*(r1+r2)]) 
                rotate([-90,0,0]) 
                    tight_bend(45);
    }
}
   
module s_hook() {
    
    // left arc
    rotate([0,0,alpha])
        color("red") s_arc();
    
    
    // right arc
    translate([2 * (r1 + r2),0,0]) 
    rotate([180,0,0])
        color("red") s_arc();
    
    // central cylinder
       translate([r1 * cos(alpha),r1*sin(alpha),0])  rotate([0,0,90+alpha]) 
       s_cylinder();
    
    // left lower arm
    translate([-r1,0,0]) rotate([0,-45,0]) rotate([0,-0,-90]) left_arm();
}

s_hook();

//left_arm();

