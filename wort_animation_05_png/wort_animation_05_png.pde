color bg = 0;
color fg = #f1f1f1;

int tilesX = 150;
int tilesY = 150;

PImage img;

void setup() {
  size(900, 900);
  img = loadImage("lebewesen_text.png");
  img.resize(tilesX,tilesY);
}

void draw() {
  background(0);
  fill(fg);
  noStroke();

  float tileW = width / tilesX;
  float tileH = height / tilesY;

  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {

      color c = img.get(x, y);
      float b = brightness(c);
      float s = map(b, 0, 255, 0, tileW);
      
      float wave = map(tan(radians(frameCount + x + y)),-1,1,-20,20);

      ellipse(x * tileW + wave, y * tileH, s, s);
    }
  }
}
