class Mascot {
  private color fillColor = #FFFFFF,
                strokeColor = #555555;
  private Head head;
  private Trunk trunk;
  private int detail = 10,
              trunkRadius = 100,
              headRadius = 75 + (int)random(-10, 10),
              headPosition = -(int)random(trunkRadius + headRadius, trunkRadius*2),
              strokeWidth = 4;
  Mascot() {
    head = new Head(headRadius);
    trunk = new Trunk(trunkRadius);
  }
  public void draw() {
    pushMatrix();
    translate(width/2, height/2 - headPosition/4);
    fill(fillColor);
    //noFill();
    stroke(strokeColor);
    strokeWeight(strokeWidth);
    beginShape();
    for(int i = trunk.points.length/2; i < trunk.points.length; i++) {
      int j = i % trunk.points.length;
      PVector point = trunk.points[j];
      curveVertex(point.x, point.y);
      //ellipse(point.x, point.y, 10, 10);
    }
    for(int i = 1; i < head.points.length; i++) {
      int j = i % detail;
      PVector point = head.points[j];
      curveVertex(point.x, point.y + headPosition);
      //ellipse(point.x, point.y + headPosition, 10, 10);
    }
    for(int i = 1; i < trunk.points.length/2 + 3; i++) {
      int j = i % detail;
      PVector point = trunk.points[j];
      curveVertex(point.x, point.y);
      //ellipse(point.x, point.y, 10, 10);
    }
    endShape();
    translate(0, headPosition);
    head.drawFace();
    popMatrix();
    /*trunk.draw();
    pushMatrix();
    translate(0, headPosition);
    head.draw();
    popMatrix();*/
  }
}

