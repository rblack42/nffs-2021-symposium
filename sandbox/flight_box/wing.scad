$fn=100;

include <math-magik.data>

module wing_rib() {
    rib(
        max_wing_chord - 2 * wing_spar_thickness,
        wing_rib_camber,
        wing_rib_height,
        wing_rib_thickness
    );
}

module wing() {
    // center section

    // leading edge
    translate([0,-wing_center_span/2,0])
        cube([
                wing_spar_thickness,
                wing_center_span,
                wing_spar_height
            ]);

    // trailing edge
    translate([
                max_wing_chord-wing_spar_thickness,
                -wing_center_span/2,
                0
              ])
        cube([
                wing_spar_thickness,
                wing_center_span,
                wing_spar_height
            ]);

    // add ribs
    translate([
            wing_spar_thickness,
            -wing_center_span/2,
            0])
        wing_rib();
    translate([
            wing_spar_thickness,
            -wing_center_span/4,
            0])
        wing_rib();
    translate([
            wing_spar_thickness,
            0,
            0])
        wing_rib();
    translate([
            wing_spar_thickness,
            wing_center_span/4,
            0])
        wing_rib();
    translate([
            wing_spar_thickness,
            wing_center_span/2,
            0])
        wing_rib();

    // dad right tip

    translate([
            0,
            wing_center_span / 2,
            0])
        rotate([wing_tip_dihedral_angle,0,0])
            wing_tip();

    // add left tip
    translate([
            0,
            -wing_center_span/2,
            wing_spar_thickness])
        rotate([180,0,0])
            rotate([-wing_tip_dihedral_angle,0,0])
                wing_tip();

    // add wing mounting tubes
    translate([
        -wing_post_diameter/2 - paper_tube_thickness,0,0])
            paper_tube(radius=wing_post_diameter/2, height=wing_tube_height);
    translate([ max_wing_chord
        +wing_post_diameter/2 + paper_tube_thickness,0,0])
            paper_tube(radius=wing_post_diameter/2, height=wing_tube_height);

}
