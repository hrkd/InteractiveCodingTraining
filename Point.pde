class Point{
  public static final String CLASS_NAME = "Point";

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
