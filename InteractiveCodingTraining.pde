//ArrayList<Point> points;
ArrayList<Grid> gridz;
int wi = 20;
int he = 20;
int count = 0;

void setup(){
  size(1280, 640);
  surface.setResizable(true);
  background(230);
  noStroke();
  //colorMode(HSB, 100);

  //points = new ArrayList<Point>();
  //

  //Gridを画面上に配置する
  gridz = new ArrayList<Grid>();

  for(int w=0;w<width/wi;w++){
    for(int h=0;h<height/he;h++){
      gridz.add(new Grid(w*wi,h*he, wi, he));
    }
  }
}

void draw(){
  //マウスの距離
  float dx = mouseX - pmouseX;
  float dy = mouseY - pmouseY;
  float speed = sqrt(dx * dx + dy * dy);

  int limit = 50;
  speed = (speed > limit) ? limit*2 : speed*2;

  //Draw Grid
  for(int i=0;i<gridz.size();i++){
      gridz.get(i).countTimer();
      gridz.get(i).fade();

      //g.drawGray();
      //g.drawLine();
      if (mousePressed && (mouseButton == LEFT)) {
        gridz.get(i).drawPixel();
      }
  }

  ////マウスに移動があったらpointを生成
  //if(speed != 0){
  //  points.add(new Point(speed));
  //}

  ////pointsを描画
  //for(int i=0; i<points.size(); i++) {
  //  Point point = points.get(points.size()-1);
  //  point.display();

  //  if(points.size()>100) {
  //    //TODO: 減衰をどう実装するか
  //    Point p = points.get(0);
  //    //println(p.getSpeed());
  //    points.remove(0);
  //  }
  //}
}



