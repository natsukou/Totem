class Muscle {
  Body a; 
  Head b;
  float k=1.2;
  float rest;


  //constructor
  Muscle(Body _a, Head _b) {
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
    stroke(#FFAD6A);
    strokeWeight(2);
    line(a.location.x, a.location.y, b.location.x, b.location.y);
    popStyle();
  }
  //calculate our initial length
  float len() {
    float l=PVector.dist(a.position, b.position);
    return l;
  }
}//end of class