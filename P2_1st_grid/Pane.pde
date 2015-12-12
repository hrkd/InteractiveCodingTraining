class Pane extends PaneBase{
  boolean updown;

  Pane(int x,int y,int s){
    super(x,y,s);
    drawInit();
  }

  //ライン
  public void drawInit(){
    noStroke();
    fill(230);
    rect(_x,_y,_s,_s);

    stroke(0);
    strokeWeight(1);

    if(round(random(0,1)) == 0){
      line(_x, _y, _x+_s, _y+_s);
    }else{
      line(_x, _y+_s, _x+_s, _y);
    }
  }

  //ライン
  public void draw(){
    stroke(0);
    strokeWeight(1);

    if(isTouch()){
      noStroke();
      fill(230);
      rect(_x,_y,_s,_s);

      stroke(255,0,0);
      strokeWeight(1);

      if(updown){
        line(_x, _y, _x+_s, _y+_s);
      }else{
        line(_x, _y+_s, _x+_s, _y);
      }
    }
  }

  void refresh(){
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

