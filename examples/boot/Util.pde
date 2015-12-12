class Util{
  Util(){
  }

  //減衰させる
  public void fade(int alpha){
    fill(0,alpha);
    rect(0,0,width,height);
  }

  //マウススピードを得る
  public float mouseSpeed(){
    float dx = mouseX - pmouseX;
    float dy = mouseY - pmouseY;
    return sqrt(dx * dx + dy * dy);
  }
}

