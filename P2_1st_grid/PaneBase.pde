class PaneBase{
  public int _x;
  public int _y;
  public int _s;

  PaneBase(int x, int y, int s){
    _x = x;
    _y = y;
    _s = s;
  }

  public boolean isTouch(){
    if((_x < mouseX && mouseX <= _x+_s) && (_y < mouseY && mouseY <= _y+_s)){
      return true;
    }else{
      return false;
    }
  }

  //減衰させる
  public void fade(){
    fill(0,5);
    rect(_x,_y,_s,_s);
  }

  public void draw(){
    noStroke();
    fill(random(100),20);
    rect(_x,_y,_s,_s);
  }
}
