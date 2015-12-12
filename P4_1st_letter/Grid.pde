class Grid{
  public ArrayList<Pane> panes;
  private int pSize;

  Grid(int paneSize){
    pSize = paneSize;
    panes = new ArrayList<Pane>();
    for(int h=0;h<height/paneSize;h++){
      for(int w=0;w<width/paneSize;w++){
        panes.add(new Pane(w*paneSize, h*paneSize, paneSize));
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
