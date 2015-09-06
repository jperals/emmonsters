class HairMass extends BodyPart {
  HairMass() {
    this(20, 70, (int)random(7, 20), 2*PI);
  }
  HairMass(int minHairLength, int maxHairLength) {
    this(minHairLength, maxHairLength, (int)random(7, 20), 2*PI);
  }
  HairMass(int minHairLength, int maxHairLength, int numberOfHairs) {
    this(minHairLength, maxHairLength, numberOfHairs, 2*PI);
  }
  HairMass(int minHairLength, int maxHairLength, int numberOfHairs, float totalAngle) {
    float rotateAngle = PI / 2,
          rotateAngleIncrement = totalAngle / (float) numberOfHairs;
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

