class Mascot extends BodyPart {
  private Arm leftArm, rightArm;
  private color fillColor,
                strokeColor = #555555;
  private Head head;
  private Neck neck;
  private Trunk trunk;
  private Foot leftFoot, rightFoot;
  private int detail = 10,
              trunkRadius = 120,
              headRadius = 95 + (int)random(-10, 10),
              headPosition = -(int)random(trunkRadius*0.5 + headRadius, trunkRadius*1.5),
              strokeWidth = 4;
  Mascot() {
    int blueComponent = (int)random(127, 255),
        greenComponent = (int)random(blueComponent, 255);
    fillColor = color(random(greenComponent, 255), greenComponent, blueComponent);
    head = new Head(headRadius);
    head.setColor(fillColor);
    head.moveBy(0, headPosition);
    trunk = new Trunk(trunkRadius);
    RPoint[] trunkPoints = trunk.shape.getPoints(),
             headPoints = head.shape.getPoints();
    RPoint[] neckPoints = new RPoint[8];
    RPoint[] headBoundingBox = head.shape.getBoundsPoints();
    RPoint[] trunkBoundingBox = trunk.shape.getBoundsPoints();
    float neckWidthUpper = random(0.65, 0.95)*(headBoundingBox[1].x - headBoundingBox[0].x);
    float neckWidthLower = max(random(0.65, 0.95)*(trunkBoundingBox[1].x - trunkBoundingBox[0].x), neckWidthUpper);
    neckPoints[0] = new RPoint(- neckWidthUpper/2, headPosition);
    neckPoints[1] = new RPoint(neckWidthUpper/2, headPosition);
    neckPoints[2] = new RPoint(neckWidthLower/2, 0);
    neckPoints[3] = new RPoint(- neckWidthLower/2, 0);
    neck = new Neck(neckPoints);
    rightFoot = new Foot();
    leftFoot = rightFoot.cloneReversed();
    //rightFoot = leftFoot.clone().reverseX();
    rightArm = new Arm();
    leftArm = rightArm.cloneReversed();
    leftArm.shape.rotate(PI/3);
    rightArm.shape.rotate(-PI/3);
    rightArm.translate(40, -40);
    leftArm.translate(-40, -40);
    leftArm.setColor(fillColor);
    rightArm.setColor(fillColor);
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
    /*RPoint[] points = shape.getPoints();
    beginShape();
    for(int i = 0; i < points.length + 3; i++) {
      int j = i % points.length;
      RPoint point = points[j];
      curveVertex(point.x, point.y);
      if(debug) {
        ellipse(point.x, point.y, 20, 20);
      }
    }
    endShape();*/
    shape.draw();
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
    pushMatrix();
    translate(0, headPosition);
    head.drawFace();
    popMatrix();
    //neck.shape.draw();
    popMatrix();
  }
}

