import 'dart:html';
import 'dart:math';

CanvasRenderingContext2D context;
num ballPos = 0;

void main() {
  CanvasElement canvas = query("#container");
  context = canvas.context2D;

  window.setImmediate(() {
    requestRedraw();
  });
}

requestRedraw() {
  window.requestAnimationFrame(draw);
}

void draw(num _) {
  drawBackground();
  drawBall();
  
  requestRedraw();
}

void drawBackground() {
  rect(0, 0, 500, 400, '#000');
}

void drawBall() {
  ballPos += 2;
  rect(ballPos, 200, 10, 10, '#fff');
}

void rect(num x, num y, num width, num height, String color) {
  context.fillStyle = color;
  
  context.beginPath();
  context.rect(x, y, width, height);
  context.fill();
  context.closePath();
}
