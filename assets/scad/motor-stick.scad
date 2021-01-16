include <colors.scad>

ms_points = [
	[0,0],
	[-0.10825,-0.1875],
	[0.108,0],
	[9.625,0],
	[9.8125,-0.1875],
	[10.0,0],
	[10.0,0.1875],
	[6.625,0.25],
	[1.625,0.25],
	[0.10825,0.1875],
	[0,0]
];

module motor_stick(thickness) {
  color(WOOD_Balsa)
    rotate([90,0,0])
      translate([0,0,-thickness/2])
	  linear_extrude(
	      height = thickness,
	      center=false,
	      convexity=10
	  )
        polygon(ms_points);
}

motor_stick(1/8);
