use <rib.scad>

module wing_center(
        chord=5, 
        span=12, 
        nribs=5, 
        height=1/16, 
        thickness=1/16) {
    translate([0,-span/2,0])
        cube([thickness, span, height]);
        for (n=[0:1:nribs) {
            offset = span /nribs * i;
            translate([0,n,0]) 
                rib();
        }
}

wing_center();