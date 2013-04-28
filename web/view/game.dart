part of view;

class Game {
  
  final CanvasRenderingContext2D _context;
  final Model.Game _model;
  
  Game(this._context, this._model);
  
  void draw() {
    _drawBackground();
    _drawBall();
    _drawRect2(_model.racketP1, '#fff');
    _drawRect2(_model.racketP2, '#fff');
  }
  
  void _drawBackground() {
    _drawRect(0, 0, _model.width, _model.height, '#000');
    
    for (int p = 7; p < _model.height; p += 17)
      _drawRect(_model.middleX - 1, p, 2, 8, '#fff');
  }

  void _drawBall() {
    _drawRect(_model.ballPosition.x, _model.ballPosition.y, 8, 8, '#fff');
  }

  void _drawRect(num x, num y, num width, num height, String color) {
    _context.fillStyle = color;
    
    _context.beginPath();
    _context.rect(x, y, width, height);
    _context.fill();
    _context.closePath();
  }

  void _drawRect2(Rectangle r, String color) {
    _drawRect(r.x, r.y, r.width, r.height, color);
  }
  
}