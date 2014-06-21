class Mascot {
  private Arm leftArm, rightArm;
  private boolean drawPoints = false;
  private color fillColor,
                strokeColor = #555555;
  private Head head;
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
    trunk = new Trunk(trunkRadius);
    rightFoot = new Foot();
    leftFoot = rightFoot.cloneReversed();
    //rightFoot = leftFoot.clone().reverseX();
    rightArm = new Arm();
    leftArm = rightArm.cloneReversed();
    shape = trunk.shape.union(leftArm.shape).union(rightArm.shape);
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
    beginShape();
    RPoint[] trunkPoints = trunk.shape.getPoints(),
             headPoints = head.shape.getPoints();
    for(int i = trunkPoints.length/2 - 1; i < trunkPoints.length; i++) {
      int j = i % trunkPoints.length;
      RPoint point = trunkPoints[j];
      curveVertex(point.x, point.y);
      if(drawPoints) {
        ellipse(point.x, point.y, 10, 10);
      }
    }
    for(int i = 1; i < headPoints.length; i++) {
      int j = i % headPoints.length;
      RPoint point = headPoints[j];
      curveVertex(point.x, point.y + headPosition);
      if(drawPoints) {
        ellipse(point.x, point.y + headPosition, 10, 10);
      }
    }
    for(int i = 1; i < min(trunkPoints.length/2 + 3, trunkPoints.length - 1); i++) {
      int j = i % trunkPoints.length;
      RPoint point = trunkPoints[j];
      curveVertex(point.x, point.y);
      if(drawPoints) {
        ellipse(point.x, point.y, 10, 10);
      }
    }
    endShape();
    //leftArm.draw();
    //rightArm.draw();
    shape.draw();
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

