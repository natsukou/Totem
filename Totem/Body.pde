class Body {
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
  Body(float _x, float _y) {
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
  }
  void totem() {
    //draw a pattern of the first part of the body
    //to make it "totem"
    strokeWeight(3);
    stroke(#3EBDED);
    line(location.x-r*4/9, location.y-r/5, location.x+r*3/7, location.y-r/5);
    line(location.x+r*3/7, location.y-r/5, location.x+r*3/7, location.y+r*4/9);
    line(location.x-r*4/9, location.y, location.x+r*2/9, location.y);
    line(location.x+r*2/9, location.y, location.x+r*2/9, location.y+r*4/9);
    line(location.x-r*4/9, location.y+r/5, location.x+r/17, location.y+r/5);
    line(location.x+r/17, location.y+r/5, location.x+r/17, location.y+r*4/9);
  }
  void move() {

    velicity.add(acceleration);
    velicity.mult(damping);
    location.add(velicity);
    acceleration.mult(0);
    //move according to grids
  }
  void balloon() {
    float rHe=0.0;  //radius of helium balloon
    if ((mouseX>location.x-r/2&&mouseX<location.x+r/2)&&(mouseY>location.y-r/2&&mouseY<location.y+r/2)) {
      press=true;
    } else {
      press=false;
    }

    if (locked==true) {
      noStroke();
      fill(#FFDD7E);
      rHe+=30;
      ellipse(location.x-r*2, location.y-r*2, rHe, rHe);
      noFill();
      stroke(255);
      arc(location.x-r*2, location.y-r*2, rHe*2/3, rHe*2/3, -HALF_PI, -HALF_PI/6);
      noStroke();
      stroke(100);
      strokeWeight(0.5);
      line(location.x-r*2+rHe/2, location.y-r*2+rHe/2, location.x-r/2, location.y-r/2);
      acceleration.add(-rHe/45, -rHe/45);
    }
  }

  void press() {
    if (press==true) {
      locked=true;
    } else {
      locked=false;
    }
  }
  void release() {
    locked=false;
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
    balloon();
  }
}//end of class