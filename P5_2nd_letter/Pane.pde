Util colUtil;
class Pane extends PaneBase{
  Pane(int x, int y, int s){
    super(x,y,s);
    colUtil = new Util();
  }

  public void draw(){
    //super.draw();
  }

  public boolean isFilled(){
    color org = color(0);
    color c = get(_x, _y);
    return org != c;
  }
}
