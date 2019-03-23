hoogte  = 200;
breedte =  24;
diepte  =  10;
meh     =   0.1;

dubbeledeur = true;

module schroefgat() {
    m = 4.5;
    kop = 8;
    x = 8;
    
    // Zijdelings verstelbaar
    hull() {
        translate([x, 0, -meh])         cylinder(d=m, h=10+2*meh);
        translate([breedte-x, 0, -meh]) cylinder(d=m, h=10+2*meh);
    }
    hull() {
        translate([x, 0, -meh])         cylinder(d=kop, h= 4);
        translate([breedte-x, 0, -meh]) cylinder(d=kop, h= 4);
    }
}

translate([breedte,0,diepte]) rotate([0,180,0]) difference() {
    cube([breedte,hoogte,diepte]);
    
    // dagschoot
    translate([6,hoogte-40-25,-meh]) cube([12,25,10+2*meh]);  
    
    // nachtschoot
    // 2 mm extra boven+onder ivm ronde hoek 4 mm frees
    translate([7,40-2,-meh]) cube([10,40+2*2,10+2*meh]);
    
    if (dubbeledeur) {
        // nachtschoot moet kunnen uitdraaien draaien bij dubbele deur
        translate([7+2,40-2,-meh]) cube([10,40+2*2,10+2*meh]);
        rotate([0,30,0]) translate([0,40-2,-8]) cube([10,40+2*2,20+2*meh]);
    }
    
    // schroefgaten zitten al op vaste afstanden in de deur, dus niet parametrisch
    translate([0,  10, 0]) schroefgat();
    translate([0, 100, 0]) schroefgat();
    translate([0, 190, 0]) schroefgat();
}

