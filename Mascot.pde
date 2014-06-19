class Mascot {
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
  Mascot() {
    int blueComponent = (int)random(127, 255),
        greenComponent = (int)random(blueComponent, 255);
    fillColor = color(random(greenComponent, 255), greenComponent, blueComponent);
    head = new Head(headRadius);
    trunk = new Trunk(trunkRadius);
    rightFoot = new Foot();
    leftFoot = rightFoot.cloneReversed();
    //rightFoot = leftFoot.clone().reverseX();
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
    for(int i = trunk.points.length/2 - 1; i < trunk.points.length; i++) {
      int j = i % trunk.points.length;
      PVector point = trunk.points[j];
      curveVertex(point.x, point.y);
      if(drawPoints) {
        ellipse(point.x, point.y, 10, 10);
      }
    }
    for(int i = 1; i < head.points.length; i++) {
      int j = i % head.points.length;
      PVector point = head.points[j];
      curveVertex(point.x, point.y + headPosition);
      if(drawPoints) {
        ellipse(point.x, point.y + headPosition, 10, 10);
      }
    }
    for(int i = 1; i < min(trunk.points.length/2 + 3, trunk.points.length - 1); i++) {
      int j = i % trunk.points.length;
      PVector point = trunk.points[j];
      curveVertex(point.x, point.y);
      if(drawPoints) {
        ellipse(point.x, point.y, 10, 10);
      }
    }
    endShape();
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

