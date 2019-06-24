// Color wave created with perlin noise over time by Cedric Omtzigt, s2145588
// inspiration for assignment came from these 2 videos
// guy from youtube: https://www.youtube.com/watch?v=le6t-kpXFZ4
// shiffman   : https://www.youtube.com/watch?v=BjoM9oKOAKY&list=PLRqwX-V7Uu6bgPNQAdxQZpJuJCjeOr7VD&index=6

//perlin noise in the third dimention: time

//drag the mouse over the screen to add particles on the screen

FlowField ff;
ParticleSystem ps;
boolean debug = false; //turn display of flowfield vectors on or off

void setup() {
  size(1200, 700, P2D);
  //background(255);
  ps = new ParticleSystem();
  ff = new FlowField();
  ff.update();
  colorMode(HSB, 255);

  for (int i = 0; i < 2500; i++) {
    ps.addParticle(random(width), random(height));
  }
}

void draw() {
  fill(0, 3);
  rect(0, 0, width, height);
  
  if (debug) {
    ff.display();
  }
  
  ff.update();
  ps.run(ff);
}

void mouseDragged() {
  for (int i = 0; i < 10; i++) {
    ps.addParticle(mouseX, mouseY);
  }
}

void keyPressed() {
  if (keyCode == ' ') {
    debug = true;
  }
  if (keyCode == 'P') {
    debug = false;
  }
}
