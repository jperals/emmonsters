import geomerative.*;
import java.util.Date; // Required to use the Date class further down

boolean debug = false;
color backgroundColor;
Emmonster emmonster;

void setup() {
  size(500, 600);
  smooth();
  backgroundColor = color(191, 191, 191);
  RG.init( this );
  emmonster = new Emmonster();
  redraw();
}

void draw() {
}

void keyPressed() {
  switch(key) {
    case 'd':
      debug = !debug;
      redraw();
      break;
    case 'r':
      emmonster = new Emmonster();
      redraw();
      break;
    case 's':
      Date date = new Date(); // Including the system time in the screenshot file name allows us to keep any screenshots we want instead of overriding the same file all the time
      String formattedDate = new java.text.SimpleDateFormat("yyyy-MM-dd.kk.mm.ss").format(date.getTime());
      background(255, 255, 255);
      emmonster.draw();
      saveFrame("screenshots/screenshot-" + formattedDate + "-######.png");
      redraw();
      break;
  }
}

void redraw() {
  background(backgroundColor);
  emmonster.draw();
}
