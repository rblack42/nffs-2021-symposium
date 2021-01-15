module rib(rc, rt, rh, rw) {
    // rc - wing chord
    // rt - camber in percentage of camber
    // rh - the height of the rib stick
    // rw - the thickness of the rib stick
    
    rt = rt * rc / 100;
    ra = rc * rc / (8 * rt) + rt / 2;

    rotate([90,0,0])
    translate([rc/2,-ra+rt+rh,-rw])
	difference() {
    	cylinder(r=ra,h=rw);
        // subtract inner cylinder
        translate([0,0,-0.5])
			cylinder(r=ra-rh,h=1);
        // trim left side
        translate([rc/2,-ra,-1])
                cube([ra,2*ra,2]);
        // subtract left side
        translate([-ra-rc/2,-ra,-1])
            cube([ra, 2*ra,2]);
        // subtract lower arc
        translate([-ra,-rc/2-2*ra,-1])
            cube([2*ra,2*ra,2]);
	}
}
    
