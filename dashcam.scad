inner_width         = 23.5;
inner_length        = 34;
backplate_thickness = 7;
backplate_height    = 27;

side_height         = 13;
side_thickness      = 3;
side_radius         = side_height / 2;
hole_size           = 4.4;

width               = inner_width  + 2 * side_thickness;
length              = inner_length + backplate_thickness;
extra               = 1;

cutout_top          = 20;
cutout_bottom       = 27;
cutout_thickness    = 4;

triangle_outer      = 0.57735;
triangle_inner      = 0.28868;

module dashcam_mount_side () {
    cube([ length - side_radius, side_thickness, side_height ]);

    translate([ length - side_radius, side_thickness, side_radius ])
        rotate([ 90, 0, 0 ])
            cylinder(r = side_radius, h = side_thickness, $fn = 100);
}

module dashcam_mount_positive () {
    // backplate
    cube([backplate_thickness, width, backplate_height]);

    // sides
    side_z = (backplate_height - side_height) / 2;
    translate([ 0, 0, side_z ])
        dashcam_mount_side();
    translate([ 0, width - side_thickness, side_z ])
        dashcam_mount_side();
}

module dashcam_mount_negative () {
    // holes
    hole_diagonal = sqrt(2 * (hole_size * hole_size));
    hole_x = length - side_radius - hole_diagonal/2;
    echo(hole_x);
    translate([ hole_x, -extra, backplate_height/2 ])
        rotate([ 0, 45, 0 ])
            cube([ hole_size, width + 2*extra, hole_size ]);

    // backplate cutout
    cutout_radius_top    = cutout_top    * triangle_outer;
    cutout_radius_bottom = cutout_bottom * triangle_outer;
    cutout_x =            -cutout_bottom * triangle_inner + cutout_thickness;
    translate([ cutout_x, width/2, -extra ])
        rotate([ 0, 0, 60 ])
            cylinder(
                h = backplate_height + 2*extra,
                r1 = cutout_radius_bottom,
                r2 = cutout_radius_top,
                $fn = 3,
                center = false
            );
}

module dashcam_mount () {
    difference () {
        dashcam_mount_positive();
        dashcam_mount_negative();
    }
}

dashcam_mount();
