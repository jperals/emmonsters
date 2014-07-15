class HairMass extends BodyPart {
  HairMass() {
    this(20, 40);
  }
  HairMass(int minHairLength, int maxHairLength) {
    int numberOfHairs = (int)random(7, 14);
    float rotateAngle = PI / 2,
          rotateAngleIncrement = 2 * PI / (float) numberOfHairs;
    for(int i = 0; i < numberOfHairs; i++) {
      int hairWidth = (int)random(3, 10),
          hairLength = (int)random(minHairLength, maxHairLength);
      if(i >= numberOfHairs / 2) {
        hairLength = - hairLength;
      }
      Feather hair = new Feather(hairWidth, hairLength);
      if(i >= numberOfHairs / 2) {
        hair.shape.rotate(PI);
      }
      rotateAngle += rotateAngleIncrement;
      hair.shape.rotate(rotateAngle);
      shape = shape.union(hair.shape);
    }
  }
  public void draw() {
    pushStyle();
    fill(fillColor);
    shape.draw();
    popStyle();
  }
}

