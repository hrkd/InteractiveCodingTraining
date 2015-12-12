Grid grid;

void setup(){
  size(1280, 640);
  surface.setResizable(true);
  background(230);
  noStroke();

  grid = new Grid(20);
}

void draw(){
  grid.draw();
}
