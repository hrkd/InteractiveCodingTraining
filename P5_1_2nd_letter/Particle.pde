class Particle{
  private float _x;
  private float _y;
  private float _px;
  private float _py;
  private float GoalX;
  private float GoalY;

  private float speed;
  private float randomRenge;

  Particle(){
    _x = random(0,width);
    _y = random(0,height);
    GoalX = width/2;
    GoalY = height/2;
    speed = random(1,5);
    randomRenge = random(1,15);
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

    _x = (random(-randomRenge,randomRenge) + _x) + (GoalX- _x) / speed;
    _y = (random(-randomRenge,randomRenge) + _y) + (GoalY- _y) / speed;
  }

  public void setStart(int x,int y){
    _x = x;
    _y = y;
  }

  public void setGoal(int x,int y){
    GoalX = x;
    GoalY = y;
  }

  public void setRenge(float renge){
    randomRenge = renge;
  }
}
