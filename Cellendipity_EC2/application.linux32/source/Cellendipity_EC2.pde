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
  if (p.trailMode == 1 || p.debug) {background(p.bkgColor);}
  if (p.trailMode == 2) {trails();}
  colony.run();
  manageColony();
  //if (colony.cells.size() == 0) { if ((keyPressed == true) || p.autoRestart) {populateColony(); } } // Repopulate the colony when all the cells have died
}

void populateColony() {
  if (p.greyscaleON) {background(p.bkgColGrey); } else {background(p.bkgColGrey);} // flush the background
  colony.cells.clear();
  colony = new Colony();
}

void trails() {
  blendMode(SUBTRACT);
  noStroke();
  fill(1);
  rect(0,0,width,height);
  blendMode(BLEND);
  fill(255);
}

void manageColony() {
  if (colony.cells.size() == 0 || frameCount > 3600) { //  If an extinction has occurred...
    if (p.screendumpON) {screendump();} //WARNING! ALWAYS repopulate & restart the colony after doing this once!
    exit();
    populateColony(); // .... repopulate the colony
  }
}

// We can add a creature manually if we so desire
void mousePressed() {
  PVector mousePos = new PVector (mouseX, mouseY);
  PVector vel = PVector.random2D();
  DNA dna = new DNA();
  colony.spawn(mousePos, vel, dna);
}

void mouseDragged() {
  PVector mousePos = new PVector (mouseX, mouseY);
  PVector vel = PVector.random2D();
  DNA dna = new DNA();
  colony.spawn(mousePos, vel, dna);
}

void screendump() {
  saveFrame(screendumpPath);
}

void keyReleased() {
  if (key == '1') {println("1"); p.trailMode = 1;}
  if (key == '2') {println("2"); p.trailMode = 2;}
  if (key == '3') {println("3"); p.trailMode = 3;}
  if (key == 'r') {println("r"); colony.cells.clear();}
  if (key == 'b') {println("b"); background(p.bkgColGrey); }
  if (key == 'd') {println("d"); p.debug = !p.debug; }
  if (key == 'n') {println("n"); p.nucleus = !p.nucleus; }
  if (key == 's') {println("s"); screendump();}
}