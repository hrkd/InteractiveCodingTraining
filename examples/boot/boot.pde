Grid grid;
Particles particles;
Util util;

void setup(){
  size(1280, 640);
  background(0,100);

  grid = new Grid(10);
  particles = new Particles(500);
  util = new Util();
}

void draw(){
  if (mousePressed && (mouseButton == LEFT)) {
  } else if (mousePressed && (mouseButton == RIGHT)) {
  } else {
  }

  util.fade(20);
  particles.draw();
  //grid.draw();
}

void keyPressed() {
  if (key != CODED) {
    switch(key) {
    case DELETE:
    case BACKSPACE:
      break;
      // disable those keys
    case TAB:
    case ENTER:
    case RETURN:
    case ESC:
      break;
    default:
      println(key);
    }
  }
}
