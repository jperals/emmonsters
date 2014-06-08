class Head {
  public PVector[] points;
  color fillColor,
        strokeColor;
  Ear leftEar, rightEar;
  Eye leftEye, rightEye;
  private int detail,
              earDetail,
              eyeRadius,
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
    detail = (int)random(4, 15);
    eyeRadius = (int)random(25, 38);
    earDetail = (int)random(3, 6);
    leftEar = new Ear(earDetail);
    rightEar = leftEar.reversed();
    leftEye = new Eye(eyeRadius);
    rightEye = new Eye(eyeRadius);
    snout = new Snout(snoutRadius);
    points = new PVector[detail];
    float angle = PI/2,
          angleIncrement = TWO_PI/detail;
    for(int i = 0; i < detail; i++) {
      //float distance = radius;
      float distance = radius*(1 + (noise(i) - 0.5)/5);
      float x = distance*cos(angle),
            y = distance*sin(angle);
      points[i] = new PVector(x, y);
      angle += angleIncrement;
    }
  }
  public void draw() {
    fill(fillColor);
    stroke(strokeColor);
    strokeWeight(strokeWidth);
    pushMatrix();
    beginShape();
    for(int i = 0; i < detail + 1; i++) {
      int j = i % detail;
      curveVertex(points[j].x, points[j].y);
    }
    endShape();
    popMatrix();
    drawFace();
  }
  public void drawEars() {
    float earAngle = 45*2*PI/360;
    pushMatrix();
    rotate(-earAngle);
    translate(0, -radius*3/4);
    leftEar.draw();
    popMatrix();
    pushMatrix();
    rotate(earAngle);
    translate(0, -radius*3/4);
    rightEar.draw();
    popMatrix();
  }
  public void drawFace() {
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

