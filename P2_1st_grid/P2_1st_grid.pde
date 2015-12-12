ArrayList<Point> points;
ArrayList<Pixel> pixelz;
int wi = 20;
int he = 20;

void setup(){
  size(1280, 640);
  surface.setResizable(true);
  background(230);
  noStroke();
  //colorMode(HSB, 100);

  //points = new ArrayList<Point>();
  pixelz = new ArrayList<Pixel>();

  for(int w=0;w<width/wi;w++){
    for(int h=0;h<height/he;h++){
      pixelz.add(new Pixel(w*wi,h*he, wi, he));
    }
  }
}


void draw(){

  float dx = mouseX - pmouseX;
  float dy = mouseY - pmouseY;
  float speed = sqrt(dx * dx + dy * dy);

  int limit = 50;
  speed = (speed > limit) ? limit*2 : speed*2;

  for(int i=0;i<pixelz.size();i++){
      Pixel p = pixelz.get(i);
      //p.drawGray();
      p.drawLineUpdate();
      p.drawLine();
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

class Pixel{
  int _x;
  int _y;
  int _w;
  int _h;
  boolean updown;

  Pixel(int x,int y,int w,int h){
    _x = x;
    _y = y;
    _w = w;
    _h = h;

    drawLineInit();
  }

  //モザイク
  void drawGray(){
    fill(random(0, 100));
    rect(_x,_y,_w,_h);
  }

  void drawLineInit(){
    noStroke();
    fill(230);
    rect(_x,_y,_w,_h);

    stroke(0);
    strokeWeight(1);

    if(round(random(0,1)) == 1){
      line(_x, _y, _x+_w, _y+_h);
    }else{
      line(_x, _y+_h, _x+_w, _y);
    }
  }

  //ライン
  void drawLine(){
    stroke(0);
    strokeWeight(1);
    int distX = abs(mouseX - _x);
    int distY = abs(mouseY - _y);

    if( distX < 15 && distY < 15 ){
      noStroke();
      fill(230);
      rect(_x,_y,_w,_h);

      stroke(255,0,0);
      strokeWeight(1);

      if(updown){
        line(_x, _y, _x+_w, _y+_h);
      }else{
        line(_x, _y+_h, _x+_w, _y);
      }
    }
  }

  void drawLineUpdate(){
    if(mouseX > pmouseX && pmouseY > mouseY ){
      //println("右上り");
      updown = false;
    }else if(mouseX > pmouseX && mouseY > pmouseY ){
      //println("右下がり");
      updown = true;
    }else if(pmouseX > mouseX && pmouseY > mouseY ){
      //println("左上がり");
      updown = true;
    }else if(pmouseX > mouseX && mouseY > pmouseY ){
      //println("左下がり");
      updown = false;
    }
  }
}


class Point{
  float speed;

  //init
  Point(float sp){
    speed = sp;
  }
  void display(){
    stroke(speed,70,80);
    strokeWeight((100-speed)/2);

    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  float getSpeed(){
    return speed;
  }
}
