left_margin=0.5;
right_margin=0.5;
top_margin=0.5;
bottom_margin=0.5;
page_width = 8.5;
page_height = 11.0;
printer_shift = 0.5;

box_height = page_height 
    - top_margin 
    - bottom_margin;
box_width = page_width 
    - left_margin - right_margin;


projection(cut=false)
    scale([25.4,25.4,1])
    translate([
        left_margin,
        bottom_margin+printer_shift,
        0
    ])

    cube([
        box_width,
        box_height,
        1
    ]);