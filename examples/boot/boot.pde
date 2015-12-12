import controlP5.*;
ControlP5 cp5;

Grid grid;
Particles particles;
Util util;
//int v1;

void setup(){
  size(1280, 640);
  background(0,100);

  grid = new Grid(10);
  particles = new Particles(500);
  util = new Util();

  //cp5 = new ControlP5(this);
  //cp5.addSlider("v1")
  //  .setPosition(40, 40)
  //  .setSize(200, 20)
  //  .setRange(1, 30)
  //  .setValue(1)
  //  .setColorCaptionLabel(color(20,20,20));
}

void draw(){
  if (mousePressed && (mouseButton == LEFT)) {
  } else if (mousePressed && (mouseButton == RIGHT)) {
  } else {
  }

  //util.fade(20);
  //particles.draw();
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
