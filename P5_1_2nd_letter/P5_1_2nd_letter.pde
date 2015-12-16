import controlP5.*;
ControlP5 cp5;
Grid grid;
Particles particles;
Util util;
PGraphics pg;

int pv1 = 0;
int v1;
color bg;

PFont font;
String txt;

void setup(){
  size(1280, 640);
  pg = createGraphics(1280, 640, JAVA2D);

  bg = color(0);
  background(bg);
  txt = "";

  util = new Util();

  cp5 = new ControlP5(this);
  cp5.addSlider("v1")
    .setPosition(40, 40)
    .setSize(200, 20)
    .setRange(1, 30)
    .setValue(1)
    .setColorCaptionLabel(color(20,20,20));

  font = createFont("Helvetica-Bold", 300);

  drawPg();

  //5x5のグリッドを文字上に作成
  grid = new Grid(5,pg);

  //グリッドの数でパーティクル作成
  particles = new Particles(grid.panes.size());

  setParticleParameters();
}

void genPar(){
  int pGridSize = grid.panes.size();

  //グリッドを作成しなおす
  grid = new Grid(5,pg);

  //パーティクルの数を調整
  particles.addParticleByNumber(grid.panes.size() - pGridSize);

  setParticleParameters();

  particles.setRenge(v1);
}

void setParticleParameters(){
  //パーティクルの終着点をグリッドのxyとする
  for(int i=0;i<particles.par.size();i++){
    particles.par.get(i).setGoal(
      grid.panes.get(i)._x,
      grid.panes.get(i)._y
    );
  }
}

void draw(){
  util.fade(color(0,50));
  particles.draw();

  //ランダム度合いを再設定する
  if(pv1 != v1){
    particles.setRenge(v1);
    pv1 = v1;
  }
}

void drawPg(){
  pg.beginDraw();
  pg.background(bg);
  pg.fill(255);
  pg.textFont(font);
  pg.textAlign(CENTER, CENTER);
  pg.text(txt, width/2, height/2);
  pg.endDraw();
}


void keyPressed() {
  if (key != CODED) {
    switch(key) {
    case DELETE:
    case BACKSPACE:
      String[] charlist;
      charlist = txt.split("");
      charlist = shorten(charlist);
      txt = join(charlist, "");

      drawPg();
      genPar();

      break;
      // disable those keys
    case TAB:
    case ENTER:
    case RETURN:
    case ESC:
      break;
    default:
      if(txt != ""){
        txt = txt + key;
      }else{
        txt = String.valueOf(key);
      }

      drawPg();
      genPar();
    }
  }
}

