// Class to describe DNA
// Borrowed from 'Evolution EcoSystem'
// by Daniel Shiffman <http://www.shiffman.net> #codingrainbow

// Settings apply equally to all cells in a strain
// Adding genes for position. All cells in a strain will share the same start position

class DNA {

  float[] genes;  // 'genes' is an array of float values in the range (0-1)

  // Constructor (makes a random DNA)
  DNA() {
      genes = new float[20];  // DNA contains an array called 'genes' with [12] float values

      // DNA gene mapping (18 genes)
      // 0 = fill Hue (0-360)
      // 1 = fill Saturation (0-255)
      // 2 = fill Brightness (0-255)
      // 3 = fill Alpha (0-255)
      // 4 = stroke Hue (0-360)
      // 5 = stroke Saturation (0-255)
      // 6 = stroke Brightness (0-255)
      // 7 = stroke Alpha (0-255)
      // 8 = cellStartSize (10-50) (cellendipity/one uses 0-200)
      // 9 = cellEndSize (5 - 20 %) (cellendipity/one uses 0-50)
      // 10 = lifespan (200-1000)
      // 11 = flatness (50-200 %)
      // 12 = spiral screw (-75 - +75 %)
      // 13 = fertility (70-90%)
      // 14 = spawnCount (1-5)
      // 15 = vMax (Noise) (0-5) (cellendipity/one uses 0-4)
      // 16 = step (Noise) (1 - 6 * 0.001?)  (cellendipity/one uses 0.001-0.006)
      // 17 = noisePercent (0-100%)
      // 18 = seedPosX (0-width)
      // 19 = seedPosY (0-height)

      // RANDOMIZED VALUES
            genes[0] = random(360);        // 0 = fill Hue (0-360)
            genes[1] = random(255);        // 1 = fill Saturation (0-255)
            genes[2] = random(255);        // 2 = fill Brightness (0-255)
            genes[3] = random(255);        // 3 = fill Alpha (0-255)
            genes[4] = random(360);        // 4 = stroke Hue (0-360)
            genes[5] = random(255);        // 5 = stroke Saturation (0-255)
            genes[6] = random(255);        // 6 = stroke Brightness (0-255)
            genes[7] = random(255);        // 7 = stroke Alpha (0-255)
            genes[8] = random(50, 50);    // 8 = cellStartSize (10-50) (cellendipity/one uses 0-200)
            genes[9] = random(5, 20);      // 9 = cellEndSize (5 - 20 %) (cellendipity/one uses 0-50)
            genes[10] = random(200, 1000); // 10 = lifespan (200-1000)
            genes[11] = random(75, 150);   // 11 = flatness (50-200 %)
            genes[12] = random(-75, 75);   // 12 = spiral screw (-75 - +75 %)
            genes[13] = random(70, 85);    // 13 = fertility (70-90%)
            genes[14] = random(1, 5);      // 14 = spawnCount (1-5)
            genes[15] = random(0, 3);      // 15 = vMax (Noise) (0-5) (cellendipity/one uses 0-4)
            genes[16] = random(1, 6);      // 16 = step (Noise) (1 - 6 * 0.001?)  (cellendipity/one uses 0.001-0.006)
            genes[17] = random(100);       // 17 = noisePercent (0-100%)
            genes[18] = random(width);     // 18 = seedPosX (0-width)
            genes[18] = random(height);    // 19 = seedPosY (0-height)

            // FIXED VALUES (OVERRIDES)
      // genes[0] = 0;    // 0 = fill Hue (0-360)
      // genes[1] = 0;    // 1 = fill Saturation (0-255)
      if (random(1)>0.5) {genes[2] = 0;} else {genes[2] = 255;}    // 2 = fill Brightness (0-255)
      //if (random(1)>0.3) {genes[3] = 7;} else {genes[3] = random(255);}  // 3 = fill Alpha (0-255)
      genes[3] = 5;    // 3 = fill Alpha (0-255)
      // genes[4] = 120;  // 4 = stroke Hue (0-360)
      // genes[5] = 255;  // 5 = stroke Saturation (0-255)
      // genes[6] = 255;  // 6 = stroke Brightness (0-255)
      //if (random(1)>0.3) {genes[7] = 40;} else {genes[7] = random(255);}  // 7 = stroke Alpha (0-255)
      genes[7] = 4;    // 3 = fill Alpha (0-255)
      genes[8] = 200;   // 8 = cellStartSize (10-50) (cellendipity/one uses 0-200)
      //genes[9] = 1;   // 9 = cellEndSize (5 - 20 %) (cellendipity/one uses 0-50)
      // genes[10] = 500; // 10 = lifespan (200-1000)
      if (random(1)>0.4) {genes[11] = 100;} else {genes[1] = random(75, 150);} // 11 = flatness (50-200 %)
      if (random(1)>0.5) {genes[12] = 0;} else {genes[12] = random(-75, 75);} // 12 = spiral screw (-75 - +75 %)
      genes[13] = 75;  // 13 = fertility (70-90%)
      genes[14] = 3;   // 14 = spawnCount (1-5)
      // genes[15] = 4;   // 15 = vMax (Noise) (0-5) (cellendipity/one uses 0-4)
      // genes[16] = 5;   // 16 = step (Noise) (1 - 6 * 0.001?)  (cellendipity/one uses 0.001-0.006)
      genes[17] = 30;  // 17 = noisePercent (0-100%)
      if (p.centerSpawn) {genes[18] = width/2;} else {genes[18] = random(width-100) + 100;}  // 18 = seedPosX (0-width)
      if (p.centerSpawn) {genes[19] = height/2;} else {genes[19] = random(height-100) + 100;}  // 19 = seedPosY (0-height)


    }

  DNA(float[] newgenes) {
    genes = newgenes;
  }

  DNA combine(DNA otherDNA_) { // Returns a new set of DNA consisting of randomly selected genes from both parents
    float[] newgenes = new float[genes.length];
    for (int i = 0; i < newgenes.length; i++) {
      if (random(1) < 0.5) {newgenes[i] = genes[i];}
      else {newgenes[i] = otherDNA_.genes[i];} // 50/50 chance of copying gene from either 'mother' or 'other'
    }
    return new DNA(newgenes);
  }

}
