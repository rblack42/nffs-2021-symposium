$fn=50;

difference() {
translate([0,-0.5,0])
cube([2,1,2]);
translate([1/8,-0.25,1/4])
cube([4,1/2,1.5]);
}
translate([0,-1/16,-0.5])
cube([1,1/8,3/4]);

translate([0,0,-0.75])
rotate([0,90,0])
cylinder(r=1/4, h=1);


