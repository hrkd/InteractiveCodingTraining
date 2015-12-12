class Util{
  Util(){
  }

  //減衰させる
  public void fade(color c){
    fill(c);
    rect(0,0,width,height);
  }

  //マウススピードを得る
  public float mouseSpeed(){
    float dx = mouseX - pmouseX;
    float dy = mouseY - pmouseY;
    return sqrt(dx * dx + dy * dy);
  }

  public int getRed(color argb){
    int r = (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
    return r;
  }

  public int getGreen(color argb){
    int g = (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
    return g;
  }

  public int getBlue(color argb){
    int b = argb & 0xFF;          // Faster way of getting blue(argb)
    return b;
  }

  public int getAlpha(color argb){
    int a = (argb >> 24) & 0xFF;
    return a;
  }

  public void checkFontList(){
    String[] fontList = PFont.list();
    for (String f : fontList) { if (f.startsWith("Helvetica")) println(f); }
  }
}

