/*
* Cellendipity for Twitter Bot
* Tuned for export & run in Linux environment
* > No user interaction (mouse or GUI)
* > Run once and output an image file
* Randomise certain parameters each run
*/

Colony colony;      // A Colony object called 'colony'
Parameters p;       // A Parameters object called 'p'
String screendumpPath = "output.png";

void setup() {
  colorMode(HSB, 360, 255, 255, 255);
  smooth();
  // fullScreen();
  size(1024, 1024); // debug
  ellipseMode(RADIUS);
  p = new Parameters();
  colony = new Colony();
  if (p.greyscaleON) {background(p.bkgColGrey); } else {background(p.bkgColor);}
  if (p.debug) {frameRate(1);}
}

void draw() {
  if (p.debug) {background(p.bkgColor);}
  colony.run();
  manageColony();
}

void populateColony() {
  if (p.greyscaleON) {background(p.bkgColGrey); } else {background(p.bkgColGrey);} // flush the background
  colony.cells.clear();
  colony = new Colony();
}

void manageColony() {
  if (colony.cells.size() == 0 || frameCount > 3600) { 
    saveFrame(screendumpPath);
    exit();
  }
}