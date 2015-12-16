class Grid{
  public ArrayList<Pane> panes;
  private int pSize;

  Grid(int paneSize,PGraphics pg){
    pSize = paneSize;
    panes = new ArrayList<Pane>();
    for(int h=0;h<height/paneSize;h++){
      for(int w=0;w<width/paneSize;w++){
        Pane pane = new Pane(w*paneSize, h*paneSize, paneSize);
        if(pane.isFilled(pg)){
          panes.add(pane);
        }
      }
    }
  }

  void draw(){
    for(int i=0;i<panes.size();i++){
      panes.get(i).draw();
    }
  }

  void drawByIndex(int index){
    panes.get(index).draw();
  }

  int getIndex(int _x,int _y){
    return (width/pSize)*(_y/pSize) + (_x/pSize);
  }

  int getXByIndex(int index){
    return panes.get(index)._x;
  }

  int getYByIndex(int index){
    return panes.get(index)._y;
  }
}

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

