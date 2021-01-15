//##########################################################
// Stabilizer

module stab_rib() {
    rib(
        stab_chord - 2 * stab_spar_thickness,
        stab_rib_camber,
        stab_rib_height,
        stab_rib_thickness
    );
}

module stab() {
    // center section

    // leading edge
    translate([0,-stab_center_span/2,0])
        cube([
                stab_spar_thickness,
                stab_center_span,
                stab_spar_height
            ]);

    // trailing edge
    translate([
                stab_chord-stab_spar_thickness,
                -stab_center_span/2,
                0
              ])
        cube([
                stab_spar_thickness,
                stab_center_span,
                stab_spar_height
            ]);

    // add ribs
    translate([
            stab_spar_thickness,
            -stab_center_span/2,
            0])
        stab_rib();
    translate([
            stab_spar_thickness,
            0,
            0])
        stab_rib();
    translate([
            stab_spar_thickness,
            stab_center_span/2,
            0])
        stab_rib();

    // add right tip

    translate([
            0,
            stab_center_span / 2,
            0])
        stab_tip();

    // add left tip
    translate([
            0,
            -stab_center_span/2,
            stab_spar_thickness])
        rotate([180,0,0])
                stab_tip();

    // add stab mounting tubes
    translate([
        -stab_post_diameter/2 - paper_tube_thickness,0,0])
            paper_tube(radius=stab_post_diameter/2, height=stab_tube_height);
    translate([ stab_chord
        +stab_post_diameter/2 + paper_tube_thickness,0,0])
            paper_tube(radius=stab_post_diameter/2, height=stab_tube_height);
}
