class Particle {
  double myX, myY, mySpeed, myAngle;
  int myColor;
  //int[] codeList;
  
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
    text("Click and move your mouse to break out of the Matrix",40,40);
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

class Explosion extends Particle {
  Explosion(){
    myX = 300;
    myY = 300;
    mySpeed = (Math.random()*10);
    myAngle = (Math.random()*(2*Math.PI));//(int)(Math.random()*(4*Math.PI));
    myColor = color(0, 219, 58);
  }
  
  void move(){
    myX = myX + (Math.cos(myAngle)*mySpeed);
    myY = myY + (Math.sin(myAngle)*mySpeed);
  }
}//end Explosion() class

Particle[] redPill = new Particle[500];
Particle[] bluePill = new Particle[500];

void setup(){
  size(600,600);
  noStroke();
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
       for(int i = 5; i < redPill.length; i++)
         redPill[i] = new Particle();
       for(int i = 0; i < 5; i++)
         redPill[i] = new Oddball();
    } else if (key == 'r' || key == 'R') {
       for(int i = 5; i < bluePill.length; i++)
         bluePill[i] = new Explosion();
       for(int i = 0; i < 5; i++)
         bluePill[i] = new Oddball();    
    } else {
       //uh?
    }  
  }
}

void draw(){
  fill(0,0,0);
  rect(0,0,600,600);
  if(keyPressed){
    if (key == 'b' || key == 'B') {
       for(int i = 5; i < bluePill.length; i++)
         bluePill[i] = new Particle();
       for(int i = 0; i < 5; i++)
         bluePill[i] = new Oddball();
    } else if (key == 'r' || key == 'R') {
        for(int i = 0; i < redPill.length; i++){
          redPill[i].move();
          redPill[i].show();
        }    
    } else {
       //uh?
    }
  }
}

void mousePressed(){
  for(int i = 0; i < redPill.length; i++){
    redPill[i].myX = mouseX;
    redPill[i].myY = mouseY;
  }
  for(int i = 0; i < redPill.length; i++){
    bluePill[i].myX = mouseX;
    bluePill[i].myY = mouseY;
  }
  //noLoop();
}
