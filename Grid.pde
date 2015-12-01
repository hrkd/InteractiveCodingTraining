class Grid{
  public static final String CLASS_NAME = "Grid";

  int _x;
  int _y;
  int _w;
  int _h;
  boolean updown;

  Grid(int x,int y,int w,int h){
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

