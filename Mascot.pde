class Mascot {
  private Head head;
  private Trunk trunk;
  private int trunkRadius = 100;
  private int headRadius = 75 + (int)random(-10, 10);
              
  Mascot() {
    head = new Head(headRadius);
    trunk = new Trunk(trunkRadius);
  }
  public void draw() {
    pushMatrix();
    translate(width/2, height/2);
    popMatrix();
    trunk.draw();
    pushMatrix();
    translate(0, -trunkRadius*3/2);
    head.draw();
    popMatrix();
  }
}

