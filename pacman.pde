int a = 400;
int b = 100; 
int c = 1;
float d=1.5;
int count=0;
float msart=45;
float mstop=315;
int numPellets = 20;
int[] pelletX = new int[numPellets];
int[] pelletY = new int[numPellets];
boolean[] pelletVisible = new boolean[numPellets];
int score=0;
float fruitX;
float ghostX;
boolean eaten =false;
int sum=0;
int timer;



void setup() {
  size (800,200);
   int pelletSpacing = width / numPellets;
  for (int i = 0; i < numPellets; i++) {
    pelletX[i] = i * pelletSpacing + pelletSpacing / 2;
    pelletY[i] = height / 2;
    pelletVisible[i] = true;
  }
     fruitX = int(random(0, width));
 ghostX = int(random(0, width)); 
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
    
         for (int i = 0; i < numPellets; i++) {
    if (pelletVisible[i] ) {
      fill(255);
      noStroke();
      ellipse(pelletX[i], pelletY[i], 5, 5);
    }
  } 
    
    fill(0, 255, 0);
  circle(fruitX, b, 30);

    if(eaten ==true){
    fill(255, 255, 255);}else{
      fill(255,0,0);}
  square(ghostX, 85, 30);
  ghostX= (ghostX+d) % width; 
      if (ghostX==0){ 
  ghostX=800;
}
  
    
    sum=sum+int(random(0,4));


if (sum%150==0) {
    d = - d;
   
  }



    
    msart-=2;
    mstop+=2;
    if(msart<=0 && mstop>=360){
      msart=45;mstop=315;}

  
  a = (a+c) % width; 
  
  if (a==0){ 
  a=800;
}

checkPelletCollision();
 fill(255);
  textSize(24);
  text("Score: " + score, 10, 20);
  
  
  if(score%20==0){
    for (int i = 0; i < numPellets; i++) {
    pelletVisible[i] =true;
      fill(255);
      noStroke();
      ellipse(pelletX[i], pelletY[i], 5, 5);
    
  } }
  

if (dist(a, b, fruitX, b) < 30) {
    eaten =true;
    timer=0;
    
    fruitX = int(random(0, width));
     
  }
  
  if(eaten ==true){
    timer++; 
   
    if(timer>100){
    eaten=false;}
  }
  
  
  
  
  
if(dist(a,b, ghostX, b) < 30 && eaten ==false) {
   
    textSize(24);
    text("Game Over!", 350, 35);
    noLoop();
  } 
  
}


void keyPressed(){
  if (keyCode == ' ') {
    c = - c;
    count+=1;
  }
}


  void checkPelletCollision() {
  for (int i = 0; i < numPellets; i++) {
    if (pelletVisible[i] && dist(a, b, pelletX[i], pelletY[i]) < 25) {
      pelletVisible[i] = false;
      score++;
    }
  }
}
