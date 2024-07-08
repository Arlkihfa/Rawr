//paus funfact
class SceneFive {
  int maxSize = 65;
  int N = 100;
  float fishX[] = new float[N];
  float fishY[] = new float[N];
  float fishSpeed[] = new float[N];
  color fishColor[] = new color[N];
  //paus
  float whaleX = 5;  // Starting horizontal position of the whale
  float whaleY = 0;  // Starting vertical position of the whale
  float tailAngle = 0;  // Initial tail angle

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
      drawSquareBackground();
      drawWhale(whaleX, whaleY, tailAngle);  // Draw the whale inside the square
      swimAngle += 0.1;
      drawCharacter();   
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
      fishY[i] = random(height - 300); // Keep fish from appearing in the sand
      fishSpeed[i] = random(2, 4); // Faster fish
      fishColor[i] = color(random(360), 80, 100); // Fixed fish color
  }

  void drawSquareBackground() {
      float squareSize = 800;
      float x = 100 + squareSize + 50;  // Adjust x position for alignment next to the first square
      float y = (height - squareSize) / 1.5;
      fill(150, 150, 150, 150);  // Gray with transparency
      rect(x, y, squareSize, squareSize-200);
      
      // Text "Funfact"
      fill(255);
      textAlign(LEFT, TOP);
      textFont(createFont("Times New Roman", 40));
      String[] facts = {
          "Funfact :",
          "- Paus Sperma (Physeter macrocephalus)",
          "- Dapat bertahan hidup 60-70 tahun",
          "- Predator bergigi terbesar di dunia",
          "- Memakan setidaknya 900 kg/hari",
          "- Menggunakan ekolokasi untuk berburu."
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
    vertex(x - 87, y + 38);//batas lengan kiri
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

  void drawWhale(float x, float y, float tailAngle) {
    // Draw whale body
    strokeWeight(5);
    stroke(21, 53, 85);
    fill(21, 53, 85);

    // Adjust whale position relative to the square
    x += 100;  // Adjust x position for alignment
    y += (height - 800) / 2;  // Adjust y position for alignment

    arc(130 + x, 270 + y, 240, 240, PI, TWO_PI - PI / 2);
    beginShape();
    vertex(10 + x, 270 + y);
    vertex(8 + x, 320 + y);
    vertex(230 + x, 350 + y);
    vertex(230 + x, 270 + y);
    endShape(CLOSE);
    beginShape();
    vertex(230 + x, 350 + y);
    vertex(40 + x, 360 + y);
    vertex(230 + x, 360 + y);
    endShape(CLOSE);
    arc(130 + x, 360 + y, 180, 180, PI / 2, PI);
    beginShape();
    curveVertex(130 + x, 450 + y);
    curveVertex(130 + x, 450 + y);
    curveVertex(280 + x, 443 + y);
    curveVertex(570 + x, 400 + y);
    curveVertex(640 + x, 360 + y);
    curveVertex(680 + x, 240 + y);
    curveVertex(700 + x, 210 + y);
    curveVertex(750 + x, 220 + y);
    curveVertex(793 + x, 200 + y);
    curveVertex(740 + x, 170 + y);
    curveVertex(695 + x, 180 + y);
    curveVertex(680 + x, 160 + y);
    curveVertex(640 + x, 150 + y);
    curveVertex(600 + x, 160 + y);
    curveVertex(625 + x, 190 + y);
    curveVertex(665 + x, 200 + y);
    curveVertex(605 + x, 260 + y);
    curveVertex(480 + x, 190 + y);
    curveVertex(330 + x, 165 + y);
    curveVertex(330 + x, 165 + y);
    endShape(CLOSE);
    beginShape();
    curveVertex(330 + x, 165 + y);
    curveVertex(330 + x, 165 + y);
    curveVertex(130 + x, 150 + y);
    curveVertex(130 + x, 150 + y);
    vertex(11 + x, 320 + y);
    vertex(330 + x, 320 + y);
    endShape(CLOSE);
    triangle(130 + x, 360 + y, 200 + x, 360 + y, 130 + x, 446 + y);

    // Whale details
    fill(255);
    stroke(0);
    strokeWeight(3);
    ellipse(190 + x, 290 + y, 23, 40);
    fill(0);
    ellipse(186 + x, 295 + y, 14, 19);
    fill(255);
    ellipse(183.5 + x, 296 + y, 7, 8);
    fill(0);
    ellipse(45 + x, 270 + y, 6, 17);
    ellipse(30 + x, 270 + y, 6, 17);
    fill(255);
    stroke(0);
    ellipse(460 + x, 222 + y, 50, 40);
    ellipse(400 + x, 205 + y, 35, 32);
    ellipse(415 + x, 240 + y, 20, 14);
    ellipse(500 + x, 240 + y, 14, 15);
    ellipse(350 + x, 180 + y, 45, 25);
    ellipse(350 + x, 225 + y, 28, 30);

    // Whale belly (overlap)
    noStroke();
    fill(255);
    beginShape();
    vertex(230 + x, 350 + y);
    vertex(40 + x, 360 + y);
    vertex(230 + x, 360 + y);
    endShape(CLOSE);
    arc(130 + x, 360 + y, 180, 180, PI / 2, PI);
    beginShape();
    curveVertex(130 + x, 450 + y);
    curveVertex(130 + x, 450 + y);
    curveVertex(280 + x, 443 + y);
    curveVertex(570 + x, 400 + y);
    curveVertex(600 + x, 363 + y);
    curveVertex(230 + x, 350 + y);
    vertex(230 + x, 350 + y);
    endShape(CLOSE);
    triangle(130 + x, 360 + y, 250 + x, 360 + y, 130 + x, 450 + y);
    stroke(0);
    noFill();
    beginShape();
    curveVertex(50 + x, 360 + y);
    curveVertex(50 + x, 360 + y);
    curveVertex(55 + x, 395 + y);
    curveVertex(70 + x, 428 + y);
    curveVertex(70 + x, 428 + y);
    endShape();
    beginShape();
    curveVertex(90 + x, 357 + y);
    curveVertex(90 + x, 357 + y);
    curveVertex(95 + x, 395 + y);
    curveVertex(120 + x, 450 + y);
    curveVertex(120 + x, 450 + y);
    endShape();
    beginShape();
    curveVertex(140 + x, 355 + y);
    curveVertex(140 + x, 355 + y);
    curveVertex(145 + x, 395 + y);
    curveVertex(170 + x, 450 + y);
    curveVertex(170 + x, 450 + y);
    endShape();
    beginShape();
    curveVertex(182 + x, 365 + y);
    curveVertex(182 + x, 365 + y);
    curveVertex(195 + x, 405 + y);
    curveVertex(225 + x, 448 + y);
    curveVertex(225 + x, 448 + y);
    endShape();
    beginShape();
    curveVertex(235 + x, 390 + y);
    curveVertex(235 + x, 390 + y);
    curveVertex(245 + x, 410 + y);
    curveVertex(275 + x, 443 + y);
    curveVertex(275 + x, 443 + y);
    endShape();
    beginShape();
    curveVertex(292 + x, 400 + y);
    curveVertex(292 + x, 400 + y);
    curveVertex(305 + x, 420 + y);
    curveVertex(330 + x, 437 + y);
    curveVertex(330 + x, 437 + y);
    endShape();
    fill(0);
    ellipse(200 + x, 170 + y, 30, 12);

    // Bubbles:
    fill(191, 251, 251);
    stroke(255);
    strokeWeight(2);
    ellipse(200 + x, 150 + y, 13, 13);
    ellipse(210 + x, 140 + y, 8, 8);
    ellipse(195 + x, 132 + y, 15, 15);
    ellipse(205 + x, 110 + y, 12, 12);
    ellipse(185 + x, 112 + y, 6, 6);
    ellipse(225 + x, 85 + y, 18, 18);
    ellipse(170 + x, 60 + y, 20, 19);
    ellipse(190 + x, 88 + y, 13, 13);
    ellipse(210 + x, 76 + y, 6, 6);
    ellipse(218 + x, 43 + y, 23, 23);
  }
}
