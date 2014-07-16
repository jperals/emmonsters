class Head extends BodyPart {
  private Antenna leftAntenna,
                  rightAntenna;
  private boolean withAntennae,
                  withEyelashes,
                  withHair;
  private color strokeColor;
  private Ear leftEar, rightEar;
  private Eye leftEye, rightEye;
  private HairMass hairMass;
  private int detail,
              earDetail,
              eyeRadius,
              eyeSeparation = 38,
              radius,
              snoutRadius,
              strokeWidth = 5;
  private Snout snout;
  Head() {
    this(105);
  }
  Head(int radius) {
    this.radius = radius;
    strokeColor = #555555;
    withAntennae = randomBoolean(0.25);
    withEyelashes = randomBoolean();
    withHair = randomBoolean(0.3);
    detail = (int)random(4, 10);
    earDetail = (int)random(3, 6);
    eyeRadius = (int)random(25, 38);
    snoutRadius = (int)random(25, 45);
    leftAntenna = new Antenna();
    rightAntenna = leftAntenna.cloneReversed();
    leftAntenna.shape.rotate(-PI/8);
    rightAntenna.shape.rotate(PI/8);
    leftAntenna.moveBy(-radius/3, -radius*3/4);
    rightAntenna.moveBy(radius/3, -radius*3/4);
    leftEar = new Ear(earDetail);
    rightEar = leftEar.cloneReversed();
    addChild(leftEar);
    addChild(rightEar);
    hairMass = new HairMass();
    leftEye = new Eye(eyeRadius);
    rightEye = new Eye(eyeRadius);
    leftEye.hasLashes = withEyelashes;
    rightEye.hasLashes = withEyelashes;
    snout = new Snout(snoutRadius);
    snout.fillColor = fillColor;
    snout.moveBy(0, eyeSeparation/2 + snoutRadius/2);
    float angle = PI/2,
          angleIncrement = TWO_PI/detail;
    vertices = new RPoint[detail];
    for(int i = 0; i < detail; i++) {
      //float distance = radius;
      float distance = radius*(1 + (noise(i) - 0.5)/5);
      float x = distance*cos(angle),
            y = distance*sin(angle);
      vertices[i] = new RPoint(x, y);
      angle += angleIncrement;
    }
    shape = toBezier(vertices);
    RPoint[] boundingBox = shape.getBoundsPoints();
    hairMass.moveBy(0, boundingBox[0].y);
    //println(snout.shape.getCenter().x, snout.shape.getCenter().y);
    //boolean overflowsHead = !(shape.toShape().contains(snout.shape.getPoints()));
    boolean snoutOverflowsHead = false;
    //RPoint[] points = snout.shape.getPoints();
    int i = 0;
    while(i < vertices.length && !snoutOverflowsHead) {
      RPoint point = vertices[i];
      snoutOverflowsHead = sqrt(sq(point.x) + sq(point.y)) > radius;
      i++;
    }
    snout.overflowsHead = snoutOverflowsHead;
    shape = shape.union(snout.shape);
    if(!withHair && randomBoolean(0.35)) {
      shape = shape.union(hairMass.shape);
    }
    this.addChild(snout);
  }
  public void draw() {
    RPoint[] points = shape.getPoints();
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
  public void drawAntennae() {
    if(withAntennae) {
      leftAntenna.draw();
      rightAntenna.draw();
    }
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
    snout.draw();
    pushMatrix();
    translate(-eyeSeparation, -radius/10);
    leftEye.draw();
    popMatrix();
    pushMatrix();
    translate(eyeSeparation, -radius/10);
    rightEye.draw();
    popMatrix();
    //bezierShape.draw();
  }
  public void drawHair() {
    if(withHair) {
      hairMass.draw();
    }
  }
/*  public void setColor(color desiredColor) {
  }*/
  public void setSnoutColor(color snoutColor) {
    snout.setBodyColor(fillColor);
    snout.setColor(snoutColor);
  }
}

