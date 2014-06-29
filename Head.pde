class Head extends BodyPart {
  private color strokeColor;
  private Ear leftEar, rightEar;
  private Eye leftEye, rightEye;
  private int detail,
              earDetail,
              eyeRadius,
              eyeSeparation = 38,
              radius,
              snoutRadius,
              strokeWidth = 5;
  private RShape bezierShape;
  private Snout snout;
  Head() {
    this(75);
  }
  Head(int radius) {
    this.radius = radius;
    strokeColor = #555555;
    detail = (int)random(6, 15);
    earDetail = (int)random(3, 6);
    eyeRadius = (int)random(25, 38);
    snoutRadius = (int)random(25, 45);
    leftEar = new Ear(earDetail);
    rightEar = leftEar.reversed();
    leftEye = new Eye(eyeRadius);
    rightEye = new Eye(eyeRadius);
    snout = new Snout(snoutRadius);
    snout.fillColor = fillColor;
    snout.moveBy(0, eyeSeparation/2 + snoutRadius/2);
    float angle = PI/2,
          angleIncrement = TWO_PI/detail;
    bezierShape = new RShape();
    RPoint[] vertices = new RPoint[detail];
    for(int i = 0; i < detail; i++) {
      //float distance = radius;
      float distance = radius*(1 + (noise(i) - 0.5)/5);
      float x = distance*cos(angle),
            y = distance*sin(angle);
      vertices[i] = new RPoint(x, y);
      angle += angleIncrement;
    }
    PVector lastVertex = new PVector(vertices[detail-1].x, vertices[detail-1].y),
            firstVertex = new PVector(vertices[0].x, vertices[0].y);
    PVector originalLocation = PVector.lerp(lastVertex, firstVertex, 0.5);
    bezierShape.addMoveTo(originalLocation.x, originalLocation.y);
    for(int i = 0; i < detail; i++) {
      int previousIndex = i == 0 ? detail - 1 : i - 1,
          nextIndex = i == detail - 1 ? 0 : i + 1;
      PVector previousVertex = new PVector(vertices[previousIndex].x, vertices[previousIndex].y),
              currentVertex = new PVector(vertices[i].x, vertices[i].y),
              nextVertex = new PVector(vertices[nextIndex].x, vertices[nextIndex].y);
      PVector firstControlPoint = PVector.lerp(previousVertex, currentVertex, 0.75),
              secondControlPoint = PVector.lerp(currentVertex, nextVertex, 0.25),
              destinationPoint = PVector.lerp(currentVertex, nextVertex, 0.5);
      //println(destinationPoint.x, destinationPoint.y);
      bezierShape.addBezierTo(firstControlPoint.x, firstControlPoint.y,
                              secondControlPoint.x, secondControlPoint.y,
                              destinationPoint.x, destinationPoint.y);
      //println(firstControlPoint.x, firstControlPoint.y, secondControlPoint.x, secondControlPoint.y, destinationPoint.x, destinationPoint.y);
    }
    shape = bezierShape.toPolygon();
    //println(snout.shape.getCenter().x, snout.shape.getCenter().y);
    //boolean overflowsHead = !(shape.toShape().contains(snout.shape.getPoints()));
    boolean snoutOverflowsHead = false;
    RPoint[] points = snout.shape.getPoints();
    int i = 0;
    while(i < points.length && !snoutOverflowsHead) {
      RPoint point = points[i];
      snoutOverflowsHead = sqrt(sq(point.x) + sq(point.y)) > radius;
      i++;
    }
    snout.overflowsHead = snoutOverflowsHead;
    shape = shape.union(snout.shape);
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
}

