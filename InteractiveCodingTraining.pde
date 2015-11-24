ArrayList<Point> points;

void setup(){
  size(1280, 640);
  surface.setResizable(true);
  background(230);
  noStroke();
  colorMode(HSB, 100);

  points = new ArrayList<Point>();
}

void draw(){
  float dx = mouseX - pmouseX;
  float dy = mouseY - pmouseY;
  float speed = sqrt(dx * dx + dy * dy);
  int limit = 50;

  speed = (speed > limit) ? limit*2 : speed*2;

  //マウスに移動があったらpointを生成
  if(speed != 0){
    points.add(new Point(speed));
  }

  //pointsを描画
  for(int i=0; i<points.size(); i++) {
    Point point = points.get(points.size()-1);
    point.display();

    if(points.size()>100) {
      //TODO: 減衰をどう実装するか
      points.remove(0);
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
}
