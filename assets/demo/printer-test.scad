use <wing-tip.scad>

left_margin=0.5;
bottom_margin=0.5;
printer_shift = 0.5;

projection(cut=false)
 scale([25.4,25.4,1])
   translate([
        left_margin,
        bottom_margin
          +printer_shift,
        0
    ])
      wing_tip();
