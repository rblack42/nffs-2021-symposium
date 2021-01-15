module core() {
    union() {
        cylinder(
          r=0.25,
          h=2,
          center=true,
          $fn=32
        );
        rotate([90,0,0])
            cylinder(
              r=0.25,
              h=2,
              center=true,
              $fn=32
            );
        rotate([0,90,0])
            cylinder(
              r=0.25,
              h=2,
              center=true,
              $fn=32
            );
    }
}

module round_cube() {
    intersection() {
        # cube(
            [1,1,1],
            center=true
          );
        sphere(
          r=0.6,
          $fn=64,
          center=true
        );
    }
}

module part() {
    difference() {
        round_cube();
        # core();
    }
}

core();
