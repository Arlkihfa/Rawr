//penyu
class SceneSix {
int N = 100;
float fishX[] = new float[N];
float fishY[] = new float[N];
float fishK[] = new float[N];
float fishLength[] = new float[N];
float fishSpeed[] = new float[N];
color fishColor[] = new color[N];
color fishEyeColor[] = new color[N];
color waterColor;

// Seaweed
final int nb = 30;
SeaWeed[] weeds;
PVector rootNoise = new PVector(random(123456), random(123456));
int mode = 0;

//Turtle variables
float turtleX = -650; //posisi muncul
float turtleY = 700; //posisi ketinggian
float turtleSpeedX = 7; //kecepatan berenang
float legAngle = 0;     
boolean turtleExited = false;

//characther
float swimAngle = 8; 
  
void setup() {
  size(1920, 1080);
  stroke(0, 150, 255, 65);
    
  waterColor = color(200, 80, 60);
  for (int i = 0; i < N; i++) {
    resetFish(i);
    fishX[i] = random(width);
  }
  
  weeds = new SeaWeed[nb];
  for (int i = 0; i < nb; i++) {
    weeds[i] = new SeaWeed(random(0, width), height);
  }
}

void draw() {
  drawBackground();
  drawCliffs();
  drawSeaweed();
  drawFishBackground(); 
  drawSand();
  drawRocks();
  swimAngle += 0.1;
  drawCharacter();
  
  drawTurtle(turtleX, turtleY, legAngle);
  turtleX += turtleSpeedX;
  legAngle += 0.05;
}

void drawCharacter(){
  float x = 1700; // Posisi horizontal awal karakter
  float y = 800; // Posisi vertikal awal karakter
  stroke(1);
  // baju
  fill(#ff0000);
  beginShape();
  vertex(x - 30, y - 60);
  vertex(x - 87, y - 3);
  vertex(x - 87, y + 38); //batas lengan kiri
  vertex(x - 40, y - 10);
  vertex(x - 40, y + 70);
  vertex(x - 48, y + 90);
  vertex(x - 5, y + 90);
  vertex(x, y + 80);
  vertex(x + 5, y + 90);
  vertex(x + 48, y + 90);
  vertex(x + 40, y + 70);
  vertex(x + 40, y - 10);
  vertex(x + 70, y + 20);
  vertex(x + 80, y + 13);
  vertex(x + 90, y);
  vertex(x + 40, y - 50);
  strokeWeight(1);
  endShape(CLOSE);

  // dasi
  fill(101, 55, 44);
  ellipse(x - 30, y - 30, 30, 50);
  ellipse(x + 30, y - 30, 30, 50);
  ellipse(x - 15, y - 32, 30, 50);
  ellipse(x + 15, y - 32, 30, 50);

  // pin dasi
  fill(255, 225, 0);
  ellipse(x, y - 19, 30, 3);

  // tangan kiri
  fill(235, 185, 149);
  beginShape();
  vertex(x - 68, y + 20);
  vertex(x - 78, y + 13);
  vertex(x - 88, y - 3);
  vertex(x - 118, y + 30);
  vertex(x - 100, y + 50);
  vertex(x - 68, y + 20);
  strokeWeight(1);
  endShape(CLOSE);
  ellipse(x - 102, y + 25, 35, 50);

  // sarung tangan kanan
  beginShape();
  vertex(x + 70, y + 20);
  vertex(x + 80, y + 13);
  vertex(x + 90, y);
  vertex(x + 120, y + 30);
  vertex(x + 100, y + 50);
  vertex(x + 70, y + 20);
  strokeWeight(1);
  endShape(CLOSE);
  ellipse(x + 105, y + 30, 35, 50);

  // muka
  fill(235, 185, 149);
  ellipse(x, y - 100, 140, 140);

  // scuba goggles
  fill(0, 128, 0); 
  rect(x - 50, y - 150, 100, 60, 20); 
  fill(255); 
  rect(x - 45, y - 145, 90, 50, 15);

  // scuba mask
  fill(0); 
  ellipse(x, y - 65, 60, 40); 
  fill(0, 128, 0); 
  ellipse(x, y - 65, 30, 30); 

  // selang
  pushStyle(); 
  stroke(0); 
  strokeWeight(8);
  noFill();
  beginShape();
  vertex(x, y - 65);
  vertex(x + 60, y - 50);
  vertex(x + 60, y - 70);
  vertex(x + 60, y - 90);
  endShape();
  popStyle(); 

  // alis
  fill(0);
  ellipse(x - 30, y - 140, 20, 5); // kanan
  ellipse(x + 30, y - 140, 20, 5); // kiri

  // mata
  fill(0);
  ellipse(x - 30, y - 120, 25, 23); // Kiri
  ellipse(x + 30, y - 120, 25, 23); // Kanan
  fill(255);
  pushMatrix();
  translate(x - 35, y - 120);
  rotate(radians(320));
  ellipse(6, 0, 12, 9);
  ellipse(3, 9, 7.5, 7);
  popMatrix();
  pushMatrix();
  translate(x + 25, y - 120);
  rotate(radians(320));
  ellipse(6, 0, 12, 9);
  ellipse(3, 9, 7.5, 7);
  popMatrix();

  // hidung
  noFill();
  stroke(0);
  strokeWeight(2);
  arc(x, y - 100, 15, 20, radians(150), radians(300));

  // sabuk
  fill(#219C90);
  rect(x - 40, y + 10, 80, 35);

  // celana
  fill(#000000);
  beginShape();
  vertex(x - 40, y + 90);
  vertex(x - 10, y + 90);
  vertex(x - 10, y + 130);
  vertex(x - 45, y + 130);
  vertex(x - 40, y + 90);
  endShape(CLOSE);

  beginShape();
  vertex(x + 15, y + 90);
  vertex(x + 10, y + 90);
  vertex(x + 10, y + 130);
  vertex(x + 45, y + 130);
  vertex(x + 40, y + 90);
  endShape(CLOSE);

  // sepatu kiri
  float finOffsetY = 10 * sin(swimAngle);
  drawFin(x - 30, y + 150+ finOffsetY);

  // sepatu kanan
  drawFin(x + 30, y + 150- finOffsetY);

  // rambut
  int hairRadius = 80;
  fill(0);
  for (int i = 200; i < 360; i += 15) {
    float hairX = x + hairRadius * cos(radians(i));
    float hairY = y - 100 + hairRadius * sin(radians(i));
    ellipse(hairX, hairY, 30, 30);
  }
}

void drawFin(float x, float y) {
  // Colors
  color finColor = color(169, 169, 169);
  color darkColor = color(105, 105, 105);
  color strapColor = color(0);

  // Fin body
  fill(finColor);
  noStroke();
  beginShape();
  vertex(x - 28, y + 50);
  vertex(x + 28, y + 50);
  vertex(x + 20, y - 15);
  vertex(x - 20, y - 15);
  endShape(CLOSE);

  // Fin strap
  stroke(strapColor);
  strokeWeight(10);
  noFill();
  arc(x, y - 18, 30, 30, PI, TWO_PI);

  // Fin top
  fill(darkColor);
  noStroke();
  ellipse(x, y - 18, 30, 30);
} 

void drawBackground() {
  color waterColor = color(59, 142, 255);
  color bottomColor = color(25, 25, 112);

// Draw gradient water
  for (int y = 0; y < height; y++) {
  float inter = map(y, 0, height, 0, 1);
  color c = lerpColor(waterColor, bottomColor, inter);
  stroke(c);
  line(0, y, width, y);
  }
}

void drawCliffs() {
// Draw cliffs on the left
  fill(25, 25, 112, 30);
  noStroke();
  beginShape();
  vertex(0, height);
  vertex(0, height - 300);
  bezierVertex(width * 0.05, height - 250, width * 0.1, height - 400, width * 0.2, height - 350);
  bezierVertex(width * 0.3, height - 300, width * 0.4, height - 500, width * 0.5, height - 450);
  bezierVertex(width * 0.6, height - 400, width * 0.8, height - 550, width, height - 500);
  vertex(width, height);
  endShape(CLOSE);

// Draw cliffs on the right
  fill(25, 25, 112, 20);
  noStroke();
  beginShape();
  vertex(width, height);
  vertex(width, height - 300);
  bezierVertex(width * 0.95, height - 250, width * 0.9, height - 400, width * 0.8, height - 350);
  bezierVertex(width * 0.7, height - 300, width * 0.6, height - 500, width * 0.5, height - 450);
  bezierVertex(width * 0.4, height - 400, width * 0.2, height - 550, 0, height - 500);
  vertex(0, height);
  endShape(CLOSE);
}

void keyPressed() {
  mode = (mode + 1) % 2;
}

void drawSand() {
// Draw sand at the bottom of the sea
  fill(200, 193, 131); // Sand color
  noStroke();
  beginShape();
  vertex(0, height);
  vertex(0, height - 200); // Adjust sand height
  bezierVertex(width * 0.1, height - 150, width * 0.3, height - 250, width * 0.4, height - 200);
  bezierVertex(width * 0.5, height - 150, width * 0.7, height - 250, width * 0.8, height - 200);
  vertex(width, height - 200); // Adjust sand height
  vertex(width, height);
  endShape(CLOSE);
}

void drawRocks() {
  color rockColor = color(112, 128, 144);
  noStroke();

// Draw rocks
  fill(rockColor);
  ellipse(width * 0.22, height - 80, 80, 40);
  ellipse(width * 0.32, height - 100, 100, 50);
  ellipse(width * 0.42, height - 70, 70, 35);
  ellipse(width * 0.72, height - 90, 90, 45);
  ellipse(width * 0.82, height - 110, 110, 55);
}

void drawFishBackground() {
  for (int i = 0; i < N; i++) {
    drawFish(i);
    stepFish(i);
  }
}

void drawFish(int i) {
  pushMatrix();
  translate(fishX[i], fishY[i]);
  scale(0.1); // Smaller fish size
  noStroke();
  fill(fishColor[i]);
  beginShape();
  vertex(0, 0);
  bezierVertex(69, -120, 338, -17, 346, -17);
  bezierVertex(360, -53, 385, -73, 415, -88);
  bezierVertex(385, -34, 375, 21, 421, 75);
  bezierVertex(386, 71, 363, 50, 344, 24);
  bezierVertex(233, 65, 186, 76, 113, 64);
  bezierVertex(84, 64, 18, 43, 0, 0);
  endShape(CLOSE);
  fill(0);
  ellipse(66, -6, 17, 17);
  popMatrix();
}

void stepFish(int i) {
  fishX[i] -= fishSpeed[i];
  if (fishX[i] < -42.1) // Adjust for smaller fish size (0.1 of the original length 421)
  resetFish(i);
}

void resetFish(int i) {
  fishX[i] = width + random(200);
  fishY[i] = random(height - 300); //ketinggian ikan berenang
  fishSpeed[i] = random(2, 4); // kecepatan ikan berenang
  fishColor[i] = color(random(360), 80, 100);
}

void drawSeaweed() {
  for (int i = 0; i < nb; i++) {
    SeaWeed weed = weeds[i];
    weed.update();
  }
}

class SeaWeed {
  final static float DIST_MAX = 3; // panjang
  final static float maxNbSeg = 100; // max number of segments
  final static float minNbSeg = 35; // min number of segments
  final static float maxWidth = 30; // max width of the base line
  final static float minWidth = 11; // min width of the base line
  final static float FLOTATION = 3; // flotation constant
  int nbSegments = (int) random(minNbSeg, maxNbSeg); // number of segments
  PVector[] pos; // position of each segment
  color[] cols; // colors array, one per segment
  PVector rootNoise = new PVector(random(123456), random(123456)); // noise water effect
  float x; // x origin of the weed
  final color fixedColor = color(1, 119, 0); 

  SeaWeed(float p_x, float p_y) {
    pos = new PVector[nbSegments];
    cols = new color[nbSegments];
    x = p_x;
    for (int i = 0; i < nbSegments; i++) {
      pos[i] = new PVector(p_x, p_y - i * DIST_MAX);
      cols[i] = fixedColor;
     }
    }

    void update() {
      rootNoise.add(new PVector(.02, .02));
      pos[0] = new PVector(x, height-150);
      for (int i = 1; i < nbSegments; i++) {        
        float n = noise(rootNoise.x + .003 * pos[i].x, rootNoise.y + .003 * pos[i].y);
        float noiseForce = (n - 0.5) * 6;
        pos[i].x += noiseForce;
        pos[i].y -= FLOTATION;

        PVector tmp = PVector.sub(pos[i - 1], pos[i]);
        tmp.normalize();
        tmp.mult(DIST_MAX);
        pos[i] = PVector.sub(pos[i - 1], tmp);
      }
      if (mode == 1) beginShape(LINES);
      for (int i = 0; i < nbSegments; i++) {
        if (mode == 0) {
          noStroke();
          fill(cols[i]);
          float r = (30 * cos(map(i, 0, nbSegments - 1, 0, HALF_PI)));
          ellipse(pos[i].x, pos[i].y + 10, r, r);
        } else {
          noFill();
          noStroke();
          strokeWeight(nbSegments - i + int(30 * cos(map(i, 0, nbSegments - 1, 0, HALF_PI))));
          curveVertex(pos[i].x, pos[i].y + 10);
        }
      }
      if (mode == 1) endShape();
    }
  }

void drawTurtle(float x, float y, float angle) {
  noStroke();
  // Head
  fill(48, 97, 11);
  triangle(430 + x, 20 + y, 430 + x, 90 + y, 385 + x, 70 + y);
  fill(107, 177, 0);
  triangle(430 + x, 20 + y, 460 + x, 30 + y, 430 + x, 55 + y);
  fill(48, 130, 11);
  triangle(460 + x, 30 + y, 430 + x, 55 + y, 450 + x, 70 + y);
  fill(132, 43, 11);
  triangle(430 + x, 55 + y, 450 + x, 70 + y, 430 + x, 90 + y);
  // Top shell (body)
  fill(151, 177, 11);
  triangle(385 + x, 70 + y, 430 + x, 90 + y, 350 + x, 160 + y);
  fill(56, 99, 11);
  triangle(430 + x, 90 + y, 470 + x, 160 + y, 350 + x, 160 + y);
  fill(72, 131, 11);
  triangle(470 + x, 160 + y, 350 + x, 160 + y, 460 + x, 220 + y);
  fill(59, 83, 11);
  triangle(460 + x, 220 + y, 350 + x, 160 + y, 430 + x, 250 + y);
  fill(98, 157, 62);
  triangle(350 + x, 160 + y, 430 + x, 250 + y, 350 + x, 285 + y);
  fill(98, 174, 62);
  triangle(350 + x, 285 + y, 350 + x, 160 + y, 290 + x, 200 + y);
  fill(49, 101, 23);
  triangle(310 + x, 110 + y, 350 + x, 160 + y, 290 + x, 200 + y);
  fill(95, 138, 23);
  triangle(310 + x, 110 + y, 350 + x, 160 + y, 385 + x, 70 + y);
  // Side shell (body)
  fill(45, 80, 23);
  triangle(430 + x, 90 + y, 490 + x, 160 + y, 470 + x, 160 + y);
  fill(72, 131, 11);
  triangle(490 + x, 160 + y, 470 + x, 160 + y, 460 + x, 220 + y);
  fill(45, 118, 23);
  triangle(490 + x, 160 + y, 460 + x, 220 + y, 480 + x, 250 + y);
  fill(50, 65, 11);
  triangle(460 + x, 220 + y, 480 + x, 250 + y, 430 + x, 250 + y);
  fill(45, 100, 23);
  triangle(430 + x, 250 + y, 450 + x, 290 + y, 480 + x, 250 + y);
  triangle(430 + x, 250 + y, 450 + x, 290 + y, 350 + x, 285 + y);
  fill(45, 72, 23);
  triangle(350 + x, 285 + y, 370 + x, 320 + y, 450 + x, 290 + y);
  fill(42, 80, 23);
  triangle(290 + x, 200 + y, 290 + x, 320 + y, 375 + x, 320 + y);
  fill(45, 74, 23);
  triangle(290 + x, 200 + y, 250 + x, 260 + y, 290 + x, 320 + y);
  fill(45, 112, 23);
  triangle(250 + x, 260 + y, 240 + x, 200 + y, 290 + x, 200 + y);
  triangle(290 + x, 200 + y, 240 + x, 200 + y, 310 + x, 110 + y);
  // Legs with swinging motion
  float legOffsetX = sin(angle) * 10; // Swinging offset for legs
  
  // Left leg
  triangle(256 + x + legOffsetX, 270 + y, 268 + x + legOffsetX, 290 + y, 220 + x + legOffsetX, 320 + y);
  triangle(220 + x + legOffsetX, 320 + y, 268 + x + legOffsetX, 290 + y, 260 + x + legOffsetX, 350 + y);
  fill(43, 190, 23);
  triangle(220 + x + legOffsetX, 320 + y, 220 + x + legOffsetX, 340 + y, 260 + x + legOffsetX, 350 + y);
  
  // Right leg
  fill(45, 93, 23);
  triangle(300 + x - legOffsetX, 360 + y, 315 + x - legOffsetX, 320 + y, 340 + x - legOffsetX, 320 + y);
  triangle(340 + x - legOffsetX, 320 + y, 350 + x - legOffsetX, 380 + y, 300 + x - legOffsetX, 360 + y);
  fill(43, 190, 23);
  triangle(300 + x - legOffsetX, 360 + y, 350 + x - legOffsetX, 380 + y, 330 + x - legOffsetX, 400 + y);
  
  // Left arm
  triangle(310 + x, 110 + y, 365 + x, 80 + y, 340 + x, 50 + y);
  triangle(340 + x, 50 + y, 310 + x, 110 + y, 270 + x, 50 + y);
  triangle(270 + x, 50 + y, 290 + x, 80 + y, 220 + x, 80 + y);
  triangle(220 + x, 80 + y, 250 + x, 80 + y, 210 + x, 110 + y);
  // Right arm
  triangle(447 + x, 110 + y, 470 + x, 100 + y, 480 + x, 150 + y);
  triangle(470 + x, 100 + y, 480 + x, 140 + y, 550 + x, 140 + y);
  triangle(550 + x, 140 + y, 520 + x, 140 + y, 550 + x, 180 + y);
}
}
