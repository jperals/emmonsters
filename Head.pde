class Head {
  float[] points;
  color fillColor,
        strokeColor;
  Eye leftEye, rightEye;
  int detail = 10,
      eyeSeparation = 38,
      radius,
      snoutRadius = 30,
      strokeWidth = 5;
  Snout snout;
  Head() {
    this(75);
  }
  Head(int radius) {
    this.radius = radius;
    fillColor = #FFFFFF;
    strokeColor = #555555;
    leftEye = new Eye(eyeSeparation);
    rightEye = new Eye(eyeSeparation);
    snout = new Snout(snoutRadius);
    points = new float[detail];
    for(int i = 0; i < detail; i++) {
      points[i] = radius*(1 + (noise(i) - 0.5)/5);
    }
  }
  public void draw() {
    fill(fillColor);
    stroke(strokeColor);
    strokeWeight(strokeWidth);
    pushMatrix();
    beginShape();
    rotate(PI/2);
    for(int i = 0; i < detail + 1; i++) {
      int j = i % detail;
      float angle = TWO_PI * (float)j/detail;
      float x = points[j]*cos(angle),
            y = points[j]*sin(angle);
      curveVertex(x, y);
    }
    endShape();
    popMatrix();
    pushMatrix();
    translate(-eyeSeparation, -radius/10);
    leftEye.draw();
    popMatrix();
    pushMatrix();
    translate(eyeSeparation, -radius/10);
    rightEye.draw();
    popMatrix();
    pushMatrix();
    translate(0, eyeSeparation/2 + snoutRadius/2);
    snout.draw();
    popMatrix();
  }
}

