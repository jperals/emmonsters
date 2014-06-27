class Mascot {
  private Arm leftArm, rightArm;
  private color fillColor,
                strokeColor = #555555;
  private Head head;
  private Neck neck;
  private Trunk trunk;
  private Foot leftFoot, rightFoot;
  private int detail = 10,
              trunkRadius = 100,
              headRadius = 75 + (int)random(-10, 10),
              headPosition = -(int)random(trunkRadius + headRadius, trunkRadius*2),
              strokeWidth = 4;
  private RPolygon shape;
  Mascot() {
    int blueComponent = (int)random(127, 255),
        greenComponent = (int)random(blueComponent, 255);
    fillColor = color(random(greenComponent, 255), greenComponent, blueComponent);
    head = new Head(headRadius);
    head.shape.translate(0, headPosition);
    trunk = new Trunk(trunkRadius);
    RPoint[] trunkPoints = trunk.shape.getPoints(),
             headPoints = head.shape.getPoints();
    RPoint[] neckPoints = new RPoint[8];
    neckPoints[0] = trunkPoints[1];
    neckPoints[1] = trunkPoints[trunkPoints.length - 1];
    neckPoints[2] = new RPoint(headPoints[1].x, headPoints[1].y - 10);
    neckPoints[3] = new RPoint(headPoints[headPoints.length - 1].x, headPoints[headPoints.length - 1].y - 10);
    neck = new Neck(neckPoints);
    rightFoot = new Foot();
    leftFoot = rightFoot.cloneReversed();
    //rightFoot = leftFoot.clone().reverseX();
    rightArm = new Arm();
    rightArm.shape.rotate(-PI/3);
    leftArm = rightArm.cloneReversed();
    rightArm.translate(40, -40);
    leftArm.translate(-40, -40);
    shape = trunk.shape.union(neck.shape).union(head.shape);
  }
  public void draw() {
    pushMatrix();
    translate(width/2, height/2 - headPosition/2);
    fill(fillColor);
    //noFill();
    stroke(strokeColor);
    strokeWeight(strokeWidth);
    pushMatrix();
    translate(0, headPosition);
    head.drawEars();
    popMatrix();
    RPoint[] points = shape.getPoints();
    beginShape();
    for(int i = 0; i < points.length + 3; i++) {
      int j = i % points.length;
      RPoint point = points[j];
      curveVertex(point.x, point.y);
      if(debug) {
        ellipse(point.x, point.y, 20, 20);
      }
    }
    endShape();
    if(debug) {
      //neck.shape.draw();
      head.shape.draw();
    }
    rightArm.draw();
    leftArm.draw();
    pushMatrix();
    translate(-60, trunkRadius - 20);
    leftFoot.draw();
    popMatrix();
    pushMatrix();
    translate(60, trunkRadius - 20);
    rightFoot.draw();
    popMatrix();
    translate(0, headPosition);
    head.drawFace();
    popMatrix();
  }
}

