module rudder() {

    trim_side = 2 * fin_tip_radius + 1;

    // tip trailing edge
    translate([fin_chord - fin_spar_thickness,0,0])
        cube([
            fin_spar_thickness,
            fin_span,
            fin_spar_height]);

    // tip leading edge
    cube([
        fin_spar_thickness,
        fin_span - fin_tip_radius,
        fin_spar_height]);

    // tip leading edge arc
    translate([fin_tip_radius,fin_span - fin_tip_radius,0])
    difference() {
        cylinder(h=fin_spar_height, r=fin_tip_radius);

        // tip arc trim cylinder
        translate([0,0,-0.5])
            cylinder(h = 1, r = fin_tip_radius
                - fin_spar_thickness);

        // trim left side
        translate([-trim_side/2,-trim_side,-0.5])
            cube([trim_side,trim_side,1]);

        // trim bottom
        translate([0,0,-0.5])
            cube([trim_side,trim_side,1]);
    }
    // outer tip rib
    translate([
            fin_tip_radius,
            fin_span-fin_spar_thickness,
            0])
            cube([
                fin_chord - fin_tip_radius,
                fin_spar_thickness,
                fin_spar_height]);
    cube([fin_chord,fin_spar_thickness, fin_spar_height]);
}
