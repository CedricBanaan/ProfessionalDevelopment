class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  int maxspeed;
  float maxforce;
  float h;
  final static float diam = 1;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-10, 10), random(-10, 10));
    location = l.copy();
    maxspeed = 4;
    maxforce = 0.5;
  }

  void run() {
    update();
    display();
    edge();
  }

  // Method to update position
  void update() {
    location.add(velocity);
    velocity.limit(maxspeed);
    velocity.add(acceleration);
    acceleration.mult(0);
  }

  // Method to display
  void display() {
    stroke(h, 255, 255, 5);
    h += 1;
    if (h >= 255) {
      h = 0;
    }
    strokeWeight(1);
    fill(random(255));
    ellipse(location.x, location.y, diam, diam);
  }

  void edge() {
    if (location.x < 0) {
      location.x = width;
    } 
    if (location.x > width) {
      location.x = 0;
    } 
    if (location.y < 0) {
      location.y = height;
    }  
    if (location.y > height) {
      location.y = 0;
    }
  }

  //pass by reference  https://www.youtube.com/watch?v=hNR6fsksEu8
  //pass by reference that allows us to access flowfield variables
  void follow(FlowField flowfield) {
    int x = floor(location.x / flowfield.scl);
    int y = floor(location.y / flowfield.scl);
    int index = x + y * flowfield.cols; //2D value to 1D array
    //println(x, y, flowfield.cols);
    PVector force = flowfield.flowfield[index];
    addForce(force);
  }

  //the following function was applied from the book: nature of code, by Daniel Shiffman
  // acceleration = Force/mass and thus all external forces are added to the PVector acceleration 
  void addForce(PVector force) { 
    acceleration.add(force);
  }
}
