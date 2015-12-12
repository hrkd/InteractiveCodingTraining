PFont font;
int count = 0;
int wi = 80;
int he = 80;

void setup(){
  font = createFont("Century", 32);
  size(1280, 640);
  surface.setResizable(true);
  noStroke();
  //colorMode(HSB, 100);
  background(0);
}

void draw(){
  //マウスの距離
  float dx = mouseX - pmouseX;
  float dy = mouseY - pmouseY;
  float speed = sqrt(dx * dx + dy * dy);

  int limit = 50;
  speed = (speed > limit) ? limit*2 : speed*2;

  //translate(0,0);
  //noStroke();
  //rotate(0);
  //fill(255,30);
  //rect(0,0,width,height);
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
      int gridNumX = width/wi;
      int gridNumY = height/he;

      int xPoint = count % gridNumX;
      int yPoint = count / gridNumX;

      translate(xPoint*wi + wi/2,yPoint*he + he/2);

      float rand_angle = random(100);
      float rand_size = random(100);

      //fill(random(30),100,30);
      fill(255);

      for(int i=0; i < 10;i=i+1){
        rotate(radians(100+rand_angle));
        textFont(font,40);
        text(key, 0, 0);
      }
      count = count+1;
    }
  }
}
