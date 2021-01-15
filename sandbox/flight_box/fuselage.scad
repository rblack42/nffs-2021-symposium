include <math-magik.data>
include <colors.scad>
include <rudder.scad>
$fn=100;

//##############################################################################
// motor st1ck

// trimming blocks
module _trim_block(length) {
    cube([length,1,1]);
}

module _ms_trim_front() {
    front_trim_angle = atan2(ms_height - ms_front_height, ms_front_wing_post);
    rotate([0,-front_trim_angle,0])
        translate([0,-0.5,ms_front_height])
            _trim_block(ms_front_wing_post + 1);
}

module _ms_trim_rear() {
    rear_trim_angle = atan2(
            ms_height - ms_rear_height,
            ms_length - ms_rear_wing_post
        );
    translate([ms_rear_wing_post, -0.5, 0.375])
        rotate([0,rear_trim_angle,0])
            _trim_block(ms_length - ms_rear_wing_post + 1);
}

module basic_motor_stick() {
   cube([ms_length, ms_thickness, ms_height]);
}

module  motor_stick() {
    difference() {
        basic_motor_stick();
        _ms_trim_front();
        _ms_trim_rear();
    }
}

//##############################################################################
// tail boom

// trimming blocks

module _tb_trim_rear() {
    rear_trim_angle = atan2(
            tb_front_height - tb_rear_height,
            tb_length
        );
    translate([0, -0.5, -1])
        rotate([0,-rear_trim_angle,0])
            _trim_block(tb_length + 1);
}

module tail_boom() {
    // length (x), thickness (y), height (z)

    difference() {
	    cube([tb_length, tb_thickness, tb_front_height]);
        _tb_trim_rear();
    }
}

//##############################################################################
// vertical fin

module fin() {
    translate([
        ms_length + tb_length - fin_chord - tb_overlap
            - stab_post_diameter -paper_tube_thickness,
        0,0])
    rotate([-90,0,-5])
        rudder();
}

//##############################################################################
// rounded post

module _rounded_post(d=1/16, h=1, t=1/4) {
    // d = post thickness, h = total post height, t = tube height
    cube([d, d, h - t]);
    translate([d/2,d/2,h - t])
        cylinder(r=d/2,h = t);
}

//##############################################################################
// wing posts

module wing_posts(front_post, rear_post) {
    translate([front_post,0,0])
        _rounded_post(d=wing_post_diameter, h=wing_post_le_height, t=wing_tube_height);
    translate([rear_post,0,0])
        _rounded_post(d=wing_post_diameter, h=wing_post_te_height, t=wing_tube_height);

}

//##############################################################################
// stab posts

module stab_posts(front_post, rear_post) {
    translate([front_post,0,0])
        _rounded_post(d=stab_post_diameter, h=stab_post_height, t=stab_tube_height);
    translate([rear_post,0,0])
        _rounded_post(d=stab_post_diameter, h=stab_post_height, t=stab_tube_height);

}

//##############################################################################
// rudder_turn_post

module rudder_turn_post() {
    cube([rudder_post_diameter, rudder_post_length, rudder_post_diameter]);
}

//##############################################################################
// Assembled body

module fuselage() {
    motor_stick();
    wing_posts(ms_front_wing_post, ms_rear_wing_post);
    translate([ms_length - tb_overlap,0,0]) tail_boom();
    stab_posts(tb_front_stab_post, tb_rear_stab_post);
    fin();
    translate([ms_length + tb_length - tb_overlap - rudder_post_diameter,-rudder_post_length,-tb_rear_height]) cube([1/16,rudder_post_length + fin_spar_thickness,1/16]);
}

fuselage();