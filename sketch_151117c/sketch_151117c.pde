void setup(){
  size(1280, 640);
  background(230);
  noStroke();
  colorMode(HSB, 100);
}

void draw(){
  float dx = mouseX - pmouseX;
  float dy = mouseY - pmouseY;
  float speed = sqrt(dx * dx + dy * dy);    
  int limit = 50; 

  speed = (speed > limit) ? limit*2 : speed*2;

  Point point = new Point(speed);
  //point.refresh();
}

class Point{
  float speed;

  //init
  Point(float sp){
    speed = sp;
    stroke(speed,70,80);
    strokeWeight((100-speed)/2);

    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  //void refresh(){
  //}
}

