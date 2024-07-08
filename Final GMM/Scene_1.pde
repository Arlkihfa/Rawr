//opening
class SceneOne {
  float yoff = 0.0;
  ArrayList<Bird> birds = new ArrayList<Bird>(); // ArrayList to hold Bird objects

  float x = 2000; // Posisi horizontal awal karakter
  float y = 820; // Posisi vertikal awal karakter
  boolean leftLegUp = true; // Menyimpan keadaan gerakan kaki kiri
  boolean rightLegUp = false; // Menyimpan keadaan gerakan kaki kanan
  boolean movingLeft = true; // Menyimpan keadaan gerakan horizontal

  PImage gambar;
  boolean soundPlayed = false;
  void setup() {
    gambar = loadImage("papan bunaken.png");

    // Create initial birds
    for (int i = 0; i < 2; i++) {
      birds.add(new Bird(random(width), random(height / 4.5)));
    }
  }

  void draw() {
    background(59, 142, 255);

    // Gradiasi langit
    skyGradient(0, 0, width, height / 3, color(80, 215, 255), color(200, 255, 255));
    
    // Matahari
    fill(252, 211, 59);
    noStroke();
    ellipse(820, 100, 120, 120); 
    cloud();
    palm();
    fartherBeach();
    
    // Laut
    fill(225, 208, 146);
    beginShape();
    
    float xoff = 0; 
    
    // Iterasi untuk setiap piksel horizontal
    for (float i = 0; i <= width; i += 20) { // Menyesuaikan langkah iterasi agar lebih jarang di canvas yang lebih besar
      // Menghitung nilai y berdasarkan noise
      float y = map(noise(xoff, yoff), 0, 2, height / 1.5 , height - 0); // menyesuaikan ketinggian laut
      vertex(i, y);
      
      // Increment x dimension untuk noise
      xoff += 0.03; // gelombang
    }
    
    yoff += 0.01;
    
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);
    
    // Tanah
    fill(237, 201, 175);
    image(gambar, 0, 0);
    // Pohon palem
    pushMatrix();
    palm();
    translate(-215, 300);
    scale(0.2);
    palm(); 
    popMatrix(); // Panggil fungsi palm untuk menggambar pohon palem
    // Burung
    for (Bird bird : birds) {
      bird.update();
      bird.display();
    }
    // Memperbarui posisi karakter secara otomatis
    if (movingLeft) {
      x -= 2;
      if (x < width / 2) { // Batas kanan layar
        movingLeft = false;
      }
    }

    // baju
    fill(#ff0000);
    beginShape();
    vertex(x - 60, y - 60);
    vertex(x - 70, y - 48);
    vertex(x - 80, y - 40);
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

    // sarung tangan kiri
    fill(235, 185, 149);
    beginShape();
    vertex(x - 90, y - 85);
    vertex(x - 60, y - 60);
    vertex(x - 70, y - 48);
    vertex(x - 80, y - 40);
    vertex(x - 100, y - 55);
    endShape(CLOSE);
    ellipse(x - 100, y - 75, 35, 50);

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
    arc(x, y - 100, 15, 20, radians(50), radians(300));

    // mulut
    fill(0);
    arc(x, y - 70, 45, 30, radians(0), radians(180), CHORD); // Mulut hitam
    fill(255, 87, 51);
    ellipse(x, y - 62, 20, 15); // Mulut merah bagian bawah

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

    // Animasi gerakan kaki
    int legOffset = 10; // Offset untuk menggerakkan kaki
    if (x >= width / 2) {
      // Hentikan animasi gerakan kaki ketika posisi karakter sudah di tengah
      if (frameCount % 20 < 10) {
        leftLegUp = true;
        rightLegUp = false;
      } else {
        leftLegUp = false;
        rightLegUp = true;
      }
    } else {
      // Ketika posisi karakter belum mencapai tengah, gerakan kaki tidak bergerak
      leftLegUp = false;
      rightLegUp = false;
    }

    // sepatu kiri
    fill(235, 185, 149);
    beginShape();
    if (leftLegUp) {
      vertex(x - 10, y + 130 - legOffset);
      vertex(x - 45, y + 130 - legOffset);
      vertex(x - 50, y + 170 - legOffset);
      vertex(x - 10, y + 170 - legOffset);
      vertex(x - 10, y + 130 - legOffset);
    } else {
      vertex(x - 10, y + 130);
      vertex(x - 45, y + 130);
      vertex(x - 50, y + 170);
      vertex(x - 10, y + 170);
      vertex(x - 10, y + 130);
    }
    endShape(CLOSE);
    ellipse(x - 35, y + 170 - (leftLegUp ? legOffset : 0), 60, 35);

    // sepatu kanan
    beginShape();
    if (rightLegUp) {
      vertex(x + 10, y + 130 - legOffset);
      vertex(x + 45, y + 130 - legOffset);
      vertex(x + 50, y + 170 - legOffset);
      vertex(x + 10, y + 170 - legOffset);
      vertex(x + 10, y + 130 - legOffset);
    } else {
      vertex(x + 10, y + 130);
      vertex(x + 45, y + 130);
      vertex(x + 50, y + 170);
      vertex(x + 10, y + 170);
      vertex(x + 10, y + 130);
    }
    endShape(CLOSE);
    ellipse(x + 35, y + 170 - (rightLegUp ? legOffset : 0), 60, 35);

    // rambut badut yang tertata rapi di atas kepala
    int hairRadius = 80;
    fill(0); // Warna hitam
    for (int i = 200; i < 360; i += 15) { // Ubah rentang sudut dari 200 hingga 360 derajat
      float hairX = x + hairRadius * cos(radians(i));
      float hairY = y - 100 + hairRadius * sin(radians(i));
      ellipse(hairX, hairY, 30, 30);
    }
  }

  void skyGradient(float x, float y, float w, float h, color c1, color c2) {
    for (float dy = 0; dy < h; dy += 1) {
      stroke(lerpColor(c1, c2, dy / h));
      line(x, y + dy, x + w - 1, y + dy);
    }
  }

  /** Cloud */
  void cloud() {
    // Right cloud
    fill(240, 248, 255);
    ellipse(1780, 180, 480, 20);
    ellipse(1500, 186, 40, 0);
    ellipse(1400, 190, 240, 30);
    ellipse(1518, 192, 30, 20);
    ellipse(1600, 180, 260, 50);
    ellipse(1500, 150, 170, 70);
    
    // Left cloud
    ellipse(170, 180, 320, 20);
    ellipse(150, 150, 260, 60);
    ellipse(190, 120, 140, 80);
    ellipse(100, 160, 80, 40);
  }

  /** Farther beach */
  void fartherBeach() {
    noStroke();
    fill(225, 208, 146);
    beginShape();
    vertex(0, 480);
    vertex(0, 600);
    vertex(150, 580);
    vertex(400, 580);
    endShape(CLOSE);
  }

  /** Palm Tree */
  void palm() {
    // Trunk
    fill(155, 100, 0);
    beginShape();
    curveVertex(1400 + 400, 400);     // Adjusted x-coordinate for trunk
    curveVertex(1380 + 400, 500);     // Adjusted x-coordinate for trunk
    curveVertex(1360 + 400, 600);     // Adjusted x-coordinate for trunk
    curveVertex(1344 + 400, 700);     // Adjusted x-coordinate for trunk
    curveVertex(1332 + 400, 800);     // Adjusted x-coordinate for trunk
    curveVertex(1320 + 400, 900);     // Adjusted x-coordinate for trunk
    curveVertex(1316 + 400, 1000);    // Adjusted x-coordinate for trunk
    curveVertex(1316 + 400, 1100);    // Adjusted x-coordinate for trunk
    curveVertex(1330 + 400, 1220);    // Adjusted x-coordinate for trunk
    curveVertex(1400 + 400, 1260);    // Adjusted x-coordinate for trunk
    curveVertex(1390 + 400, 1000);    // Adjusted x-coordinate for trunk
    curveVertex(1386 + 400, 800);     // Adjusted x-coordinate for trunk
    curveVertex(1400 + 400, 600);     // Adjusted x-coordinate for trunk
    curveVertex(1420 + 400, 480);     // Adjusted x-coordinate for trunk
    curveVertex(1420 + 400, 400);     
    endShape(CLOSE);
    
    // Leaves
    fill(0, 150, 0);
    arc(1210 + 400, 544, 400, 280, 4.2, 6, CHORD);     // Adjusted x-coordinate for leaves
    arc(1294 + 400, 600, 440, 240, 3.2, 5.2, CHORD);   // Adjusted x-coordinate for leaves
    arc(1556 + 400, 532, 360, 200, 3.5, 5.5, CHORD);   
    arc(1448 + 400, 588, 500, 200, 4.4, 6.3, CHORD);   
    arc(1370 + 400, 792, 300, 600, 3.5, 4.9, CHORD);   
    arc(1408 + 400, 820, 320, 640, 4.6, 5.8, CHORD);   
  }

  /** Bird */
  void bird(float x, float y) {
    fill(0);
    noStroke();
    // Gambar burung 
    beginShape();
    vertex(x, y);
    vertex(x + 10, y + 5);
    vertex(x + 20, y);
    vertex(x + 10, y - 5);
    endShape(CLOSE);
  }

  class Bird {
    float x, y;
    float speed;
    float wingAngle;
    
    Bird(float x, float y) {
      this.x = x;
      this.y = y;
      this.speed = random(1, 3); // Random speed between 1 and 3 pixels/frame
      this.wingAngle = 0;
    }
    
    void update() {
      x += speed;
      if (x > width + 50) {
        x = -10;
        y = random(height);
      }
      
      // Wing flapping animation
      wingAngle = sin(radians(frameCount * 2)) * 3; // Adjust the flap speed by changing the multiplier
      
    }
    
    void display() {
      fill(0);
      // Body
      ellipse(x, y + 20, 50, 40);
      // Head
      ellipse(x + 20, y - 10, 40, 40);
      // Beak
      fill(255, 165, 0);
      triangle(x + 36, y, x + 40, y - 10, x + 50, y);
      // Eyes
      fill(255);
      ellipse(x + 20, y - 15, 20, 20);
      fill(0);
      ellipse(x + 15, y - 15, 5, 5); // Eyes
      // Wings
      fill(0);
      pushMatrix();
      translate(x - 15, y + 17);
      rotate(radians(wingAngle));
      ellipse(0, 0, 50, 10);
      ellipse(0, -8, 60, 10);
      ellipse(0, -16, 70, 10);
      popMatrix();
    }
  }
}
