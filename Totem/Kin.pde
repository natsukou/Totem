class Kin {
  //variables
  Ashi a;
  Body b;
  //int restLength=50;
  float k=0.7;
  float rest;
  float r=30;


  //constructor
  Kin(Ashi _a, Body _b) {
    a=_a;
    b=_b;
    rest=len(); //calc the len inside the class
  }

  //function
  void call() {
    update();
    display();
  }

  void update() {
    PVector force=PVector.sub(a.location, b.location);
    float d=force.mag();
    //calculate our displacement-x
    float x=d-rest;


    force.normalize();//the direction between the two unit vector
    //the Hookes Law  F=-k*x
    force.mult(-1*k*x);
    a.applyForce(force);
    force.mult(-1);
    b.applyForce(force);
  }
  void display() {
    pushStyle();
    stroke(#8EC1A9);
    line(a.location.x, a.location.y, b.location.x, b.location.y);
    popStyle();
  }
  //calculate our initial length
  float len() {
    float l=PVector.dist(a.position, b.position);
    return l;
  }
}//end of class