class GridSecond extends Grid {
  public static final String CLASS_NAME = "GridSecond";
  boolean updown;
  int count = 0;
  int frame;
  boolean timerStart = false;

  GridSecond(int x,int y,int w,int h){
    super(x,y,w,h);
    //drawLineInit();
    setTimer(1);
  }

  void setTimer(int sec){
    frame = sec*30;
  }

  boolean isLimit(){
    if(count > frame){
      count = 0;
      return true;
    }else{
      return false;
    }
  }

  void countTimer(){
    if(timerStart){
      count = count+1;
    }

    //exec
    if(isLimit()){
      drawExplosion(_x,_y,_w,_h,100);

      timerStart = false;
    }
  }

  //モザイク
  void drawGray(int rand){

    if(random(0, rand) > 1){
      fill(0);
    }else{
      fill(255,100);
    }
    rect(_x,_y,_w,_h);
  }

  void drawLineInit(){
    noStroke();
    fill(0);
    rect(_x,_y,_w,_h);
  }

  //マウスが近くにいるか
  boolean isNear(){
    int limit = 15;
    int distX = abs(mouseX - _x);
    int distY = abs(mouseY - _y);
    return distX < limit && distY < limit;
  }

  void wait(int frame){
    int count = 0;
    while(count < frame){
      count = count+1;
    }
  }

  void drawExplosion(int _x,int _y,int _w,int _h,int alp){
    fill(255, alp-10);
    rect(_x,_y-_h*2,_w,_h);

    rect(_x+_w*2,_y,_w,_h);

    rect(_x,_y+_h*2,_w,_h);

    rect(_x-_w*2,_y,_w,_h);
  }

  //ライン
  void drawLine(){
    drawLineUpdate();
    stroke(0);
    strokeWeight(1);

    if( isNear() ){
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

