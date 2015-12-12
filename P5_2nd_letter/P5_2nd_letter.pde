import controlP5.*;

ControlP5 cp5;
Grid grid;
Particles particles;
Util util;
int pv1 = 0;
int v1;

PFont font;

void setup(){

  size(1280, 640);
  color bg = color(0);
  background(bg);

  util = new Util();

  cp5 = new ControlP5(this);
  cp5.addSlider("v1")
    .setPosition(40, 40)
    .setSize(200, 20)
    .setRange(1, 30)
    .setValue(1)
    .setColorCaptionLabel(color(20,20,20));

  font = createFont("Helvetica-Bold", 300);

  fill(1);
  textFont(font);
  textAlign(CENTER, CENTER);
  text("Hello", width/2, height/2);

  //10x10のグリッドを文字上に作成
  grid = new Grid(5);

  //グリッドの数でパーティクル作成
  particles = new Particles(grid.panes.size());

  //パーティクルの終着点をグリッドのxyとする
  for(int i=0;i<particles.par.size();i++){
      particles.par.get(i).setStart(grid.panes.get(i)._x,grid.panes.get(i)._y);
      particles.par.get(i).setGoal(grid.panes.get(i)._x,grid.panes.get(i)._y);
  }
}

void draw(){
  util.fade(color(0,50));
  particles.draw();
  if(pv1 != v1){
    particles.setRenge(v1);
    pv1 = v1;
  }
}
