Ball redBall;
Ball blueBall;
Ball greenBall;
Line magentaLine;
Line yellowLine;
Line cyanLine;

class Ball{
  color clr;
  float x;
  float y;
  float dx;
  float dy;
  float radius;
  
  Ball(color tempClr, float tempX, float tempY, float tempDx, float tempDy, float tempRadius) {
    clr = tempClr;
    x = tempX;
    y = tempY;
    dx = tempDx;
    dy = tempDy;
    radius = tempRadius;
  }
  
  void move(){
    if (x + radius + dx >= width || x - radius + dx <= 0){
      dx *= -1;
    }
    if (y + radius + dy >= height || y - radius + dy <= 0){
      dy *= -1;
    }
    x += dx;
    y += dy;
  }
  
  void draw(){
    fill(clr);
    stroke(clr);
    ellipse(x, y, radius*2, radius*2);
  }
}

class Line{
  color clr;
  float weight;
  
  Line(color tempClr, float tempWeight){
    clr = tempClr;
    weight = tempWeight;
  }
  
  void draw(float startX, float startY, float endX, float endY){
    stroke(clr); 
    strokeWeight(weight);
    line(startX, startY, endX, endY);
  }
}

void setup(){
  size(400, 400);
  redBall = new Ball(color(255, 0, 0), 50, 50, 3, 7, 20);
  blueBall = new Ball(color(0, 0, 255), width - 50, height - 50, 8, 2, 15);
  greenBall = new Ball(color(0, 255, 0), width/2, width/2, -3, -4, 25);
  magentaLine = new Line(color(255, 0, 255), 1);
  yellowLine = new Line(color(255, 255, 0), 1);
  cyanLine = new Line(color(0, 255, 255), 1);
}

void draw(){
  background(0,0,0);
  greenBall.move();
  redBall.move();
  blueBall.move();
  magentaLine.draw(redBall.x, redBall.y, blueBall.x, blueBall.y);
  yellowLine.draw(greenBall.x, greenBall.y, redBall.x, redBall.y);
  cyanLine.draw(greenBall.x, greenBall.y, blueBall.x, blueBall.y);
  greenBall.draw();
  redBall.draw();
  blueBall.draw();
}
