public class Foot implements Cloneable {
  public PVector[] points;
  public int footLength;
  private int detail,
              footWidth;
  Foot() {
    this((int)random(4, 6));
  }
  Foot(int detail) {
    this.detail = detail;
    footWidth = (int)random(35, 45);
    footLength = (int)((float)footWidth * random(1.5, 2));
    points = new PVector[detail];
    float angle = PI/2 + PI/3,
          angleIncrement = TWO_PI/detail;
    for(int i = 0; i < detail; i++) {
      //float distance = radius;
      float distance = footWidth*(1 + (noise(i) - 0.5)/5);
      float x = distance*cos(angle),
            y = distance*sin(angle);
      points[i] = new PVector(x, y);
      angle += angleIncrement;
    }
  }
  public void draw() {
    pushMatrix();
    beginShape();
    scale(1, (float)footLength/footWidth);
    for(int i = 0; i < detail + 3; i++) {
      int j = i % detail;
      PVector point = points[j];
      curveVertex(point.x, point.y);
    }
    endShape();
    popMatrix();
  }
  public Foot cloneReversed() {
    Foot reversedFoot = new Foot(detail);
    for(int i = 0; i < detail; i++) {
      reversedFoot.points[i].x = - this.points[i].x;
    }
    reversedFoot.footLength = this.footLength;
    return reversedFoot;
  }
  public void reverseX() {
    for(int i = 0; i < detail; i++) {
      points[i].x = - points[i].x;
    }
  }
  public Object clone() throws CloneNotSupportedException {  
      return super.clone();  
  }
}
