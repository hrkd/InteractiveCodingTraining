PFont font;
Grid grid;

int count = 0;

void setup(){
  size(1280, 640);
  background(0);
  surface.setResizable(true);

  grid = new Grid(80);
  font = createFont("Century", 32);
}

void draw(){
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
      translate(grid.getXByIndex(count) +40,grid.getYByIndex(count) +40);

      float rand_angle = random(100);
      float rand_size = random(100);

      fill(255);

      for(int i=0; i < 0;i=i+1){
        rotate(radians(100+rand_angle));
        textFont(font,40);
        text(key, 0, 0);
      }
      count = count+1;
    }
  }
}
