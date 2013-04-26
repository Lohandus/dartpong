import 'dart:html';
import 'dart:math';
import 'package:game_loop/game_loop_html.dart';

CanvasRenderingContext2D context;
num ballPos = 0;

void main() {
  CanvasElement canvas = query("#container");
  context = canvas.context2D;

  GameLoop gameLoop = new GameLoopHtml(canvas);
  
  gameLoop.onUpdate = ((gameLoop) {
    ballPos += 300 * gameLoop.dt;
  });
  
  gameLoop.onRender = ((gameLoop) {
    drawBackground();
    drawBall();
  });
  
  gameLoop.start();
}

void drawBackground() {
  rect(0, 0, 500, 400, '#000');
}

void drawBall() {
  rect(ballPos, 200, 10, 10, '#fff');
}

void rect(num x, num y, num width, num height, String color) {
  context.fillStyle = color;
  
  context.beginPath();
  context.rect(x, y, width, height);
  context.fill();
  context.closePath();
}
