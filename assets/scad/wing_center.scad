use <rib.scad>

module wing_center_spar(
    span,
    le_thickness,
    le_height) {
     cube([
      le_thickness,
      span,
      le_height]);
}

module wing_rib(
    chord,
    camber,
    thickness,
    height,
    le_thickness,
    te_thickness) {
  ribchord = chord
    - le_thickness
    - te_thickness;
  rib(
    ribchord,
    camber,
    thickness,
    le_thickness,
    le_height]);
}

module wing_center(
    chord=5,
    span=12,
    nribs=5,
    height=1/16,
    thickness=1/16) {
  // leading edge
  translate([0,-span/2,0])
    wing_spar(span, height, thickness);
  // place ribs
  for (n=[0:1:nribs-1]) {
    offset = -span/2 + span
        /(nribs-1) * n;
    translate(
      [thickness,offset,0]
    )
      wing_rib(
        chord,
        camber,
        thickness,

          chord = chord
            - 2 * thickness
        );
    }
    translate([
            chord  -2 * thickness,
            -span/2,
            0])
    wing-spar(span, thickness, height)
}

wing_center();
