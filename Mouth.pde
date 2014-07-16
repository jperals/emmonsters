class Mouth extends BodyPart {
  private int numberOfTeeth,
              toothWidth,
              toothHeight;
  private IrregularEllipse[] teeth;
  private float mouthWidth,
                mouthHeight;
  private RPolygon polygon;
  Mouth(float mouthWidth, float mouthHeight) {
    this.mouthWidth = mouthWidth;
    this.mouthHeight = mouthHeight;
    toothWidth = (int)random(10, 20);
    toothHeight = (int)random(15, 25);
    numberOfTeeth = (int)min(((int)random(1.5) + (int)random(1.5)) * 2, (mouthWidth - 8)/toothWidth);
    if(numberOfTeeth % 2 != 0) {
      numberOfTeeth --;
    }
    polygon = new RPolygon();
    polygon.addPoint(- mouthWidth/2, 0);
    polygon.addPoint(0, mouthHeight);
    polygon.addPoint(mouthWidth/2, 0);
    if(numberOfTeeth > 0) {
      teeth = new IrregularEllipse[numberOfTeeth];
      for(int i = 0; i < numberOfTeeth; i += 2) {
        int thisToothHeight = (int)(toothHeight / ((float)i/8 + 1));
        IrregularEllipse toothRight = new IrregularEllipse(toothWidth, thisToothHeight, 4);
        RPoint displacement = new RPoint(toothWidth*(i/2 + 0.5), mouthHeight/2 - 3 * i + thisToothHeight / 2);
        toothRight.shape.translate(displacement.x, displacement.y);
        teeth[i] = toothRight;
        IrregularEllipse toothLeft = new IrregularEllipse(toothWidth, thisToothHeight, 4);
        toothLeft.shape.translate(-displacement.x, displacement.y);
        teeth[i + 1] = toothLeft;
      }
    }
  }
  public void draw() {
    for(int i = numberOfTeeth -1; i >= 0; i--) {
      pushStyle();
      fill(#FFFFEE);
      teeth[i].shape.draw();
      popStyle();
    }
    RPoint[] points = polygon.getPoints();
    pushStyle();
    fill(fillColor);
    //println(red(fillColor), green(fillColor), blue(fillColor));
    pushStyle();
    noStroke();
    quad(points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y, 0, points[0].y - 2*(points[1].y - points[0].y));
    //triangle(-mouthWidth, -mouthHeight, mouthWidth, -mouthHeight, 0, mouthHeight);
    popStyle();
    drawCurve(points);
    popStyle();
  }
  public void moveBy(float x, float y) {
    polygon.translate(x, y);
    for(int i = 0; i < numberOfTeeth; i++) {
      teeth[i].shape.translate(x, y);
    }
  } 
}

