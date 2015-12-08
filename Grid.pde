class Grid{
  public static final String CLASS_NAME = "Grid";

  int _x;
  int _y;
  int _w;
  int _h;
  boolean updown;
  int count = 0;
  int frame;
  boolean timerStart = false;

  Grid(int x,int y,int w,int h){
    _x = x;
    _y = y;
    _w = w;
    _h = h;

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

  int getIndex(int wid,int _x,int _y,int _w,int _h){
    return (wid/_w)*(_y/_h) + (_x/_w);
  }

  boolean isTouch(){
    if((_x < mouseX && mouseX <= _x+_w) && (_y < mouseY && mouseY <= _y+_h)){
      println(getIndex(1280,_x,_y,_w,_h));

      return true;
    }else{
      return false;
    }
  }

  //減衰させる
  void fade(){
    fill(0,5);
    rect(_x,_y,_w,_h);
  }

  //ポインタの位置なら描画する
  void drawPixel(){
    if(isTouch()){
      noStroke();
      fill(100,100);
      rect(_x,_y,_w,_h);
      timerStart = true;
    }
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

