PFont font;
Grid grid;
String[] charlist;

void setup(){
  size(1280, 640);
  background(0);
  surface.setResizable(true);

  grid = new Grid(80);

  String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-^\\@[];:,./_!\"#$%&'()=~|`{}+*<>?_";
  charlist = chars.split("");

  font = createFont("Century", 32);
  fill(255);
  textFont(font,40);

  for(int i=0; i < grid.panes.size();i=i+1){
    float rand_angle = random(100);
    float rand_size = random(100);
    int index = round(random(0,charlist.length-1));
    pushMatrix();
    translate(grid.getXByIndex(i) +40,grid.getYByIndex(i) +40);
    for(int j=0; j < 10;j=j+1){
      rotate(radians(100+rand_angle));
      text(charlist[index], 0, 0);
    }
    popMatrix();
  }
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

    }
  }
}
