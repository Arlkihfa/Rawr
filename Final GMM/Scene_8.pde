//ending
class SceneEight {
  String textToDisplay = "Animasi ini dibuat untuk memperkenalkan beberapa fauna yang dapat ditemukan di Taman Laut Bunaken, disertai dengan visualisasi dan narasi yang menarik untuk mengedukasi dan menginspirasi penonton tentang pentingnya konservasi laut.";
  int maxSize = 65;
  color waterColor;
  final int nb = 30;
  SeaWeed[] weeds;
  PVector rootNoise = new PVector(random(123456), random(123456));
  int mode = 0;
    
  //characther
  float swimAngle = 8; 

  void setup() {
    stroke(0, 150, 255, 65);
    for (int i = 0; i < maxSize; i++) {
    }

    waterColor = color(200, 80, 60);

    weeds = new SeaWeed[nb];
    for (int i = 0; i < nb; i++) {
      weeds[i] = new SeaWeed(random(0, width), height);
    }
  }

  void draw() {
    drawBackground();
    drawCliffs();
    drawSeaweed();
    drawSand();
    drawRocks();
    drawText(); 
    swimAngle += 0.1;
    drawCharacter();
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

    for (int y = 0; y < height; y++) {
      float inter = map(y, 0, height, 0, 1);
      color c = lerpColor(waterColor, bottomColor, inter);
      stroke(c);
      line(0, y, width, y);
    }
  }

  void drawCliffs() {
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

  void drawSand() {
    fill(200, 193, 131);
    noStroke();
    beginShape();
    vertex(0, height);
    vertex(0, height - 200);
    bezierVertex(width * 0.1, height - 150, width * 0.3, height - 250, width * 0.4, height - 200);
    bezierVertex(width * 0.5, height - 150, width * 0.7, height - 250, width * 0.8, height - 200);
    vertex(width, height - 200);
    vertex(width, height);
    endShape(CLOSE);
  }

  void drawRocks() {
    color rockColor = color(112, 128, 144);
    noStroke();

    fill(rockColor);
    ellipse(width * 0.22, height - 80, 80, 40);
    ellipse(width * 0.32, height - 100, 100, 50);
    ellipse(width * 0.42, height - 70, 70, 35);
    ellipse(width * 0.72, height - 90, 90, 45);
    ellipse(width * 0.82, height - 110, 110, 55);
  }

  void drawSeaweed() {
    for (int i = 0; i < nb; i++) {
      SeaWeed weed = weeds[i];
      weed.update();
    }
  }

  void drawText() {
    fill(255);
    textSize(40);
    textAlign(CENTER, CENTER);

    float x = width / 2;
    float y = height / 2;

    String[] lines = splitTextToLines(textToDisplay, width - 40);

    for (int i = 0; i < lines.length; i++) {
      text(lines[i], x, y + (i - lines.length / 2) * 50);
    }
  }

  String[] splitTextToLines(String text, float maxWidth) {
    String[] words = text.split(" ");
    ArrayList<String> lines = new ArrayList<String>();
    String currentLine = words[0];

    for (int i = 1; i < words.length; i++) {
      String testLine = currentLine + " " + words[i];
      if (textWidth(testLine) < maxWidth) {
        currentLine = testLine;
      } else {
        lines.add(currentLine);
        currentLine = words[i];
      }
    }
    lines.add(currentLine);

    return lines.toArray(new String[lines.size()]);
  }

  class SeaWeed {
    final static float DIST_MAX = 3;
    final static float maxNbSeg = 100;
    final static float minNbSeg = 35;
    final static float maxWidth = 30;
    final static float minWidth = 11;
    final static float FLOTATION = 3;
    int nbSegments = (int) random(minNbSeg, maxNbSeg);
    PVector[] pos;
    color[] cols;
    PVector rootNoise = new PVector(random(123456), random(123456));
    float x;
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

      pos[0] = new PVector(x, height - 150);
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
}
