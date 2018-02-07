class Head {
  //variables
  PVector location;
  PVector position;//this is to store our initial location
  PVector velicity;
  PVector acceleration;
  PVector gravity;
  PVector f;
  PVector eyeDir;  //direction of the eye according to the location of the mouse
  PVector mouseL;  //store the location of mouse

  float x, y, r=30;
  //float eyeX, eyeY; //the centre of the eye of totem
  float mass=3.0;
  float damping=0.9;
  boolean press, locked;

  //constructor
  Head(float _x, float _y) {
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
    fill(#FFA024);
    rect(location.x-r/2, location.y-r/2, r, r, r/7);
    fill(255);
    ellipse(location.x, location.y, r*5/7, r*5/7);

    //define the location of the eye
    mouseL=new PVector(mouseX, mouseY);
    eyeDir=PVector.sub(location, mouseL);
    eyeDir.normalize();
    eyeDir.mult(r/12);
    fill(0);
    ellipse(location.x-eyeDir.x, location.y-eyeDir.y, r*5/9, r*5/9);
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
  void call() {

    checkBoundaries();
    display();
    move();
    applyForce(gravity);
  }
}//end of class