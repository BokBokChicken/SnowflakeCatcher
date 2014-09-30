//Right mouse button to draw.  Left mouse button to erase.
SnowFlake [] dots;
void setup()
{
  size(300,300);
  background(0);
  dots = new SnowFlake[200];
  for(int i = 0; i < dots.length; i++)
  {
    dots[i] = new SnowFlake();
  }
}
void draw()
{
  for(int i = 0; i < dots.length; i++)
  {
    dots[i].erase();
    dots[i].lookDown();
    dots[i].move();
    dots[i].wrap();
    dots[i].show();
  }
}
void mouseDragged()
{
  if(mousePressed == true && mouseButton == RIGHT)
  {
    fill(15,158,253);
    noStroke();
    ellipse(mouseX,mouseY,10,10);
  }
  else if(mousePressed == true && mouseButton == LEFT)
  {
    fill(0);
    noStroke();
    ellipse(mouseX,mouseY,15,15);
  }
}
void keyPressed()
{
  if(key == 'r')
  {
    for(int i = 0; i < dots.length; i++)
    {
      dots[i].reset();
    }
  }
}
class SnowFlake
{
  int snowFlakeX, snowFlakeY;
  boolean isMoving;
  SnowFlake()
  {
    snowFlakeX = (int)(Math.random()*294)+3;
    snowFlakeY = (int)(Math.random()*294)+3;
    isMoving = true;
  }
  void show()
  {
    fill(255);
    stroke(0);
    ellipse(snowFlakeX,snowFlakeY,5,5);
  }
  void lookDown()
  {
    if(get(snowFlakeX,snowFlakeY+4) != color(0))
    {
      isMoving = false;
    }
    else if(get(snowFlakeX+2,snowFlakeY+4) != color(0))
    {
      isMoving = false;
    }
    else if(get(snowFlakeX-2,snowFlakeY+4) != color(0))
    {
      isMoving = false;
    }
    else
    {
      isMoving = true; 
    }
  }
  void erase()
  {
    fill(0);
    ellipse(snowFlakeX,snowFlakeY,7,7);
  }
  void move()
  {
    if(isMoving == true)
    {
      snowFlakeY = snowFlakeY + 1;
    }
  }
  void wrap()
  {
    if(snowFlakeY > 294)
    {
      snowFlakeY = 0;
    }
  }
  void reset()
  {
    background(0);
    snowFlakeX = (int)(Math.random()*299)+1;
    snowFlakeY = (int)(Math.random()*299)+1;
    isMoving = true;
  }
}
