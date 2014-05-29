class Snout {
  private color baseColor = #BB9944,
                noseColor = #331100;
  private int baseRadius, noseRadius;
  Snout() {
    this(15);
  }
  Snout(int radius) {
    baseRadius = radius;
    noseRadius = (int) (radius * random(0.5, 1));
  }
  public void draw() {
    pushStyle();
    fill(baseColor);
    ellipse(0, 0, baseRadius*2, baseRadius*2);
    fill(noseColor);
    noStroke();
    pushMatrix();
    translate(0, (noseRadius - baseRadius)/2);
    ellipse(0, 0, noseRadius*2, noseRadius*2);
    popMatrix();
    popStyle();
  }
}

