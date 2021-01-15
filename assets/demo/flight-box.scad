include <math-magik-data.scad>
use <wing.scad>
use <stab.scad>
use <fuselage.scad>
use <propeller.scad>

module brace_frame() {
    hw = box_width - 2 * box_side_thickness;
    vh = box_height - 2 * box_side_thickness -1;
    
    color(WOOD_Balsa) {
        // bottom brace
        cube([hw,0.5,0.5]);
        // left brace
        translate([0,0,0.5])
            cube([0.5,0.5,vh]);
        //top brace
        translate([
            0,
            0,
            box_height - 2 * box_side_thickness -0.5
        ])
            cube([hw,0.5,0.5]);
        // right brace
        translate([box_width - 2 * box_side_thickness - 0.5,0,0.5])
            cube([0.5,0.5,box_height - 2 * box_side_thickness - 1]);
    }
}
    
module brace_corners(depth) {
    hw = box_width - 2 * box_side_thickness - 0.5;
    vh = box_height - 2 * box_side_thickness -0.5;
    color(WOOD_Balsa) {
    // bottom left
    translate([0,0,0])
    cube([0.5,depth,0.5]); 
    // bottom right
    translate([hw,0,0])
    cube([0.5,depth,0.5]);
    // top left
    translate([0,0,vh])
    cube([0.5,depth,0.5]);
    // top right
    translate([hw,0,vh])
    cube([0.5,depth,0.5]);
    }
}

module basic_frame(depth) {
    // bottom
    color(WOOD_Spruce)
    cube([box_width,depth,box_side_thickness]);

    // top
    color(WOOD_Spruce)
    translate([0,0,box_height - box_side_thickness])
    cube([box_width,depth,box_side_thickness]);

    // left side
    translate([0,0,box_side_thickness])
    color(WOOD_Spruce)
    cube([
        box_side_thickness,
        depth,
        box_height - 2 * box_side_thickness]);

    // right side
    translate([
            box_width - box_side_thickness,
            0,
            box_side_thickness])
        color(WOOD_Spruce)
        cube([box_side_thickness, depth, box_height - 2 * box_side_thickness]);
}

module wing_storage() {
    basic_frame(6);
    translate([0,0.25,0])
        brace_frame();
    translate([box_side_thickness,5.5,box_side_thickness])         brace_frame();
    translate([box_side_thickness, 0.75, box_side_thickness])
    brace_corners(4.75);
    color(WOOD_Balsa) {
    translate([box_width/2, 1, 1]) rotate([0,0,90]) wing();
    translate([box_width/2, 1, 2.5]) rotate([0,0,90]) wing();
    translate([box_width/2, 1, 4]) rotate([0,0,90]) wing();
    translate([box_width/2, 1, 5.5]) rotate([0,0,90]) wing();
    }
}

module body_storage() {
    basic_frame(4);
    translate([box_side_thickness,-1/4,box_side_thickness])          brace_frame();
    translate([box_side_thickness,3.75,box_side_thickness])          brace_frame();
    translate([box_side_thickness, 0.25, box_side_thickness])
    brace_corners(3.5);
    color(WOOD_Balsa) {
    translate([1,1,2]) rotate([-90,0,0]) fuselage();
    translate([1,1,3]) rotate([-90,0,0]) fuselage();
    translate([1,1,4]) rotate([-90,0,0]) fuselage();
    }
    translate([7,2,5]) rotate([0,90,0]) propeller();
    translate([7,2,6]) rotate([0,90,0]) propeller();
    translate([7,2,7]) rotate([0,90,0]) propeller();
    translate([7,2,8]) rotate([0,90,0]) propeller();
}

module stab_storage() {
    basic_frame(6);
    basic_frame(6);
        brace_frame();
    translate([box_side_thickness,5.25,box_side_thickness])
        brace_frame();
    translate([box_side_thickness, 0.5, box_side_thickness])
    brace_corners(4.75);
    color(WOOD_Balsa) {
    translate([7,1,1]) rotate([0,0,90]) stab();
    translate([7,1,2]) rotate([0,0,90]) stab();
    translate([7,1,3]) rotate([0,0,90]) stab();
    translate([7,1,4]) rotate([0,0,90]) stab();
    }
}


open_angle = 45;

// wing storage
translate([0,2,0])
rotate([0,0,open_angle])
wing_storage();

// body storage
translate([0,-2,0])
body_storage();

// stab storage
translate([
    box_width * (1 - cos(open_angle)) + 6 * sin(open_angle),
    , -2 -box_width * sin(open_angle) - 6 * cos(open_angle)
   ,0])
rotate([0,0,open_angle])
stab_storage();
