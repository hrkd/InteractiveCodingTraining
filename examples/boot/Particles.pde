class Particles{
  public ArrayList<Particle> par;

  Particles(int pSize){
    par = new ArrayList<Particle>();
    for(int i=0;i<pSize;i++){
      par.add(new Particle());
    }
  }

  public void draw(){
    for(int i=0;i<par.size();i++){
      par.get(i).refresh();
      par.get(i).draw();
    }
  }
}
