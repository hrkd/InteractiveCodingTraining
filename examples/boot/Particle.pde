class Particle{
  private float _x;
  private float _y;
  private float _px;
  private float _py;

  private float speed;
  private float randomRenge;

  Particle(){
    _x = width/2;
    _y = height/2;
    speed = random(1,100);
    randomRenge = random(10,25);
  }

  public void draw(){
    stroke(255,50);
    fill(255,100);
    line(_px,_py,_x,_y);
    ellipse(_x,_y,2,2);
  }

  public void refresh(){
    _px = _x;
    _py = _y;
    //randomRengeの分遊ばせながらも、mouseとの距離を詰める
    _x = (random(-randomRenge,randomRenge) + _x) + (mouseX - _x) / speed;
    _y = (random(-randomRenge,randomRenge) + _y) + (mouseY - _y) / speed;
  }
}

