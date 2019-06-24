class ParticleSystem {
  ArrayList<Particle> particles;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  void addParticle(float x, float y) { 
    particles.add(new Particle(new PVector(x, y))); //add new particle with the map values
  }

  void run(FlowField ff) {
    //use functions from particle class
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      p.run();
      p.follow(ff);
    }
  }
}
