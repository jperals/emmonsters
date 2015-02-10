class Emmonster extends BodyPart {
  private Arm leftArm,
              rightArm;
  private Belly belly;
  private boolean drawBelly,
                  hasWings,
                  hasArms;
  private color secondaryColor,
                strokeColor = #555555;
  private Head head;
  private int detail = 10,
              trunkRadius = 120,
              headRadius = 105,
              headPosition = -(int)random(trunkRadius*0.5 + headRadius, trunkRadius*1.5),
              strokeWidth = 4;
  private Neck neck;
  private Trunk trunk;
  private Foot leftFoot,
               rightFoot;
  private Wing leftWing,
               rightWing;
  Emmonster() {
    secondaryColor = getNewColor();
    head = new Head(headRadius);
    belly = new Belly(headRadius*2/3);
    drawBelly = randomBoolean(0.25);
    hasWings = randomBoolean(0.25);
    hasArms = !hasWings || randomBoolean(0.5);
    head.setColor(fillColor, true);
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
    leftFoot = rightFoot.cloneReversed();//(Foot)rightFoot.clone();
    rightFoot.shape.rotate(PI*5/3);
    //leftFoot.shape.rotate(PI-PI*5/3);
    leftFoot.moveBy(-80, trunkRadius - 50);
    rightFoot.moveBy(80, trunkRadius - 50);
    //rightFoot = leftFoot.clone().reverseX();
    leftFoot.setColor(secondaryColor);
    rightFoot.setColor(secondaryColor);
    belly.setColor(secondaryColor);
    head.setSnoutColor(secondaryColor);
    rightArm = new Arm();
    leftArm = rightArm.cloneReversed();
    leftArm.shape.rotate(PI/3);
    rightArm.shape.rotate(-PI/3);
    rightArm.translate(40, -40);
    leftArm.translate(-40, -40);
    leftArm.setColor(fillColor);
    rightArm.setColor(fillColor);
    color wingColor = getNewColor((int)red(fillColor));
    leftWing = new Wing(-120);
    rightWing = new Wing(120);
    float wingAngle = random(PI/12, PI/6);
    leftWing.setColor(wingColor);
    rightWing.setColor(wingColor);
    leftWing.shape.translate(-trunkRadius*2/3, -trunkRadius/3);
    leftWing.shape.rotate(wingAngle);
    rightWing.shape.translate(trunkRadius*2/3, -trunkRadius/3);
    rightWing.shape.rotate(-wingAngle);
    shape = trunk.shape.union(neck.shape).union(head.shape);
    if(!hasArms) {
      shape = shape.union(leftWing.shape).union(rightWing.shape);
    }
  }
  public void draw() {
    pushMatrix();
    translate(width/2, height/2 - headPosition/2);
    fill(fillColor);
    stroke(strokeColor);
    strokeWeight(strokeWidth);
    if(hasWings && hasArms) {
      drawWings();
    }
    pushMatrix();
    translate(0, headPosition);
    head.drawAntennae();
    head.drawEars();
    popMatrix();
    shape.draw();
    if(debug) {
      //neck.shape.draw();
      head.shape.draw();
    }
    if(drawBelly) {
      belly.draw();
    }
    if(hasArms) {
      rightArm.draw();
      leftArm.draw();
    }
    leftFoot.draw();
    rightFoot.draw();
    pushMatrix();
    translate(0, headPosition);
    head.drawFace();
    head.drawHair();
    popMatrix();
    popMatrix();
  }
  private void drawWings() {
    rightWing.draw();
    leftWing.draw();
  }
}

