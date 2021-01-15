module wing_tip() {
    // calculate the actual tip span
    wing_tip_span = wing_tip_projected_span / cos(wing_tip_dihedral_angle);

    trim_side = 2 * wing_tip_radius + 1;

    // tip trailing edge
    translate([max_wing_chord - wing_spar_thickness,0,0])
        cube([
            wing_spar_thickness,
            wing_tip_span,
            wing_spar_height]);

    // tip leading edge
    cube([
        wing_spar_thickness,
        wing_tip_span - wing_tip_radius,
        wing_spar_height]);

    // tip leading edge arc
    translate([wing_tip_radius,wing_tip_span - wing_tip_radius,0])
    difference() {
        cylinder(h=wing_spar_height, r=wing_tip_radius);

        // tip arc trim cylinder
        translate([0,0,-0.5])
            cylinder(h = 1, r = wing_tip_radius
                - wing_spar_thickness);

        // trim left side
        translate([-trim_side/2,-trim_side,-0.5])
            cube([trim_side,trim_side,1]);

        // trim bottom
        translate([0,0,-0.5])
            cube([trim_side,trim_side,1]);
    }
    // outer tip rib
    translate([
            wing_tip_radius,
            wing_tip_span-wing_spar_thickness,
            0])
            cube([
                max_wing_chord - wing_tip_radius,
                wing_spar_thickness,
                wing_spar_height]);
}
