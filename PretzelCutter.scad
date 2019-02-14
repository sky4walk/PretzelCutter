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


module breadboard() {
    translate([0,0,-breadBoardZ])
        cube([breadBoardX,breadBoardY,breadBoardZ], center = false);
}
module wall(posX) {
    difference() {
        translate([posX,0,0])   
            cube([wallThick,breadBoardY,wallHight], center = false); 
        translate([posX-0.5,knifeGapZFeet,knifeGapZPos])
            cube([wallThick+1,breadBoardY-2*knifeGapZFeet,knifeGap], center = false);   
    }
}
module stopper() {
    translate([0,breadBoardY-stopperWallY,0])
        cube([breadBoardX,stopperWallY,wallHight], center = false); 
}
module main() {
    breadboard();
    wall(0);
    wall(breadBoardX-wallThick);
    stopper();
}

main();