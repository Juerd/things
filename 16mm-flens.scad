$fn=100;
difference() {
    union() {
        cylinder(h=2, d=30);
        cylinder(h=10, d=20);
    }
    translate([0,0,-.1]) cylinder(h=10.2, d=16.5);
}