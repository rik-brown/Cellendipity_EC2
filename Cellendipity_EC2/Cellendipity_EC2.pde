/*
* Cellendipity for Twitter Bot
* Simplified and tuned for export to run in Linux environment:
*    > No user interaction (mouse or GUI)
*    > Run once and output an image file with generic filename
* Randomise certain parameters each run to explore the multi-dimensional design-space
*/

Colony colony;                               // A Colony object called 'colony'
Parameters p;                                // A Parameters object called 'p'
String screendumpPath = "output.png";        // Name & location of saved output

void setup() {
  colorMode(HSB, 360, 255, 255, 255);
  smooth();
  size(1024, 1024);
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

void manageColony() {
  if (colony.cells.size() == 0 || frameCount > 3600) {
    saveFrame(screendumpPath);
    exit();
  }
}