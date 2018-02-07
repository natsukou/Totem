Ashi []a;    //the 4 feet of totem
Body []b;    //the 4 parts of body of totem
Head []h;    //1 head of totem
Kin []k;     //kin between totem's feet and body
Muscle []m;   //muscle connects the body together
int newBody=4;
int newAshi=4;
int newHead=1;
int newKin=4;
int newMuscle=4;
float rest;

void setup(){
  size(600, 600);
  h= new Head[newHead];
  for (int i=0; i<h.length; i++) {
    h[i]=new Head(300, 300);
  }
  
  //array of body
  b= new Body[newBody];
  for (int i=0; i<b.length; i++) {
    if(i==0){
    b[i]=new Body(300-40, 300);
    }
    if(i==1){
    b[i]=new Body(300, 300-40);
    }
    if(i==2){
    b[i]=new Body(300+40, 300);
    }
    if(i==3){
    b[i]=new Body(300, 300+40);
    }
  }
  
  //array of ashi
  a= new Ashi[newAshi];
  for (int i=0; i<a.length; i++) {
    if(i==0){
    a[i]=new Ashi(300-85, 300);
    }
    if(i==1){
    a[i]=new Ashi(300, 300-85);
    }
    if(i==2){
    a[i]=new Ashi(300+85, 300);
    }
    if(i==3){
    a[i]=new Ashi(300, 300+85);
    }
  }
  k=new Kin[newKin];
  for (int i=0; i<k.length; i++) {
    k[i]=new Kin(a[i], b[i]);
  }
  m=new Muscle[newMuscle];
  for (int i=0; i<m.length; i++) {
    m[i]=new Muscle(b[i], h[0]);
  }
}

void draw(){
  background(255);
  if(mousePressed==true){
    cursor(HAND);
  }
  else{
    cursor(CROSS);
  }
  for (int i=0; i<m.length; i++) {
    m[i].call();
  }
  for (int i=0; i<k.length; i++) {
    k[i].call();
  }
  for (int i=0; i<h.length; i++) {
    h[i].call();
  }
  for (int i=0; i<b.length; i++) {
    b[i].call();
    if(i==0){
    b[i].totem();
    }
  }
  for (int i=0; i<a.length; i++) {
    a[i].call();
  }
  
}

void mousePressed(){
  for (int i=0; i<b.length; i++) {
    b[i].press();
  }
  for (int i=0; i<a.length; i++) {
    a[i].press();
  }
}

void mouseDragged(){
  for (int i=0; i<a.length; i++) {
    a[i].drag();
  }
}

void mouseReleased(){
  for (int i=0; i<b.length; i++) {
    b[i].release();
  }
  for (int i=0; i<a.length; i++) {
    a[i].release();
  }
  
}