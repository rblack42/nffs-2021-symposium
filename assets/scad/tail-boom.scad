include <math-magik-data.scad>

module tail_boom() {

    rear_trim_angle = atan2(
        tb_front_height - tb_rear_height,
        tb_length
    );


  difference() {
    color(WOOD_Balsa)
	  cube([tb_length, tb_thickness, tb_front_height]);
    translate([0, -0.5, -1])
      rotate([0,-rear_trim_angle,0])
        cube([tb_length + 1,1,1]);
  }
}

tail_boom();
