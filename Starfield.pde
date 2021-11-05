//RED PILL PARTICLES
class Particle {
  double myX, myY, mySpeed, myAngle;
  int myColor;
  
  Particle(){
    myX = -1000;
    myY = -1000;
    mySpeed = (Math.random()*10);
    myAngle = (Math.random()*(2*Math.PI));//(int)(Math.random()*(4*Math.PI));
    myColor = color(0, 219, 58);//color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  
  void move(){
    myX = myX + (Math.cos(myAngle)*mySpeed);
    myY = myY + (Math.sin(myAngle)*mySpeed);
    if(myX > mouseX + 100)
      myX = myX + 4;
    if(myX < mouseX - 100)
      myX = myX - 4;
    if(myY > mouseY - 100)
      myY = myY - 4;
    if(myY < mouseY + 100)
      myY = myY + 4;
  }//end move()
  
  void show(){
    fill(myColor);
    textSize(20);
    text((int)(Math.random()*9),(float)myX,(float)myY);
    fill(255);
    textSize(15);
    text("Click and move your mouse to break out of the Matrix",40,660);
    //text("+",(float)myX+10,(float)myY);
    //ellipse((float)myX,(float)myY,(int)(Math.random()*30)-10,(int)(Math.random()*30)-10);
  }//end show()
}//end particle class

//RED BUGS
class Oddball extends Particle {
  Oddball(){
    myX = -1000;
    myY = -1000;
    mySpeed = 4;
    myAngle = (Math.random()*(2*Math.PI));
    myColor = color(255,0,0);
  }
  
  void move(){
    myX = myX + (Math.cos(myAngle)*mySpeed) + (Math.random()*3)-1;
    myY = myY + (Math.sin(myAngle)*mySpeed) + (Math.random()*3)-1;
  }//end move()
  
  void show(){
    noFill();
    stroke(myColor);
    strokeWeight(2);
    ellipse((float)myX,(float)myY,17,10);
    //legs
    line((float)myX-5,(float)myY+4,(float)myX-7,(float)myY+9);//bottom left
    line((float)myX,(float)myY+5,(float)myX,(float)myY+10);//bottom middle
    line((float)myX+5,(float)myY+4,(float)myX+7,(float)myY+9);//bottom right
    line((float)myX+5,(float)myY-5,(float)myX+7,(float)myY-9);//top right
    line((float)myX,(float)myY-5,(float)myX,(float)myY-10);//top middle
    line((float)myX-5,(float)myY-5,(float)myX-7,(float)myY-10);//top middle
  }//end show()
}

//BLUE PILL CODE PARTICLES
class Explosion extends Particle {
  Explosion(){
    myX = -1000;
    myY = -1000;
    mySpeed = (Math.random()*10);
    myAngle = (Math.random()*(2*Math.PI));//(int)(Math.random()*(4*Math.PI));
    myColor = color(0, 219, 58);
  }
  
  void move(){
    myX = myX + (Math.cos(myAngle)*mySpeed);
    myY = myY + (Math.sin(myAngle)*mySpeed);
    //reset particles to center
    if(myX > 700 || myX < 0 || myY > 700 || myY < 0){
      myX = mouseX;
      myY = mouseY;
    }
  }//end move();
    
  void show(){
    fill(myColor);
    textSize(20);
    text((int)(Math.random()*9),(float)myX,(float)myY);
    fill(255);
    textSize(15);
    text("You're trapped in the Matrix!",40,640);
    text("Try to move your mouse, but there's no escaping...",40,660);
    text("...Unless you take that red pill now.",40,680);
  }//end show()
}//end Explosion() class

Particle[] spray = new Particle[500];

void setup(){
  size(600,700);
  textSize(15);
  noStroke();
  //default list filled by red pill code
  for(int i = 5; i < spray.length; i++)
    spray[i] = new Particle();
  for(int i = 0; i < 5; i++)
    spray[i] = new Oddball();
}

void draw(){
  background(0);
  for(int i = 0; i < spray.length; i++){
    spray[i].move();
    spray[i].show();
  }
  //instructions
  fill(100);
  rect(0,0,600,115);
  fill(255,255,255);
  text("So, knowing what you know...", 40, 30);
  text("Do you want to leave the Matrix?", 40, 50);
  text("Or will you wake up and remember this as all a dream?",40,70);
  text("Press 'R' to leave and 'B' to stay.", 40, 90);
}

void mousePressed(){
  for(int i = 0; i < spray.length; i++){
    spray[i].myX = mouseX;
    spray[i].myY = mouseY;
  }
}

void keyPressed() {  
  if (key == 'b' || key == 'B') {
    for(int i = 5; i < spray.length; i++)
      spray[i] = new Explosion();
    for(int i = 0; i < 5; i++)
      spray[i] = new Oddball();
  }
  if (key == 'r' || key == 'R') {
    for(int i = 5; i < spray.length; i++)
      spray[i] = new Particle();
    for(int i = 0; i < 5; i++)
      spray[i] = new Oddball();
  }
  for(int i = 0; i < spray.length; i++){
    spray[i].move();
    spray[i].show();
  }    
}
