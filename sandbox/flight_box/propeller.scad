include <colors.scad>
include <prop-blade.scad>

$fn=50;

module prop_shaft() {
    cylinder(h=2, r1=1/16, r2=1/32);
    rotate([180,0,0])
    cylinder(h=2, r1=1/16, r2=1/32);
}

module prop_wire() {
    color(METAL_Aluminium)
    rotate([90,90,0]) cylinder(h=1, r=1/64);
}

module propeller() {
    color(WOOD_Oak) prop_shaft();
    prop_wire();
    color(WOOD_Balsa) prop_blade();
    rotate([180,0,0]) color(WOOD_Balsa) prop_blade();
}

