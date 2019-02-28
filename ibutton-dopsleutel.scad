
$fn = 100;
meh = .1;
h = 3;

rotate([0, 180, 0]) difference() {
    cylinder($fn=6, r=16, h=h+8);
    translate([0,  0,  -meh]) cylinder(d=21,h=9+meh);
    translate([0,  0,-1-meh]) cylinder(d=9, h=21+meh);
    translate([0,  0,  -meh]) cylinder($fn=6, r=13.95, h=h);
    translate([0,-15, 0    ]) cube([9,30,50], center=true);
}