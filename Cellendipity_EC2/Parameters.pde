class Parameters {
  boolean debug;
  boolean centerSpawn;
  boolean autoRestart;
  boolean screendumpON;
  boolean veilDrawON;
  boolean veilRepopulateON;
  boolean fillDisable;
  boolean strokeDisable;
  boolean greyscaleON;
  boolean nucleus;
  boolean stepped;
  boolean wraparound;

  int strainSize;
  int numStrains;
  int stepSize;
  int stepSizeN;
  int trailMode;

  int bkgColGrey;
  color bkgColor;

  int fill_HTwist;
  int fill_STwist;
  int fill_BTwist;
  int fill_ATwist;

  int stroke_HTwist;
  int stroke_STwist;
  int stroke_BTwist;
  int stroke_ATwist;

  Parameters() {
    debug = false;
    if (random(1) > 0.5) {centerSpawn = true;} else {centerSpawn = false;} // true=initial spawn is width/2, height/2 false=random
    autoRestart = false; // If true, will not wait for keypress before starting anew
    screendumpON = true;
    fillDisable = false;
    strokeDisable = false;
    if (random(1) > 0.5) {greyscaleON = true;} else {greyscaleON = false;}
    if (random(1) > 0.6) {nucleus = true;} else {nucleus = false;}
    stepped = true;
    wraparound = false;

    strainSize = int(random(3,20)); // Number of cells in a strain
    numStrains = int(random(1,10)); // Number of strains (a group of cells sharing the same DNA)
    if (random(1) > 0.8) {stepSize = int(random(20,50)); stepSizeN = stepSize;} else {stepSize = 0; stepSizeN = int(random(20, 50));}
    //stepSizeN = int(random(20, 50));
   

    bkgColor = color(random(360), random(255), random(255)); // Background colour
    bkgColGrey = int(random(128));

    //fill_HTwist = 0; // (0-360)
    //fill_STwist = 0; // (0-255)
    //fill_BTwist = 0; // (0-255)
    //fill_ATwist = 0; // (0-255)

    //stroke_HTwist = 0; // (0-360)
    //stroke_STwist = 0; // (0-255)
    //stroke_BTwist = 0; // (0-255)
    //stroke_ATwist = 0; // (0-255)
  
    if (random(1) > 0.1) {fill_HTwist = 0;} else {fill_HTwist = int(random(360));} // (0-255)
    if (random(1) > 0.1) {fill_STwist = 0;} else {fill_STwist = int(random(360));} // (0-255)
    if (random(1) > 0.1) {fill_BTwist = 0;} else {fill_BTwist = int(random(360));} // (0-255)
    if (random(1) > 0.1) {fill_ATwist = 0;} else {fill_ATwist = int(random(360));} // (0-255)

    if (random(1) > 0.1) {stroke_HTwist = 0;} else {stroke_HTwist = int(random(360));} // (0-255)
    if (random(1) > 0.1) {stroke_STwist = 0;} else {stroke_STwist = int(random(360));} // (0-255)
    if (random(1) > 0.1) {stroke_BTwist = 0;} else {stroke_BTwist = int(random(360));} // (0-255)
    if (random(1) > 0.1) {stroke_ATwist = 0;} else {stroke_ATwist = int(random(360));} // (0-255)
  }
}