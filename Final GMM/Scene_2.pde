//pari
class SceneTwo {
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

// Stingray variables
float angle = 0.0;
float offset = 80;
float scalar = 16;
float speed = 0.08; //kecepatan ekor bergerak

float speedX = 8; //kecepatan berenang
float locX = 1960; //posisi muncul
float locY = 40; //posisi ketinggian

int ex = 0, ey = 0;
boolean stingrayExited = false;

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
  drawStingray();
  
  swimAngle += 0.1;
  drawCharacter();

// Check if stingray has exited the screen
if (locX < -250) {
  stingrayExited = true;
} 
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

void drawStingray() {
  fill(112,128,144);
  noStroke();

  float y1 = offset + sin(angle) * scalar;
  float y2 = offset + sin(angle + 0.4) * scalar;
  float y3 = offset + sin(angle + 0.8) * scalar;
  float y4 = offset + sin(angle + 0.8) * scalar;

  ex = (int)locX - 110;
  ey = (int)locY - 95;

  ellipse(ex + 320, ey + ((y1) + 110), 80, 20);
  ellipse(ex + 360, ey + ((y2) + 110), 80, 10);
  ellipse(ex + 400, ey + ((y3) + 110), 80, 6);
  ellipse(ex + 440, ey + ((y4) + 110), 80, 2);
  angle += speed;

  rect(ex + 120, ey + 130, 100, 120);
  ellipse(ex + 120, ey + 190, 160, 120);
  triangle(ex + 120, ey + 130, ex + 210, ey + 50, ex + 220, ey + 130);
  triangle(ex + 120, ey + 250, ex + 210, ey + 330, ex + 220, ey + 250);
  triangle(ex + 220, ey + 130, ex + 320, ey + 190, ex + 220, ey + 250);

  stroke(1);
  stroke(112,128,144);
  noFill();
  strokeWeight(10);

  arc(ex + 100, ey + 180, 200, 120, radians(0), radians(140));
  arc(ex + 100, ey + 200, 200, 120, radians(220), radians(360));

  locX -= speedX; // Move the stingray to the left
}
}
