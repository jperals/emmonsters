import geomerative.*;
import java.util.Date; // Required to use the Date class further down

boolean debug = false;
color backgroundColor;
Mascot mascot;

void setup() {
  size(500, 600);
  smooth();
  backgroundColor = color(192, 192, 192);
  RG.init( this );
  mascot = new Mascot();
}

void draw() {
  background(backgroundColor);
  mascot.draw();
}

void keyPressed() {
  switch(key) {
    case 'd':
      debug = !debug;
      break;
    case 'r':
      mascot = new Mascot();
      break;
    case 's':
      Date date = new Date(); // Including the system time in the screenshot file name allows us to keep any screenshots we want instead of overriding the same file all the time
      String formattedDate = new java.text.SimpleDateFormat("yyyy-MM-dd.kk.mm.ss").format(date.getTime());
      saveFrame("screenshots/screenshot-" + formattedDate + "-######.png");
      break;
  }
}
