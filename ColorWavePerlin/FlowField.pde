class FlowField {

  static final float inc = 0.1;
  static final int scl = 25;
  int cols, rows;
  float zoff = 0;
  PVector flowfield[];

  FlowField() {
    cols = floor(width/scl)+1; //+1 so that it index doesn't go outOfBounds
    rows = floor(height / scl)+1;
    flowfield = new PVector[cols * rows]; //create flowfield grid spots
  }

  //calculations for each spot in the array
  void update() {
    float yoff = 0;
    for (int y = 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        //float r = noise(xoff, yoff)*255;
        float angle = noise(xoff, yoff, zoff)*2*TWO_PI;
        PVector vector = PVector.fromAngle(angle);
        vector.setMag(1);
        int index = x + y * cols;
        flowfield[index] = vector;

        xoff += inc;
      }
      yoff += inc;
    }
    zoff += 0.01;
  }

  //displays the vector lines moving with perlin noise
  void display() {
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < cols; x++) {
        int index = x + y * cols;
        PVector vector = flowfield[index];

        //fill(r);
        //rect(x*scl, y*scl, scl, scl);
        stroke(0, 100);
        pushMatrix();
        translate(x*scl, y*scl);
        rotate(vector.heading());
        line(0, 0, scl, 0);
        popMatrix();
      }
    }
  }
}
