import 'dart:html';
import 'package:game_loop/game_loop_html.dart';
import 'model/model.dart' as Model;
import 'view/view.dart' as View;

void main() {
  CanvasElement canvas = query("#container");
  
  Model.Game model = new Model.Game(796, 480);
  View.Game view = new View.Game(canvas.context2D, model);
  
  GameLoop gameLoop = new GameLoopHtml(canvas);
  
  gameLoop.onUpdate = (gameLoop) {
    model.update(gameLoop.dt);
  };
  
  gameLoop.onRender = (gameLoop) {
    view.draw();
  };
  
  gameLoop.start();
}