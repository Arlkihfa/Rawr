//pari funfact
class SceneThree {
  int maxSize = 65;
  int N = 100;
  float fishX[] = new float[N];
  float fishY[] = new float[N];
  float fishSpeed[] = new float[N];
  color fishColor[] = new color[N];

  //pari
  float angle = 0.0;
  float offset = 80;  // doubled
  float scalar = 16;  // doubled
  float speed = 0.07;

  //X location variables
  float locX = 300;  // Centered on the X-axis
  float dirX = 1;
  float speedX = 3;

  //Y location variables
  float locY = 400;  // Centered on the Y-axis
  float dirY = 1;
  float speedY = 3;

  //tracking variables
  int ex = 0, ey = 0;  // Initial values, center adjustments applied later

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
    drawPari();
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

  void drawSquareBackground2() {
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
      "- Pari Manta (Myliobatoidei)",
      "- Dapat bertahan hidup 20 tahun lamanya",
      "- Merupakan filter feeder",
      "- Tidak pernah berhenti bergerak",
      "- Hewan yang cerdas dan ramah"
    };

    float textX = x + 20;
    float textY = y + 20;
    float lineSpacing = 50;
    for (int i = 0; i < facts.length; i++) {
      text(facts[i], textX, textY + i * lineSpacing);
    }
  }

  void drawCharacter() {
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

  void drawPari() {
    fill(112,128,144);
    noStroke();

    float y1 = offset + sin(angle) * scalar;
    float y2 = offset + sin(angle + 0.4) * scalar;
    float y3 = offset + sin(angle + 0.8) * scalar;
    float y4 = offset + sin(angle + 0.8) * scalar;

    // Center adjustments for ex and ey
    ex = (int)locX - 110;
    ey = (int)locY - 95;

    // Tail
    ellipse(ex + 320, ey + (y1 + 110), 80, 20);
    ellipse(ex + 360, ey + (y2 + 110), 80, 10);
    ellipse(ex + 400, ey + (y3 + 110), 80, 6);
    ellipse(ex + 440, ey + (y4 + 110), 80, 2);

    // Body of the stingray
    rect(ex + 120, ey + 130, 100, 120);
    ellipse(ex + 120, ey + 190, 160, 120);
    triangle(ex + 120, ey + 130, ex + 210, ey + 50, ex + 220, ey + 130);
    triangle(ex + 120, ey + 250, ex + 210, ey + 330, ex + 220, ey + 250);
    triangle(ex + 220, ey + 130, ex + 320, ey + 190, ex + 220, ey + 250);

    // Antennae
    stroke(1);
    stroke(112,128,144);
    noFill();
    strokeWeight(10);
    arc(ex + 100, ey + 180, 200, 120, radians(0), radians(140));
    arc(ex + 100, ey + 200, 200, 120, radians(220), radians(360));

    // Update angle
    angle += speed;
  }
}
