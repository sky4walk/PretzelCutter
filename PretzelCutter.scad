fn = 100;
breadBoardX = 145;
breadBoardY = 200;
breadBoardZ = 20;
wallHight = 23;
wallThick = 10;
knifeGap = 2;
knifeGapZPos = 13;
knifeGapZFeet = 10;
stopperWallY = 20;
screwHole = 1.0;


module breadboard() {
    translate([0,0,-breadBoardZ])
        cube([breadBoardX,breadBoardY,breadBoardZ], center = false);
}
module wall(posX) {
    difference() {
        translate([posX,0,0])   
            cube([wallThick,breadBoardY,knifeGapZPos+knifeGap], center = false); 
        translate([posX-0.5,knifeGapZFeet,knifeGapZPos])
            cube([wallThick+1,breadBoardY-2*knifeGapZFeet,knifeGap+0.5], center = false);
    translate([posX+knifeGapZFeet/2-0.5,knifeGapZFeet/2,0])
        cylinder(knifeGapZPos+knifeGap+0.5,screwHole,screwHole, center=false);        
    translate([posX+knifeGapZFeet/2-0.5,breadBoardY-knifeGapZFeet/2,0])
        cylinder(knifeGapZPos+knifeGap+0.5,screwHole,screwHole, center=false);        
    }
}
module wallTop(posX) {
    difference() {
        translate([posX,0,knifeGapZPos+knifeGap])   
            cube([wallThick,breadBoardY,wallHight-knifeGapZPos-knifeGap], center = false); 
        translate([posX+knifeGapZFeet/2-0.5,knifeGapZFeet/2,knifeGapZPos+knifeGap])
            cylinder(knifeGapZPos+knifeGap+0.5,screwHole,screwHole, center=false);        
        translate([posX+knifeGapZFeet/2-0.5,breadBoardY-knifeGapZFeet/2,knifeGapZPos+knifeGap])
            cylinder(knifeGapZPos+knifeGap+0.5,screwHole,screwHole, center=false);        
    }
}

module stopper() {
    translate([wallThick,breadBoardY-stopperWallY,0])
        cube([breadBoardX-2*wallThick,stopperWallY,wallHight], center = false); 
}
module boardGround() {
    breadboard();
    wall(0);
    wall(breadBoardX-wallThick);
    stopper();
}

module boardAddOn() {
    wallTop(0);
    wallTop(breadBoardX-wallThick);
}

module main() {
    boardGround();
    boardAddOn();
}

main();

