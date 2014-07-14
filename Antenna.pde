class Antenna extends BodyPart implements Cloneable {
  public int antennaLength;
  private int detail,
              antennaWidth;
  private RShape flagellum;
  Antenna() {
    this((int)random(3, 10));
  }
  Antenna(int detail) {
    this.detail = detail;
    antennaWidth = (int)random(5, 8);
    antennaLength = (int)((float)antennaWidth * random(5, 12));
    vertices = new RPoint[detail];
    float angle = PI/2 + PI/3,
          angleIncrement = TWO_PI/detail;
    for(int i = 0; i < detail; i++) {
      float baseWidth = antennaWidth*(1 + (noise(i) - 0.5)/5),
            baseLength = baseWidth * antennaLength / antennaWidth;
      float x = baseWidth*cos(angle),
            y = baseLength*sin(angle);
      vertices[i] = new RPoint(x, y);
      angle += angleIncrement;
    }
    flagellum = toBezier(new IrregularCircle(antennaWidth*2).shape.getPoints());
    flagellum.translate(0, -antennaLength*0.75); 
    shape = toBezier(vertices).union(flagellum);
    setColor((int)random(191, 255), (int)random(220, 255), (int)random(127, 200));
  }
  public Antenna cloneReversed() {
    Antenna reversedAntenna = new Antenna(detail);
    RPoint[] verticesInverted = new RPoint[detail];
    for(int i = 0; i < detail; i++) {
      verticesInverted[i] = new RPoint(- vertices[i].x, vertices[i].y);
    }
    reversedAntenna.antennaLength = this.antennaLength;
    reversedAntenna.shape = toBezier(vertices).union(flagellum);
    return reversedAntenna;
  }
  public void translate(float x, float y) {
    shape.translate(x, y);
  }
}
