module stab_tip() {

    trim_side = 2 * stab_tip_radius + 1;

    // tip trailing edge
    translate([stab_chord - stab_spar_thickness,0,0])
        cube([
            stab_spar_thickness,
            stab_tip_span,
            stab_spar_height]);

    // tip leading edge
    cube([
        stab_spar_thickness,
        stab_tip_span - stab_tip_radius,
        stab_spar_height]);

    // tip leading edge arc
    translate([stab_tip_radius,stab_tip_span - stab_tip_radius,0])
    difference() {
        cylinder(h=stab_spar_height, r=stab_tip_radius);

        // tip arc trim cylinder
        translate([0,0,-0.5])
            cylinder(h = 1, r = stab_tip_radius
                - stab_spar_thickness);

        // trim left side
        translate([-trim_side/2,-trim_side,-0.5])
            cube([trim_side,trim_side,1]);

        // trim bottom
        translate([0,0,-0.5])
            cube([trim_side,trim_side,1]);
    }
    // outer tip rib
    translate([
            stab_tip_radius,
            stab_tip_span-stab_spar_thickness,
            0])
            cube([
                stab_chord - stab_tip_radius,
                stab_spar_thickness,
                stab_spar_height]);
}
