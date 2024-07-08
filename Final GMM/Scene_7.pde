//penyu funfact
class SceneSeven {
  int maxSize = 65;
  int N = 100;
  float fishX[] = new float[N];
  float fishY[] = new float[N];
  float fishSpeed[] = new float[N];
  color fishColor[] = new color[N];
  float turtleX = 0;
  float turtleY = 0;
  float legAngle = 0;
  color waterColor;
  
  //characther
  float swimAngle = 8; 
  
  void setup() {
    waterColor = color(200, 80, 60);
    for (int i = 0; i < N; i++) {
      resetFish(i);
      fishX[i] = random(width);
    }
  }

  void draw() {
    drawBackground();
    drawFishBackground();
    drawSquareBackground2();
    drawTurtle(turtleX, turtleY, legAngle);
    swimAngle += 0.1;
    drawCharacter();

  }

  void drawBackground() {
    color waterColor = color(59, 142, 255);
    color bottomColor = color(25, 25, 112);

    for (int y = 0; y < height; y++) {
      float inter = map(y, 0, height, 0, 1);
      color c = lerpColor(waterColor, bottomColor, inter);
      stroke(c);
      line(0, y, width, y);
    }
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
    scale(0.1);
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
    if (fishX[i] < -42.1)
      resetFish(i);
  }

  void resetFish(int i) {
    fishX[i] = width + random(200);
    fishY[i] = random(height - 300);
    fishSpeed[i] = random(2, 4);
    fishColor[i] = color(random(360), 80, 100);
  }

  void drawSquareBackground2() {
    float squareSize = 800;
    float x = 100 + squareSize + 50;
    float y = (height - squareSize) / 1.5;
    fill(150, 150, 150, 150);
    rect(x, y, squareSize, squareSize - 200);
    fill(255);
    textAlign(LEFT, TOP);
    textFont(createFont("Times New Roman", 40));
    String[] facts = {
      "Funfact :",
      "- Penyu (Chelonia mydas)",
      "- Dapat bertahan hidup 50-60 tahun",
      "- Tidak berwarna hijau",
      "- Kembali ke tempat kelahiran untuk bertelur",
      "- Tukang kebun bawah laut"
    };
    float textX = x + 20;
    float textY = y + 20;
    float lineSpacing = 50;
    for (int i = 0; i < facts.length; i++) {
      text(facts[i], textX, textY + i * lineSpacing);
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

  void drawTurtle(float x, float y, float angle) {
    noStroke();
    x += 100;
    y += (height - 500) / 2;
    fill(48, 97, 11);
    triangle(430 + x, 20 + y, 430 + x, 90 + y, 385 + x, 70 + y);
    fill(107, 177, 0);
    triangle(430 + x, 20 + y, 460 + x, 30 + y, 430 + x, 55 + y);
    fill(48, 130, 11);
    triangle(460 + x, 30 + y, 430 + x, 55 + y, 450 + x, 70 + y);
    fill(132, 43, 11);
    triangle(430 + x, 55 + y, 450 + x, 70 + y, 430 + x, 90 + y);
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
    float legOffsetX = sin(angle) * 10;
    triangle(256 + x + legOffsetX, 270 + y, 268 + x + legOffsetX, 290 + y, 220 + x + legOffsetX, 320 + y);
    triangle(220 + x + legOffsetX, 320 + y, 268 + x + legOffsetX, 290 + y, 260 + x + legOffsetX, 350 + y);
    fill(43, 190, 23);
    triangle(220 + x + legOffsetX, 320 + y, 220 + x + legOffsetX, 340 + y, 260 + x + legOffsetX, 350 + y);
    fill(45, 93, 23);
    triangle(300 + x - legOffsetX, 360 + y, 315 + x - legOffsetX, 320 + y, 340 + x - legOffsetX, 320 + y);
    triangle(340 + x - legOffsetX, 320 + y, 350 + x - legOffsetX, 380 + y, 300 + x - legOffsetX, 360 + y);
    fill(43, 190, 23);
    triangle(300 + x - legOffsetX, 360 + y, 350 + x - legOffsetX, 380 + y, 330 + x - legOffsetX, 400 + y);
    triangle(310 + x, 110 + y, 365 + x, 80 + y, 340 + x, 50 + y);
    triangle(340 + x, 50 + y, 310 + x, 110 + y, 270 + x, 50 + y);
    triangle(270 + x, 50 + y, 290 + x, 80 + y, 220 + x, 80 + y);
    triangle(220 + x, 80 + y, 250 + x, 80 + y, 210 + x, 110 + y);
    triangle(447 + x, 110 + y, 470 + x, 100 + y, 480 + x, 150 + y);
    triangle(470 + x, 100 + y, 480 + x, 140 + y, 550 + x, 140 + y);
    triangle(550 + x, 140 + y, 520 + x, 140 + y, 550 + x, 180 + y);
  }
}
