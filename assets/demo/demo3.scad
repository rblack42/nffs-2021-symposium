$fn=100;

cube([1,3,1]);
translate([4,0,0])
  sphere(r=2);
translate([8,0,0])
  cylinder(
    r1=1, r2=0.25);
