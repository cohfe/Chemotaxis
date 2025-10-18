//declare bacteria variables here
Bacteria[] bob;
void setup()
{
  //initialize bacteria variables here
  bob = new Bacteria[250];
  size(800, 800);
  for (int i = 0; i < bob.length; i++) {
    bob[i] = new Bacteria();
  }
}
void draw()
{
  //move and show the bacteria
  background(0);
  for (int i = 0; i < bob.length; i++) {
    bob[i].show();
    bob[i].walk();
  }
}
class Bacteria
{
  //lots of java!
  int myX, myY, myColor;
  double mySize, mySpeed;
  Bacteria()
  {
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    mySize = 30;
    mySpeed = (Math.random()+0.3);
  }

  void show()
  {
    fill(myColor);
    ellipse(myX, myY, (int)mySize, (int)mySize);
  }

  void walk()
  {
    mySize -= 0.1;
    if (mySize < 2) {
      respawn();
    }

    if (mouseX > myX) {
      myX = myX + (int)(((Math.random()*5) - 1)*mySpeed);
    } else {
      myX = myX + (int)(((Math.random()*5) - 4)*mySpeed);
    }
    if (mouseY > myY) {
      myY = myY + (int)(((Math.random()*5) - 1)*mySpeed);
    } else {
      myY = myY + (int)(((Math.random()*5) - 4)*mySpeed);
    }

    if ((myX < mouseX + 50) && (myX > mouseX - 50) && (myY < mouseY + 50) && (myY > mouseY - 50)) {
      if (mySize < 80) {
        mySize += 2;
      }
    }
  }

  void respawn()
  {
    mySize = (int)(Math.random()*5) + 25;
    int random = (int)(Math.random()*4 + 1);

    if (random == 4) {
      myX = (int)(Math.random()*800);
      myY = 0;
    } else if (random == 3) {
      myX = (int)(Math.random()*800);
      myY = 800;
    } else if (random == 2) {
      myX = 0;
      myY = (int)(Math.random()*800);
    } else {
      myX = 800;
    myY = (int)(Math.random()*800);
    }
  }
}
