int a = 400;
int b = 100; 
int c = 1;
int count=0;
float msart=45;
float mstop=315;
void setup() {
  size (800,200);
}
  
void draw() {
  background(0);
  stroke(0,0,255);
  strokeWeight(10);
  line(0,50,800,50);
  line(0,150,800,150);
  noStroke();
  fill(232,250,45);
  if(count%2==0){
    arc(a,b,30,30,radians(msart),radians(mstop));}
    else{arc(a,b,30,30,radians(msart+180),radians(mstop+180));}
    
    
    
    
    msart-=2;
    mstop+=2;
    if(msart<=0 && mstop>=360){
      msart=45;mstop=315;}

  
  a = (a+c) % width; 
  if (a==0){ 
  a=800;
}
}

void keyPressed(){
  if (keyCode == ' ') {
    c = - c;
    count+=1;
  }
}
