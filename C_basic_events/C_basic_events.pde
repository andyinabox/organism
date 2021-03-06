float f;
float circ = 100;
float orgX;
float orgY;

color bgColor;

void setup() {
  size(500, 500);
  smooth();

  orgX = mouseX;
  orgY = mouseY;

  bgColor = color(random(230, 255), random(230, 255), random(230, 255));

}

void draw() {
  background(bgColor);
  
  orgX = orgX + (mouseX-orgX)/10;
  orgY = orgY + (mouseY-orgY)/10;
  
  drawOrganism(orgX, orgY);
  f = frameCount*.01;
}

void drawOrganism(float x, float y) {
  translate(x, y);
  float scale = map(sin(radians(frameCount)), -1, 1, 1, 1.5);
  scale(scale);
  rotate(radians(frameCount));
  
  noStroke();
  

  fill(200, 234, noise(f, x, y)*189, 100);
  ellipse(0, 0, circ, circ);
  
  translate(-50, -50);
  
  if(mousePressed) {
    noFill();
    strokeWeight(5);
    stroke(129, 100, 220, 100);
  } else {
    fill(129, 100, 220, 100);
  } 

  beginShape();
    curveVertex(0, 0);
    curveVertex(noise(x, f)*50, noise(y, f)*50);
    curveVertex(-noise(f, x)*40, noise(f, y)*40);
    curveVertex(-noise(y, f)*30, -noise(x, f)*30);
    curveVertex(noise(f, y)*20, -noise(f, x)*20);
    curveVertex(noise(x, f)*50, noise(y, f)*50);
    curveVertex(0, 0);
  endShape(CLOSE);
  
}


void keyPressed() {
  bgColor = color(random(230, 255), random(230, 255), random(230, 255));
}