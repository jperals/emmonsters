class HairMass extends BodyPart {
  HairMass() {
    this(20, 70);
  }
  HairMass(int minHairLength, int maxHairLength) {
    int numberOfHairs = (int)random(7, 20);
    float rotateAngle = PI / 2,
          rotateAngleIncrement = 2 * PI / (float) numberOfHairs;
    for(int i = 0; i < numberOfHairs; i++) {
      int hairLength = (int)random(minHairLength, maxHairLength);
      int hairWidth = (int)(random(minHairLength, maxHairLength)/3);
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

