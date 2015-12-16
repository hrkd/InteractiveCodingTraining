class Particles{
  public ArrayList<Particle> par;

  Particles(int pSize){
    par = new ArrayList<Particle>();
    for(int i=0;i<pSize;i++){
      par.add(new Particle());
    }
  }

  public void addParticleByNumber(int val){

    for(int i=0;i<abs(val);i++){
      if(val > 0){
        par.add(new Particle());
      }else{
        par.remove(par.size()-1);
      }
    }
  }


  public void draw(){
    for(int i=0;i<par.size();i++){
      //par.get(i).refresh();
      //par.get(i).setGoal(mouseX,mouseY);
      par.get(i).refresh();
      par.get(i).draw();
    }
  }

  public void setRenge(float renge){
    for(int i=0;i<par.size();i++){
      par.get(i).setRenge(random(1,renge));
    }
  }
}
