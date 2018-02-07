class Ashi {
  //variables
  PVector location;
  PVector position;//this is to store our initial location
  PVector velicity;
  PVector acceleration;
  PVector gravity;
  PVector f;

  float x, y, r=30;
  float mass=3.0;
  float damping=0.9;
  boolean press, locked;

  //constructor
  Ashi(float _x, float _y) {
    x=_x;
    y=_y;

    velicity=new PVector(1, 1);
    acceleration=new PVector(0, 0);
    gravity=new PVector(0, 0.01);
    location=new PVector(x, y);
    position=location.copy();
  }
  //function
  void checkBoundaries() {
    if (location.x<0||location.x>width) {
      velicity.x=-velicity.x;
    }
    if (location.y<0||location.y>height) {
      velicity.y=-velicity.y;
    }
  }

  void display() {
    noStroke();
    fill(#5CB78C);
    rect(location.x-r/2, location.y-r/2, r, r, r/7);
    stroke(#8EC1A9);
    fill(#4A8E6E);
    ellipse(location.x, location.y, r*5/7, r*5/7);
    //fill(#145F3C);
    //ellipse(location.x, location.y, r*3/7, r*3/7);
  }
  void move() {

    velicity.add(acceleration);
    velicity.mult(damping);
    location.add(velicity);
    acceleration.mult(0);
    //move according to grids
  }

  void applyForce(PVector force) {
    PVector f=force.copy(); //copy
    f.div(mass);
    acceleration.add(f);
  }
  void press() {
    if ((mouseX>location.x-r/2&&mouseX<location.x+r/2)&&
      (mouseY>location.y-r/2&&mouseY<location.y+r/2)) { 
      press=true;
    } else {
      press=false;
    }
    if (press==true) {
      locked=true;
    } else {
      locked=false;
    }
  }
  void release() {
    locked=false;
  }
  void drag() {
    if (locked==true) {
      location.x=mouseX;
      location.y=mouseY;
    }
  }//drag the ashi of the totem
  void call() {

    checkBoundaries();
    display();
    move();
    applyForce(gravity);
  }
}//end of class