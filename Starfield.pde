class Particle {
  double myX, myY, mySpeed, myAngle;
  int myColor;
  
  Particle(){
    myX = 300;
    myY = 300;
    mySpeed = (Math.random()*10);
    myAngle = (Math.random()*(2*Math.PI));//(int)(Math.random()*(4*Math.PI));
    myColor = color(255,0,0);//color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  
  void move(){
    myX = myX + (Math.cos(myAngle)*mySpeed);
    myY = myY + (Math.sin(myAngle)*mySpeed);
  }//end move()
  
  void show(){
    fill(myColor);
    ellipse((float)myX,(float)myY,(int)(Math.random()*5)+5,(int)(Math.random()*5)+5);
  }//end show()
}//end particle class

class Oddball extends Particle {
  Oddball(){
    myX = 250;
    myY = 250;
    mySpeed = 2;
    myAngle = (Math.random()*(2*Math.PI));
    myColor = color(255);
  }
  
  void move(){
    myX = myX + (Math.cos(myAngle)*mySpeed) + (Math.random()*3)-1;
    myY = myY + (Math.sin(myAngle)*mySpeed) + (Math.random()*3)-1;
  }//end move()
  
  void show(){
    fill(myColor);
    ellipse((float)myX,(float)myY,10,10);
  }//end show()
}

Particle[] spray = new Particle[500];

void setup(){
  size(600,600);
  noStroke();
  for(int i = 5; i < spray.length; i++)
    spray[i] = new Particle();
  for(int i = 0; i < 5; i++)
    spray[i] = new Oddball();
}

void draw(){
  fill(0,0,0,20);
  rect(0,0,600,600);
  for(int i = 0; i < spray.length; i++){
    spray[i].move();
    spray[i].show();
  }
}

void mousePressed(){
  for(int i = 0; i < spray.length; i++){
    spray[i].myX = mouseX;
    spray[i].myY = mouseY;
  }
}
